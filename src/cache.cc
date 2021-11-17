#include "cache.h"
#include "ooo_cpu.h"
#include "set.h"
#include "uncore.h"

#include <vector>

#include <iterator>

ostream &operator<<(ostream &os, const PACKET &packet) {
  return os << " cpu: " << packet.cpu << " instr_id: " << packet.instr_id
            << " Translated: " << +packet.translated << " address: " << hex
            << packet.address << " full_addr: " << packet.full_addr << dec
            << " full_virtual_address: " << hex << packet.full_virtual_address
            << " full_physical_address: " << packet.full_physical_address << dec
            << "Type: " << +packet.type
            << " event_cycle: " << packet.event_cycle
            << " current_core_cycle: " << current_core_cycle[packet.cpu]
            << endl;
};

void CACHE::handle_fill() {
  // handle fill
  uint32_t fill_cpu = (MSHR.next_fill_index == MSHR_SIZE)
                          ? NUM_CPUS
                          : MSHR.entry[MSHR.next_fill_index].cpu;
  if (fill_cpu == NUM_CPUS)
    return;

  if (MSHR.next_fill_cycle <= current_core_cycle[fill_cpu]) {

#ifdef SANITY_CHECK
    if (MSHR.next_fill_index >= MSHR.SIZE)
      assert(0);
#endif

    uint32_t mshr_index = MSHR.next_fill_index;

/*
#ifdef BYPASS_TRANSLATIONS
    if (MSHR.entry[mshr_index].type == LOAD_TRANSLATION){
      bool return_from_fill = true;

#ifdef PTW_L1D
      if (cache_type == IS_L1D && ooo_cpu[fill_cpu].L2C.fill_translation.find(MSHR.entry[mshr_index].address) == ooo_cpu[fill_cpu].L2C.fill_translation.end()){
         PTW_interface[fill_cpu]->return_data(&MSHR.entry[mshr_index]);

      }else if (cache_type == IS_L2C && ooo_cpu[fill_cpu].L2C.dont_fill_translation.find(MSHR.entry[mshr_index].address) != ooo_cpu[fill_cpu].L2C.dont_fill_translation.end()){
         upper_level_dcache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
         ooo_cpu[fill_cpu].L2C.dont_fill_translation.erase(MSHR.entry[mshr_index].address);
        // cout << hex << "fill address: " << (MSHR.entry[mshr_index].address) << dec << endl;

      }else {
	 return_from_fill = false;
      }
#endif

#ifdef PTW_L2C
      if (cache_type == IS_L2C && ooo_cpu[fill_cpu].L2C.dont_fill_translation.find(MSHR.entry[mshr_index].address) != ooo_cpu[fill_cpu].L2C.dont_fill_translation.end()){
	PTW_interface[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
        ooo_cpu[fill_cpu].L2C.dont_fill_translation.erase(MSHR.entry[mshr_index].address);
        //cout << hex << "fill address: " << (MSHR.entry[mshr_index].address) << dec << endl;

      }else {
         return_from_fill = false;
      }

#endif


      if (return_from_fill){

        // COLLECT STATS
        sim_miss[fill_cpu][MSHR.entry[mshr_index].type]++;
        sim_access[fill_cpu][MSHR.entry[mshr_index].type]++;

#ifdef PT_STATS
       if ((cache_type == IS_L1D || cache_type == IS_L2C || cache_type == IS_LLC) && MSHR.entry[mshr_index].type == LOAD_TRANSLATION){
         assert(MSHR.entry[mshr_index].translation_level > 0 && MSHR.entry[mshr_index].translation_level < 6);
         sim_pt_miss[fill_cpu][MSHR.entry[mshr_index].translation_level-1]++;
         sim_pt_access[fill_cpu][MSHR.entry[mshr_index].translation_level-1]++;
       }
#endif
        translations_not_filled++;

        if (warmup_complete[fill_cpu]) {
          uint64_t current_miss_latency = (current_core_cycle[fill_cpu] - MSHR.entry[mshr_index].cycle_enqueued);
          total_miss_latency += current_miss_latency;
          load_translation_miss_latency += current_miss_latency;
        }

        MSHR.remove_queue(&MSHR.entry[mshr_index]);
        MSHR.num_returned--;

        update_fill_cycle();
        return;

      }
    }
#endif
*/
    // find victim
    uint32_t set = get_set(MSHR.entry[mshr_index].address), way;
    way = (this->*find_victim)(fill_cpu, MSHR.entry[mshr_index].instr_id, set,
                               block[set], MSHR.entry[mshr_index].ip,
                               MSHR.entry[mshr_index].full_addr,
                               MSHR.entry[mshr_index].type);


#ifdef LLC_BYPASS
    if ((cache_type == IS_LLC) &&
        (way == LLC_WAY)) { // this is a bypass that does not fill the LLC

      // update replacement policy
      (this->*update_replacement_state)(
          fill_cpu, set, way, MSHR.entry[mshr_index].full_addr,
          MSHR.entry[mshr_index].ip, 0, MSHR.entry[mshr_index].type, 0);

      // COLLECT STATS
      sim_miss[fill_cpu][MSHR.entry[mshr_index].type]++;
      sim_access[fill_cpu][MSHR.entry[mshr_index].type]++;

#ifdef PT_STATS
      if ((cache_type == IS_L1D || cache_type == IS_L2C || cache_type == IS_LLC) && MSHR.entry[mshr_index].type == LOAD_TRANSLATION){
	assert(MSHR.entry[mshr_index].translation_level > 0 && MSHR.entry[mshr_index].translation_level < 6);
        sim_pt_miss[fill_cpu][MSHR.entry[mshr_index].translation_level-1]++;
        sim_pt_access[fill_cpu][MSHR.entry[mshr_index].translation_level-1]++;
      }
#endif

      // check fill level
      if (MSHR.entry[mshr_index].fill_level < fill_level) {

        if (fill_level == FILL_L2) {
          if (MSHR.entry[mshr_index].fill_l1i) {
            upper_level_icache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
          }
          if (MSHR.entry[mshr_index].fill_l1d) {
            upper_level_dcache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
          }
        } else {
          if (MSHR.entry[mshr_index].instruction)
            upper_level_icache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
          if (MSHR.entry[mshr_index].is_data)
            upper_level_dcache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
        }
      }

      if (warmup_complete[fill_cpu]) {
        uint64_t current_miss_latency = (current_core_cycle[fill_cpu] -
                                         MSHR.entry[mshr_index].cycle_enqueued);
        total_miss_latency += current_miss_latency;

	if (MSHR.entry[mshr_index].type == LOAD) {
	  load_miss_latency += current_miss_latency;
	}else if(MSHR.entry[mshr_index].type == LOAD_TRANSLATION) {
          load_translation_miss_latency += current_miss_latency;
	}
      }

      MSHR.remove_queue(&MSHR.entry[mshr_index]);
      MSHR.num_returned--;

      update_fill_cycle();

      return; // return here, no need to process further in this function
    }
#endif

    uint8_t do_fill = 1;

    // Prefetch translation requests should be dropped in case of page fault
    if (cache_type == IS_ITLB || cache_type == IS_DTLB ||
        cache_type == IS_STLB) {
      if (cache_type == IS_DTLB &&
          MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D)
        assert(0);
      if (MSHR.entry[mshr_index].data == (UINT64_MAX >> LOG2_PAGE_SIZE)) {
        do_fill = 0; // Drop the prefetch packet

        // COLLECT STATS
        if (MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D ||
            MSHR.entry[mshr_index].type == PREFETCH_TRANSLATION) {
          pf_dropped++;
          //@Vasudha: if merged with prefetch_request from upper level
          if (cache_type == IS_STLB && MSHR.entry[mshr_index].fill_level == 1) {
            if (MSHR.entry[mshr_index].send_both_tlb) {
              upper_level_icache[fill_cpu]->return_data(
                  &MSHR.entry[mshr_index]);
              upper_level_dcache[fill_cpu]->return_data(
                  &MSHR.entry[mshr_index]);
            } else if (MSHR.entry[mshr_index].instruction)
              upper_level_icache[fill_cpu]->return_data(
                  &MSHR.entry[mshr_index]);
            else // data
              upper_level_dcache[fill_cpu]->return_data(
                  &MSHR.entry[mshr_index]);
          }

          // Add to procesed queue to notify L1D about dropped request due to
          // page fault
          if (cache_type == IS_STLB &&
              MSHR.entry[mshr_index].l1_pq_index != -1 &&
              MSHR.entry[mshr_index].fill_l1d !=
                  -1) //@Vishal: Prefetech request from L1D prefetcher
          {
            assert(MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D);
            PACKET temp = MSHR.entry[mshr_index];
            temp.data_pa = MSHR.entry[mshr_index].data;
            assert(temp.l1_rq_index == -1 && temp.l1_wq_index == -1);
            temp.read_translation_merged =
                0; //@Vishal: Remove this before adding to PQ
            temp.write_translation_merged = 0;
            if (PROCESSED.occupancy < PROCESSED.SIZE)
              PROCESSED.add_queue(&temp);
            else
              assert(0);
          } else if (cache_type == IS_STLB &&
                     MSHR.entry[mshr_index].prefetch_translation_merged &&
                     MSHR.entry[mshr_index].fill_l1d !=
                         -1) //@Vishal: Prefetech request from L1D prefetcher
          {
            assert(MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D);
            PACKET temp = MSHR.entry[mshr_index];
            temp.data_pa = MSHR.entry[mshr_index].data;
            temp.read_translation_merged =
                0; //@Vishal: Remove this before adding to PQ
            temp.write_translation_merged = 0;
            if (PROCESSED.occupancy < PROCESSED.SIZE)
              PROCESSED.add_queue(&temp);
            else
              assert(0);
          } else if (cache_type == IS_ITLB &&
                     (MSHR.entry[mshr_index].l1_pq_index != -1 ||
                      MSHR.entry[mshr_index].prefetch_translation_merged) &&
                     MSHR.entry[mshr_index].fill_l1i != -1) {
            assert(MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D);
            PACKET temp = MSHR.entry[mshr_index];
            temp.instruction_pa = MSHR.entry[mshr_index].data;
            assert(temp.l1_rq_index == -1 && temp.l1_wq_index == -1);
            temp.read_translation_merged = 0;
            temp.write_translation_merged = 0;
            if (ooo_cpu[0].ITLB.PROCESSED.occupancy <
                ooo_cpu[0].ITLB.PROCESSED.SIZE)
              ooo_cpu[0].ITLB.PROCESSED.add_queue(&temp);
            else
              assert(0);
          }
          MSHR.remove_queue(&MSHR.entry[mshr_index]);
          MSHR.num_returned--;
          update_fill_cycle();
          return;
        } else {
          // When prefetch translation gets merged with demand request (load)
          // Case 1 : STLB prefetch request merged (from prefetch queue) - mark
          // MSHR inflight and add to PTW.RQ Case 2 : Translation of L1D prefetch
          // request merged (from read queue) - mark MSHR inflight and add to
          // DTLB RQ

          MSHR.entry[mshr_index].returned = INFLIGHT;
          if (lower_level)
            lower_level->add_rq(&MSHR.entry[mshr_index]);
          update_fill_cycle();
          return;
        }
      }
    }
    // is this dirty?
    if (block[set][way].dirty) {

      // check if the lower level WQ has enough room to keep this writeback
      // request
      if (lower_level) {
        if (lower_level->get_occupancy(2, block[set][way].address) ==
            lower_level->get_size(2, block[set][way].address)) {

          // lower level WQ is full, cannot replace this victim
          do_fill = 0;
          lower_level->increment_WQ_FULL(block[set][way].address);
          STALL[MSHR.entry[mshr_index].type]++;

          DP(if (warmup_complete[fill_cpu]) {
            cout << "[" << NAME << "] " << __func__ << "do_fill: " << +do_fill;
            cout << " lower level wq is full!"
                 << " fill_addr: " << hex << MSHR.entry[mshr_index].address;
            cout << " victim_addr: " << block[set][way].tag << dec << endl;
          });
        } else {
          PACKET writeback_packet;

          writeback_packet.fill_level = fill_level << 1;
          writeback_packet.cpu = fill_cpu;
          writeback_packet.address = block[set][way].address;
          writeback_packet.full_addr = block[set][way].full_addr;
          writeback_packet.data = block[set][way].data;
          writeback_packet.instr_id = MSHR.entry[mshr_index].instr_id;
          writeback_packet.ip = 0; // writeback does not have ip
          writeback_packet.type = WRITEBACK;
          writeback_packet.event_cycle = current_core_cycle[fill_cpu];

          lower_level->add_wq(&writeback_packet);
        }
      }
#ifdef SANITY_CHECK
      else {
        // sanity check
        if (cache_type != IS_STLB)
          assert(0);
      }
#endif
    }

    if (do_fill) {

      //@Vasudha: For PC-offset DTLB prefetcher, in case of eviction, transfer
      //block from training table to trained table
      if (cache_type == IS_DTLB && block[set][way].valid == 1) {
        dtlb_prefetcher_cache_fill(
            MSHR.entry[mshr_index].full_addr, set, way,
            (MSHR.entry[mshr_index].type == PREFETCH) ? 1 : 0,
            block[set][way].address << LOG2_PAGE_SIZE,
            MSHR.entry[mshr_index].pf_metadata);
      }
      // update prefetcher
      if (cache_type == IS_L1I)
        l1i_prefetcher_cache_fill(
            fill_cpu,
            ((MSHR.entry[mshr_index].ip) >> LOG2_BLOCK_SIZE) << LOG2_BLOCK_SIZE,
            set, way, (MSHR.entry[mshr_index].type == PREFETCH) ? 1 : 0,
            ((block[set][way].ip) >> LOG2_BLOCK_SIZE) << LOG2_BLOCK_SIZE);
      if (cache_type == IS_L1D) {
        // Neelu: Sending virtual fill and evicted address to L1D prefetcher.

        uint64_t v_fill_addr, v_evicted_addr;
        map<uint64_t, uint64_t>::iterator ppage_check = inverse_table.find(
            MSHR.entry[mshr_index].full_addr >> LOG2_PAGE_SIZE);
        if (ppage_check == inverse_table.end()) {
          cout << "Inverse Mapping Failed! MSHR entry: "
               << MSHR.entry[mshr_index] << endl;
          assert(0);
        }
        v_fill_addr = (ppage_check->second) << LOG2_PAGE_SIZE;
        v_fill_addr |=
            (MSHR.entry[mshr_index].full_addr & ((1 << LOG2_PAGE_SIZE) - 1));

        // Now getting virtual address for the evicted address
        /*Neelu: Note that it is not always necessary that evicted address is a
         * valid address and is present in the inverse table, hence (1) do not
         * use the assert and (2) if it is not present, assign it to zero. */

        ppage_check = inverse_table.find(block[set][way].address >>
                                         (LOG2_PAGE_SIZE - LOG2_BLOCK_SIZE));
        if (ppage_check != inverse_table.end()) {
          v_evicted_addr = (ppage_check->second) << LOG2_PAGE_SIZE;
          v_evicted_addr |= ((block[set][way].address << LOG2_BLOCK_SIZE) &
                             ((1 << LOG2_PAGE_SIZE) - 1));
        } else
          v_evicted_addr = 0;

        l1d_prefetcher_cache_fill(
            v_fill_addr, MSHR.entry[mshr_index].full_addr, set, way,
            (MSHR.entry[mshr_index].type == PREFETCH) ? 1 : 0, v_evicted_addr,
            block[set][way].address << LOG2_BLOCK_SIZE,
            MSHR.entry[mshr_index].pf_metadata);
      }
      if (cache_type == IS_L2C)
        MSHR.entry[mshr_index].pf_metadata = l2c_prefetcher_cache_fill(
            MSHR.entry[mshr_index].address << LOG2_BLOCK_SIZE, set, way,
            (MSHR.entry[mshr_index].type == PREFETCH) ? 1 : 0,
            block[set][way].address << LOG2_BLOCK_SIZE,
            MSHR.entry[mshr_index].pf_metadata);
      if (cache_type == IS_LLC) {
        cpu = fill_cpu;
        MSHR.entry[mshr_index].pf_metadata = llc_prefetcher_cache_fill(
            MSHR.entry[mshr_index].address << LOG2_BLOCK_SIZE, set, way,
            (MSHR.entry[mshr_index].type == PREFETCH) ? 1 : 0,
            block[set][way].address << LOG2_BLOCK_SIZE,
            MSHR.entry[mshr_index].pf_metadata);
        cpu = 0;
      }

      // update replacement policy
      (this->*update_replacement_state)(
          fill_cpu, set, way, MSHR.entry[mshr_index].full_addr,
          MSHR.entry[mshr_index].ip, block[set][way].full_addr,
          MSHR.entry[mshr_index].type, 0);

#ifdef IDEAL_CACHE_FOR_TRANSLATION_ACCESS
 #ifdef IDEAL_L1D
      if (cache_type == IS_L1D && (MSHR.entry[mshr_index].type == LOAD_TRANSLATION ||
         MSHR.entry[mshr_index].type == PREFETCH_TRANSLATION ||
         MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D) &&
         unique_translation_access.find(MSHR.entry[mshr_index].full_addr >> LOG2_BLOCK_SIZE) != unique_translation_access.end() )
 #endif

 #ifdef IDEAL_L2
      if (cache_type == IS_L2C && (MSHR.entry[mshr_index].type == LOAD_TRANSLATION ||
         MSHR.entry[mshr_index].type == PREFETCH_TRANSLATION ||
         MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D) &&
         unique_translation_access.find(MSHR.entry[mshr_index].full_addr >> LOG2_BLOCK_SIZE) != unique_translation_access.end() )
 #endif
 
#ifdef IDEAL_L3
      if (cache_type == IS_LLC && (MSHR.entry[mshr_index].type == LOAD_TRANSLATION ||
         MSHR.entry[mshr_index].type == PREFETCH_TRANSLATION ||
         MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D) &&
	 unique_translation_access.find(MSHR.entry[mshr_index].full_addr >> LOG2_BLOCK_SIZE) != unique_translation_access.end() )
 #endif
      {


      }else{
        sim_miss[fill_cpu][MSHR.entry[mshr_index].type]++;
        sim_access[fill_cpu][MSHR.entry[mshr_index].type]++;
      }
#else
      // COLLECT STATS
      sim_miss[fill_cpu][MSHR.entry[mshr_index].type]++;
      sim_access[fill_cpu][MSHR.entry[mshr_index].type]++;

#endif

      // COLLECT STATS
      // sim_miss[fill_cpu][MSHR.entry[mshr_index].type]++;
      // sim_access[fill_cpu][MSHR.entry[mshr_index].type]++;

#ifdef PT_STATS
      if ((cache_type == IS_L1D || cache_type == IS_L2C || cache_type == IS_LLC) && MSHR.entry[mshr_index].type == LOAD_TRANSLATION){
        assert(MSHR.entry[mshr_index].translation_level > 0 && MSHR.entry[mshr_index].translation_level < 6);
        sim_pt_miss[fill_cpu][MSHR.entry[mshr_index].translation_level-1]++;
        sim_pt_access[fill_cpu][MSHR.entry[mshr_index].translation_level-1]++;
      }
#endif

      fill_cache(set, way, &MSHR.entry[mshr_index]);
      // RFO marks cache line dirty
      if (cache_type == IS_L1D) {
        if (MSHR.entry[mshr_index].type == RFO)
          block[set][way].dirty = 1;
      }

      // Neelu: Adding condition to ensure that STLB does not insert instruction
      // translations to Processed queue.
      if (cache_type == IS_STLB && MSHR.entry[mshr_index].l1_pq_index != -1 &&
          (MSHR.entry[mshr_index].send_both_tlb or
           !MSHR.entry[mshr_index]
                .instruction)) //@Vishal: Prefetech request from L1D prefetcher
      {

        PACKET temp = MSHR.entry[mshr_index];
        temp.data_pa = block[set][way].data;
        assert(temp.l1_rq_index == -1 && temp.l1_wq_index == -1);
        temp.read_translation_merged =
            0; //@Vishal: Remove this before adding to PQ
        temp.write_translation_merged = 0;
        if (PROCESSED.occupancy < PROCESSED.SIZE)
          PROCESSED.add_queue(&temp);
        else
          assert(0);
      } else if (cache_type == IS_STLB &&
                 MSHR.entry[mshr_index]
                     .prefetch_translation_merged) //@Vishal: Prefetech request
                                                   //from L1D prefetcher
      {
        PACKET temp = MSHR.entry[mshr_index];
        temp.data_pa = block[set][way].data;
        temp.read_translation_merged =
            0; //@Vishal: Remove this before adding to PQ
        temp.write_translation_merged = 0;
        if (PROCESSED.occupancy < PROCESSED.SIZE)
          PROCESSED.add_queue(&temp);
        else
          assert(0);
      }

      // check fill level
      if (MSHR.entry[mshr_index].fill_level < fill_level) {

        if (cache_type == IS_STLB) {
          MSHR.entry[mshr_index].prefetch_translation_merged = 0;

          if (MSHR.entry[mshr_index].send_both_tlb) {
            upper_level_icache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
            upper_level_dcache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
          } else if (MSHR.entry[mshr_index].instruction)
            upper_level_icache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
          else // data
            upper_level_dcache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
        }

	//@Rahul: PTW
        #ifdef PTW_L1D
        else if(cache_type == IS_L1D &&
                (MSHR.entry[mshr_index].type == LOAD_TRANSLATION ||
                 MSHR.entry[mshr_index].type == PREFETCH_TRANSLATION ||
                 MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D)) {

#ifdef IDEAL_L1D
            if (unique_translation_access.find(MSHR.entry[mshr_index].full_addr >> LOG2_BLOCK_SIZE) == unique_translation_access.end()){
              PTW_interface[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
              unique_translation_access.insert(MSHR.entry[mshr_index].full_addr >> LOG2_BLOCK_SIZE);
            }
#else
            PTW_interface[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
#endif
        }
        #endif

        #ifdef PTW_L2C
        else if(cache_type == IS_L2C &&
                (MSHR.entry[mshr_index].type == LOAD_TRANSLATION ||
                 MSHR.entry[mshr_index].type == PREFETCH_TRANSLATION ||
                 MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D)){

#ifdef IDEAL_L2
            if (unique_translation_access.find(MSHR.entry[mshr_index].full_addr >> LOG2_BLOCK_SIZE) == unique_translation_access.end()){
              PTW_interface[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
              unique_translation_access.insert(MSHR.entry[mshr_index].full_addr >> LOG2_BLOCK_SIZE);
            }
#else
            PTW_interface[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
#endif
        }
        #endif

        #ifdef PTW_LLC
        else if(cache_type == IS_LLC &&
                (MSHR.entry[mshr_index].type == LOAD_TRANSLATION ||
                 MSHR.entry[mshr_index].type == PREFETCH_TRANSLATION ||
                 MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D)){
#ifdef IDEAL_L3
            if (unique_translation_access.find(MSHR.entry[mshr_index].full_addr >> LOG2_BLOCK_SIZE) == unique_translation_access.end()){
              PTW_interface[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
              unique_translation_access.insert(MSHR.entry[mshr_index].full_addr >> LOG2_BLOCK_SIZE);
            }
#else
            PTW_interface[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
#endif
        }
        #endif

        #ifdef PTW_L1D_L2C
        else if( (MSHR.entry[mshr_index].type == LOAD_TRANSLATION ||
                 MSHR.entry[mshr_index].type == PREFETCH_TRANSLATION ||
                 MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D) &&
		 ( (cache_type == IS_L1D && MSHR.entry[mshr_index].translation_level > 1) ||
		   (cache_type == IS_L2C && MSHR.entry[mshr_index].translation_level == 1) ) ) {

	  assert(MSHR.entry[mshr_index].translation_level > 0 && MSHR.entry[mshr_index].translation_level < 6);
          PTW_interface[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
        }
        #endif

	/*else if (cache_type == IS_L2C &&
                   (MSHR.entry[mshr_index].type == LOAD_TRANSLATION ||
                    MSHR.entry[mshr_index].type == PREFETCH_TRANSLATION ||
                    MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D)) {
          extra_interface->return_data(&MSHR.entry[mshr_index]);*/

        else if (cache_type == IS_L2C) {
          if (MSHR.entry[mshr_index].send_both_cache) {
            upper_level_icache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
            upper_level_dcache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
          } else if (MSHR.entry[mshr_index].fill_l1i ||
                     MSHR.entry[mshr_index].fill_l1d) {
            if (MSHR.entry[mshr_index].fill_l1i)
              upper_level_icache[fill_cpu]->return_data(
                  &MSHR.entry[mshr_index]);
            if (MSHR.entry[mshr_index].fill_l1d)
              upper_level_dcache[fill_cpu]->return_data(
                  &MSHR.entry[mshr_index]);
          } else if (MSHR.entry[mshr_index].instruction)
            upper_level_icache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
          else if (MSHR.entry[mshr_index].is_data)
            upper_level_dcache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
        } else {
          if (MSHR.entry[mshr_index].instruction)
            upper_level_icache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
          else // data
            upper_level_dcache[fill_cpu]->return_data(&MSHR.entry[mshr_index]);
        }
      }
      //@v if send_both_tlb == 1 in STLB, response should return to both ITLB
      //and DTLB

      // update processed packets
      if ((cache_type == IS_ITLB) &&
          (MSHR.entry[mshr_index].type !=
           PREFETCH_TRANSLATION)) { //@v Responses to prefetch requests should
                                    //not go to PROCESSED queue
        MSHR.entry[mshr_index].instruction_pa = block[set][way].data;
        if (PROCESSED.occupancy < PROCESSED.SIZE)
          PROCESSED.add_queue(&MSHR.entry[mshr_index]);
      } else if ((cache_type == IS_DTLB) &&
                 (MSHR.entry[mshr_index].type != PREFETCH_TRANSLATION)) {
        //@Vasudha: Perfect DTLB Prefetcher: commenting as in case of read miss,
        //translation is already sent to PROCESSED QUEUE
        MSHR.entry[mshr_index].data_pa = block[set][way].data;
        if (PROCESSED.occupancy < PROCESSED.SIZE)
          PROCESSED.add_queue(&MSHR.entry[mshr_index]);
      } else if (cache_type == IS_L1I &&
                 (MSHR.entry[mshr_index].type != PREFETCH)) {
        if (PROCESSED.occupancy < PROCESSED.SIZE)
          PROCESSED.add_queue(&MSHR.entry[mshr_index]);
      }

      //@Rahul: PTW
      #if defined(PTW_L1D)||defined(PTW_L1D_L2C)
      else if ((cache_type == IS_L1D) &&
      	       ((MSHR.entry[mshr_index].type != PREFETCH) &&
                (MSHR.entry[mshr_index].type != LOAD_TRANSLATION)))
      #else
      else if ((cache_type == IS_L1D) &&
               (MSHR.entry[mshr_index].type != PREFETCH))
      #endif
      {
#ifndef Ideal_L1D_Prefetcher
        if (PROCESSED.occupancy <
            PROCESSED.SIZE) // Neelu: Don't sent to processed queue now in case
                            // of ideal L1D prefetcher
          PROCESSED.add_queue(&MSHR.entry[mshr_index]);
#endif

      }

      /*else if ((cache_type == IS_L1D) &&
                 (MSHR.entry[mshr_index].type != PREFETCH)) {
#ifndef Ideal_L1D_Prefetcher
        if (PROCESSED.occupancy <
            PROCESSED.SIZE) // Neelu: Don't sent to processed queue now in case
                            // of ideal L1D prefetcher
          PROCESSED.add_queue(&MSHR.entry[mshr_index]);
#endif
      }*/

      if (warmup_complete[fill_cpu]) {
        uint64_t current_miss_latency = (current_core_cycle[fill_cpu] -
                                         MSHR.entry[mshr_index].cycle_enqueued);
        total_miss_latency += current_miss_latency;

	if (MSHR.entry[mshr_index].type == LOAD) {
          load_miss_latency += current_miss_latency;
        }else if(MSHR.entry[mshr_index].type == LOAD_TRANSLATION) {
          load_translation_miss_latency += current_miss_latency;
        }

      }

      MSHR.remove_queue(&MSHR.entry[mshr_index]);
      MSHR.num_returned--;

      update_fill_cycle();
    }
  }
}


void CACHE::handle_writeback() {

  if (WQ.occupancy == 0)
    return;

  multimap<uint64_t, uint32_t> writes_ready; //{cycle_time,index}

  assert(cache_type != IS_L1I ||
         cache_type !=
             IS_STLB); //@Vishal: TLB should not generate write packets

  if (cache_type == IS_L1D) // Get completed index in WQ, as it is non-fifo
  {
    for (uint32_t wq_index = 0; wq_index < WQ.SIZE; wq_index++)
      if (WQ.entry[wq_index].translated == COMPLETED &&
          (WQ.entry[wq_index].event_cycle <= current_core_cycle[cpu]))
        writes_ready.insert({WQ.entry[wq_index].event_cycle, wq_index});
  }
  auto writes_ready_it = writes_ready.begin();

  if (cache_type == IS_L1D && writes_ready.size() == 0)
    return;

  if (cache_type == IS_L1D)
    WQ.head =
        writes_ready_it->second; //@Vishal: L1 WQ is non fifo, so head variable
                                 //is set to next index to be read

  // handle write
  uint32_t writeback_cpu = WQ.entry[WQ.head].cpu;
  if (writeback_cpu == NUM_CPUS)
    return;

  // handle the oldest entry
  if ((WQ.entry[WQ.head].event_cycle <= current_core_cycle[writeback_cpu]) &&
      (WQ.occupancy > 0)) {
    int index = WQ.head;

    // access cache
    uint32_t set = get_set(WQ.entry[index].address);
    int way = check_hit(&WQ.entry[index]);

    if (way >= 0) { // writeback hit (or RFO hit for L1D)

      (this->*update_replacement_state)(
          writeback_cpu, set, way, block[set][way].full_addr,
          WQ.entry[index].ip, 0, WQ.entry[index].type, 1);

      // COLLECT STATS
      sim_hit[writeback_cpu][WQ.entry[index].type]++;
      sim_access[writeback_cpu][WQ.entry[index].type]++;

#ifdef PT_STATS
      if ((cache_type == IS_L1D || cache_type == IS_L2C || cache_type == IS_LLC) && WQ.entry[index].type == LOAD_TRANSLATION){
        assert(WQ.entry[index].translation_level > 0 && WQ.entry[index].translation_level < 6);
        sim_pt_hit[writeback_cpu][WQ.entry[index].translation_level-1]++;
        sim_pt_access[writeback_cpu][WQ.entry[index].translation_level-1]++;
      }
#endif


      // mark dirty
      block[set][way].dirty = 1;

      if (cache_type == IS_ITLB)
        WQ.entry[index].instruction_pa = block[set][way].data;
      else if (cache_type == IS_DTLB)
        WQ.entry[index].data_pa = block[set][way].data;

      WQ.entry[index].data = block[set][way].data;

      // check fill level
      if (WQ.entry[index].fill_level < fill_level) {
        if (fill_level == FILL_L2) {
          if (WQ.entry[index].fill_l1i) {
            upper_level_icache[writeback_cpu]->return_data(&WQ.entry[index]);
          }
          if (WQ.entry[index].fill_l1d) {
            upper_level_dcache[writeback_cpu]->return_data(&WQ.entry[index]);
          }
        } else {
          if (WQ.entry[index].instruction)
            upper_level_icache[writeback_cpu]->return_data(&WQ.entry[index]);
          if (WQ.entry[index].is_data)
            upper_level_dcache[writeback_cpu]->return_data(&WQ.entry[index]);
        }
      }

      HIT[WQ.entry[index].type]++;
      ACCESS[WQ.entry[index].type]++;

      // remove this entry from WQ
      WQ.remove_queue(&WQ.entry[index]);
    } else { // writeback miss (or RFO miss for L1D)

      DP(if (warmup_complete[writeback_cpu]) {
        cout << "[" << NAME << "] " << __func__
             << " type: " << +WQ.entry[index].type << " miss";
        cout << " instr_id: " << WQ.entry[index].instr_id << " address: " << hex
             << WQ.entry[index].address;
        cout << " full_addr: " << WQ.entry[index].full_addr << dec;
        cout << " cycle: " << WQ.entry[index].event_cycle << endl;
      });

      if (cache_type == IS_L1D) { // RFO miss

        // check mshr
        uint8_t miss_handled = 1;
        int mshr_index = check_nonfifo_queue(
            &MSHR, &WQ.entry[index], false); //@Vishal: Updated from check_mshr

        if (mshr_index == -2) {
          // this is a data/instruction collision in the MSHR, so we have to
          // wait before we can allocate this miss
          miss_handled = 0;
        }

        if ((mshr_index == -1) &&
            (MSHR.occupancy < MSHR_SIZE)) { // this is a new miss

          assert(WQ.entry[index].full_physical_address != 0);
          PACKET new_packet = WQ.entry[index];
          //@Vishal: Send physical address to lower level and track physical
          //address in MSHR
          new_packet.address =
              WQ.entry[index].full_physical_address >> LOG2_BLOCK_SIZE;
          new_packet.full_addr = WQ.entry[index].full_physical_address;

          // add it to mshr (RFO miss)
          add_nonfifo_queue(&MSHR,
                            &new_packet); //@Vishal: Updated from add_mshr

          // add it to the next level's read queue
          // if (lower_level) // L1D always has a lower level cache
          lower_level->add_rq(&new_packet);
        } else {
          if ((mshr_index == -1) &&
              (MSHR.occupancy == MSHR_SIZE)) { // not enough MSHR resource

            // cannot handle miss request until one of MSHRs is available
            miss_handled = 0;
            STALL[WQ.entry[index].type]++;
          } else if (mshr_index != -1) { // already in-flight miss

            // update fill_level
            if (WQ.entry[index].fill_level < MSHR.entry[mshr_index].fill_level)
              MSHR.entry[mshr_index].fill_level = WQ.entry[index].fill_level;

            if ((WQ.entry[index].fill_l1i) &&
                (MSHR.entry[mshr_index].fill_l1i != 1)) {
              MSHR.entry[mshr_index].fill_l1i = 1;
            }
            if ((WQ.entry[index].fill_l1d) &&
                (MSHR.entry[mshr_index].fill_l1d != 1)) {
              MSHR.entry[mshr_index].fill_l1d = 1;
            }

            // update request
            if (MSHR.entry[mshr_index].type == PREFETCH) {
              uint8_t prior_returned = MSHR.entry[mshr_index].returned;
              uint64_t prior_event_cycle = MSHR.entry[mshr_index].event_cycle;

              uint64_t prior_address = MSHR.entry[mshr_index].address;
              uint64_t prior_full_addr = MSHR.entry[mshr_index].full_addr;
              uint64_t prior_full_physical_address =
                  MSHR.entry[mshr_index].full_physical_address;

              MSHR.entry[mshr_index] = WQ.entry[index];

              //@Vishal: L1 RQ has virtual address, but miss needs to track
              //physical address, so prior addresses are kept
              if (cache_type == IS_L1D) {
                MSHR.entry[mshr_index].address = prior_address;
                MSHR.entry[mshr_index].full_addr = prior_full_addr;
                MSHR.entry[mshr_index].full_physical_address =
                    prior_full_physical_address;
              }

              // in case request is already returned, we should keep event_cycle
              // and retunred variables
              MSHR.entry[mshr_index].returned = prior_returned;
              MSHR.entry[mshr_index].event_cycle = prior_event_cycle;
            }

            MSHR_MERGED[WQ.entry[index].type]++;

            DP(if (warmup_complete[writeback_cpu]) {
              cout << "[" << NAME << "] " << __func__ << " mshr merged";
              cout << " instr_id: " << WQ.entry[index].instr_id
                   << " prior_id: " << MSHR.entry[mshr_index].instr_id;
              cout << " address: " << hex << WQ.entry[index].address;
              cout << " full_addr: " << WQ.entry[index].full_addr << dec;
              cout << " cycle: " << WQ.entry[index].event_cycle << endl;
            });
          } else { // WE SHOULD NOT REACH HERE
            cerr << "[" << NAME << "] MSHR errors" << endl;
            assert(0);
          }
        }

        if (miss_handled) {

          MISS[WQ.entry[index].type]++;
          ACCESS[WQ.entry[index].type]++;

          // remove this entry from WQ
          WQ.remove_queue(&WQ.entry[index]);
        }

      } else {
        // find victim
        uint32_t set = get_set(WQ.entry[index].address), way;
        way = (this->*find_victim)(writeback_cpu, WQ.entry[index].instr_id, set,
                                   block[set], WQ.entry[index].ip,
                                   WQ.entry[index].full_addr,
                                   WQ.entry[index].type);

#ifdef LLC_BYPASS
        if ((cache_type == IS_LLC) && (way == LLC_WAY)) {
          cerr << "LLC bypassing for writebacks is not allowed!" << endl;
          assert(0);
        }
#endif

        uint8_t do_fill = 1;

        // is this dirty?
        if (block[set][way].dirty) {

          // check if the lower level WQ has enough room to keep this writeback
          // request
          if (lower_level) {
            if (lower_level->get_occupancy(2, block[set][way].address) ==
                lower_level->get_size(2, block[set][way].address)) {

              // lower level WQ is full, cannot replace this victim
              do_fill = 0;
              lower_level->increment_WQ_FULL(block[set][way].address);
              STALL[WQ.entry[index].type]++;

              DP(if (warmup_complete[writeback_cpu]) {
                cout << "[" << NAME << "] " << __func__
                     << "do_fill: " << +do_fill;
                cout << " lower level wq is full!"
                     << " fill_addr: " << hex << WQ.entry[index].address;
                cout << " victim_addr: " << block[set][way].tag << dec << endl;
              });
            } else {
              PACKET writeback_packet;

              writeback_packet.fill_level = fill_level << 1;
              writeback_packet.cpu = writeback_cpu;
              writeback_packet.address = block[set][way].address;
              writeback_packet.full_addr = block[set][way].full_addr;
              writeback_packet.data = block[set][way].data;
              writeback_packet.instr_id = WQ.entry[index].instr_id;
              writeback_packet.ip = 0;
              writeback_packet.type = WRITEBACK;
              writeback_packet.event_cycle = current_core_cycle[writeback_cpu];

              lower_level->add_wq(&writeback_packet);
            }
          }
#ifdef SANITY_CHECK
          else {
            // sanity check
            if (cache_type != IS_STLB)
              assert(0);
          }
#endif
        }

        if (do_fill) {
          // update prefetcher
          if (cache_type == IS_L1I)
            l1i_prefetcher_cache_fill(
                writeback_cpu,
                ((WQ.entry[index].ip) >> LOG2_BLOCK_SIZE) << LOG2_BLOCK_SIZE,
                set, way, 0,
                ((block[set][way].ip) >> LOG2_BLOCK_SIZE) << LOG2_BLOCK_SIZE);
          else if (cache_type == IS_L1D) {
            // Neelu: Sending virtual fill and evicted address to L1D
            // prefetcher.

            uint64_t v_fill_addr, v_evicted_addr;
            // First, getting virtual address for the fill address
            auto ppage_check =
                inverse_table.find(WQ.entry[index].full_addr >> LOG2_PAGE_SIZE);
            assert(ppage_check != inverse_table.end());
            v_fill_addr = (ppage_check->second) << LOG2_PAGE_SIZE;
            v_fill_addr |=
                (WQ.entry[index].full_addr & ((1 << LOG2_PAGE_SIZE) - 1));

            // Now getting virtual address for the evicted address
            /*Neelu: Note that it is not always necessary that evicted address
             * is a valid address and is present in the inverse table, hence (1)
             * do not use the assert and (2) if it is not present, assign it to
             * zero. */

            ppage_check = inverse_table.find(
                block[set][way].address >> (LOG2_PAGE_SIZE - LOG2_BLOCK_SIZE));
            if (ppage_check != inverse_table.end()) {
              v_evicted_addr = (ppage_check->second) << LOG2_PAGE_SIZE;
              v_evicted_addr |= ((block[set][way].address << LOG2_BLOCK_SIZE) &
                                 ((1 << LOG2_PAGE_SIZE) - 1));
            } else
              v_evicted_addr = 0;

            l1d_prefetcher_cache_fill(
                v_fill_addr, WQ.entry[index].full_addr, set, way, 0,
                v_evicted_addr, block[set][way].address << LOG2_BLOCK_SIZE,
                WQ.entry[index].pf_metadata);

          } else if (cache_type == IS_L2C)
            WQ.entry[index].pf_metadata = l2c_prefetcher_cache_fill(
                WQ.entry[index].address << LOG2_BLOCK_SIZE, set, way, 0,
                block[set][way].address << LOG2_BLOCK_SIZE,
                WQ.entry[index].pf_metadata);
          if (cache_type == IS_LLC) {
            cpu = writeback_cpu;
            WQ.entry[index].pf_metadata = llc_prefetcher_cache_fill(
                WQ.entry[index].address << LOG2_BLOCK_SIZE, set, way, 0,
                block[set][way].address << LOG2_BLOCK_SIZE,
                WQ.entry[index].pf_metadata);
            cpu = 0;
          }

          // update replacement policy
          (this->*update_replacement_state)(
              writeback_cpu, set, way, WQ.entry[index].full_addr,
              WQ.entry[index].ip, block[set][way].full_addr,
              WQ.entry[index].type, 0);

          // COLLECT STATS
          sim_miss[writeback_cpu][WQ.entry[index].type]++;
          sim_access[writeback_cpu][WQ.entry[index].type]++;

#ifdef PT_STATS
      if ((cache_type == IS_L1D || cache_type == IS_L2C || cache_type == IS_LLC) && WQ.entry[index].type == LOAD_TRANSLATION){
        assert(WQ.entry[index].translation_level > 0 && WQ.entry[index].translation_level < 6);
        sim_pt_miss[writeback_cpu][WQ.entry[index].translation_level-1]++;
        sim_pt_access[writeback_cpu][WQ.entry[index].translation_level-1]++;
      }
#endif

          fill_cache(set, way, &WQ.entry[index]);

          // mark dirty
          block[set][way].dirty = 1;

          // check fill level
          if (WQ.entry[index].fill_level < fill_level) {
            if (fill_level == FILL_L2) {
              if (WQ.entry[index].fill_l1i) {
                upper_level_icache[writeback_cpu]->return_data(
                    &WQ.entry[index]);
              }
              if (WQ.entry[index].fill_l1d) {
                upper_level_dcache[writeback_cpu]->return_data(
                    &WQ.entry[index]);
              }
            } else {
              if (WQ.entry[index].instruction)
                upper_level_icache[writeback_cpu]->return_data(
                    &WQ.entry[index]);
              if (WQ.entry[index].is_data)
                upper_level_dcache[writeback_cpu]->return_data(
                    &WQ.entry[index]);
            }
          }

          MISS[WQ.entry[index].type]++;
          ACCESS[WQ.entry[index].type]++;

          // remove this entry from WQ
          WQ.remove_queue(&WQ.entry[index]);
        }
      }
    }
  }
}

//@Vishal: Translation coming from TLB to L1 cache
/*L1I and L1D caches are VIPT, so they will call this function to check if there
 * are any translation requests completed and entered into the processed queue
 * by the TLBs so the L1 caches can get the physical address. The corresponding
 * L1I/L1D entry is identified by the RQ/WQ/PQ index present in the processed
 * packet. After processing the translation request, the cache access latency is
 * finally added as the cache can be accessed only after the translation is
 * complete. Later on, other requests waiting for the same translation
 * (dependent requests) are also serviced with the physical address. STLB's
 * processed queue is also checked since L1D prefetch requests get the
 * translation directly from the STLB and not the DTLB.*/
void CACHE::handle_processed() {
  assert(cache_type == IS_L1I || cache_type == IS_L1D);

  CACHE &tlb = cache_type == IS_L1I ? ooo_cpu[cpu].ITLB : ooo_cpu[cpu].DTLB;

  //@Vishal: one translation is processed per cycle
  if (tlb.PROCESSED.occupancy != 0) {
    if ((tlb.PROCESSED.entry[tlb.PROCESSED.head].event_cycle <=
         current_core_cycle[cpu])) {
      int index = tlb.PROCESSED.head;

      if (tlb.PROCESSED.entry[index].l1_rq_index != -1) {
        assert(tlb.PROCESSED.entry[index].l1_wq_index == -1 &&
               tlb.PROCESSED.entry[index].l1_pq_index ==
                   -1); // Entry can't have write and prefetch index

        int rq_index = tlb.PROCESSED.entry[index].l1_rq_index;

        if ((tlb.PROCESSED.entry[index].full_addr) >> LOG2_PAGE_SIZE ==
            (RQ.entry[rq_index].full_addr) >> LOG2_PAGE_SIZE) {

          DP(if (warmup_complete[cpu]) {
            cout << "[" << NAME
                 << "_handle_processed] packet: " << RQ.entry[rq_index];
          });

          RQ.entry[rq_index].translated = COMPLETED;

          if (tlb.cache_type == IS_ITLB)
            RQ.entry[rq_index].full_physical_address =
                (tlb.PROCESSED.entry[index].instruction_pa << LOG2_PAGE_SIZE) |
                (RQ.entry[rq_index].full_addr & ((1 << LOG2_PAGE_SIZE) - 1));
          else
            RQ.entry[rq_index].full_physical_address =
                (tlb.PROCESSED.entry[index].data_pa << LOG2_PAGE_SIZE) |
                (RQ.entry[rq_index].full_addr & ((1 << LOG2_PAGE_SIZE) - 1));

          // ADD LATENCY
          if (RQ.entry[rq_index].event_cycle < current_core_cycle[cpu])
            RQ.entry[rq_index].event_cycle = current_core_cycle[cpu] + LATENCY;
          else
            RQ.entry[rq_index].event_cycle += LATENCY;
        }
      } else if (tlb.PROCESSED.entry[index].l1_wq_index != -1) {
        assert(tlb.PROCESSED.entry[index].l1_rq_index == -1 &&
               tlb.PROCESSED.entry[index].l1_pq_index ==
                   -1); // Entry can't have read and prefetch index

        int wq_index = tlb.PROCESSED.entry[index].l1_wq_index;
        if ((tlb.PROCESSED.entry[index].full_addr) >> LOG2_PAGE_SIZE ==
            (WQ.entry[wq_index].full_addr) >> LOG2_PAGE_SIZE) {

          WQ.entry[wq_index].translated = COMPLETED;

          if (tlb.cache_type == IS_ITLB)
            WQ.entry[wq_index].full_physical_address =
                (tlb.PROCESSED.entry[index].instruction_pa << LOG2_PAGE_SIZE) |
                (WQ.entry[wq_index].full_addr & ((1 << LOG2_PAGE_SIZE) - 1));
          else
            WQ.entry[wq_index].full_physical_address =
                (tlb.PROCESSED.entry[index].data_pa << LOG2_PAGE_SIZE) |
                (WQ.entry[wq_index].full_addr & ((1 << LOG2_PAGE_SIZE) - 1));

          // ADD LATENCY
          if (WQ.entry[wq_index].event_cycle < current_core_cycle[cpu])
            WQ.entry[wq_index].event_cycle = current_core_cycle[cpu] + LATENCY;
          else
            WQ.entry[wq_index].event_cycle += LATENCY;

          DP(if (warmup_complete[cpu]) {
            cout << "[" << NAME
                 << "_handle_processed] packet: " << WQ.entry[wq_index];
          });
        }
      }
      // Neelu: Checking for l1_pq_index as well as if L1I prefetching is turned
      // on, the corresponding translation requests are sent to ITLB.
      else if (tlb.PROCESSED.entry[index].l1_pq_index != -1) {
        // Neelu: This should occur only for L1I, because L1D prefetch requests
        // get translations from STLB.
        assert(cache_type == IS_L1I);

        assert(tlb.PROCESSED.entry[index].l1_wq_index == -1 &&
               tlb.PROCESSED.entry[index].l1_rq_index ==
                   -1); // Entry can't have write and read index

        int pq_index = tlb.PROCESSED.entry[index].l1_pq_index;
        if ((tlb.PROCESSED.entry[index].full_addr) >> LOG2_PAGE_SIZE ==
            (PQ.entry[pq_index].full_addr) >> LOG2_PAGE_SIZE) {

          PQ.entry[pq_index].translated = COMPLETED;

          if (tlb.cache_type == IS_ITLB)
            PQ.entry[pq_index].full_physical_address =
                (tlb.PROCESSED.entry[index].instruction_pa << LOG2_PAGE_SIZE) |
                (PQ.entry[pq_index].full_addr & ((1 << LOG2_PAGE_SIZE) - 1));
          else {
            // Neelu: L1D Prefetch translation requests don't go to DTLB.
            assert(0);
          }

          DP(if (warmup_complete[cpu]) {
            cout << "[" << NAME
                 << "_handle_processed] packet: " << PQ.entry[pq_index];
          });

          // ADD LATENCY
          if (PQ.entry[pq_index].event_cycle < current_core_cycle[cpu])
            PQ.entry[pq_index].event_cycle = current_core_cycle[cpu] + LATENCY;
          else
            PQ.entry[pq_index].event_cycle += LATENCY;
        }
      } else {
        assert(0); // Either read queue, prefetch queue or write queue index
                   // should be present
      }

      if (tlb.PROCESSED.entry[index].read_translation_merged) {
        ITERATE_SET(other_rq_index,
                    tlb.PROCESSED.entry[index].l1_rq_index_depend_on_me,
                    RQ.SIZE) {
          if (RQ.entry[other_rq_index].translated == INFLIGHT &&
              ((tlb.PROCESSED.entry[index].full_addr) >> LOG2_PAGE_SIZE ==
               (RQ.entry[other_rq_index].full_addr) >> LOG2_PAGE_SIZE)) {
            RQ.entry[other_rq_index].translated = COMPLETED;

            if (tlb.cache_type == IS_ITLB)
              RQ.entry[other_rq_index].full_physical_address =
                  (tlb.PROCESSED.entry[index].instruction_pa
                   << LOG2_PAGE_SIZE) |
                  (RQ.entry[other_rq_index].full_addr &
                   ((1 << LOG2_PAGE_SIZE) - 1));
            else
              RQ.entry[other_rq_index].full_physical_address =
                  (tlb.PROCESSED.entry[index].data_pa << LOG2_PAGE_SIZE) |
                  (RQ.entry[other_rq_index].full_addr &
                   ((1 << LOG2_PAGE_SIZE) - 1));

            RQ.entry[other_rq_index].event_cycle = current_core_cycle[cpu];
            // ADD LATENCY
            if (RQ.entry[other_rq_index].event_cycle < current_core_cycle[cpu])
              RQ.entry[other_rq_index].event_cycle =
                  current_core_cycle[cpu] + LATENCY;
            else
              RQ.entry[other_rq_index].event_cycle += LATENCY;

            DP(if (warmup_complete[cpu]) {
              cout << "[" << NAME
                   << "_handle_processed] packet: " << RQ.entry[other_rq_index];
            });
          }
        }
      }

      if (tlb.PROCESSED.entry[index].write_translation_merged) {
        ITERATE_SET(other_wq_index,
                    tlb.PROCESSED.entry[index].l1_wq_index_depend_on_me,
                    WQ.SIZE) {
          if (WQ.entry[other_wq_index].translated == INFLIGHT &&
              ((tlb.PROCESSED.entry[index].full_addr) >> LOG2_PAGE_SIZE ==
               (WQ.entry[other_wq_index].full_addr) >> LOG2_PAGE_SIZE)) {

            WQ.entry[other_wq_index].translated = COMPLETED;

            if (tlb.cache_type == IS_ITLB)
              WQ.entry[other_wq_index].full_physical_address =
                  (tlb.PROCESSED.entry[index].instruction_pa
                   << LOG2_PAGE_SIZE) |
                  (WQ.entry[other_wq_index].full_addr &
                   ((1 << LOG2_PAGE_SIZE) - 1));
            else
              WQ.entry[other_wq_index].full_physical_address =
                  (tlb.PROCESSED.entry[index].data_pa << LOG2_PAGE_SIZE) |
                  (WQ.entry[other_wq_index].full_addr &
                   ((1 << LOG2_PAGE_SIZE) - 1));

            WQ.entry[other_wq_index].event_cycle = current_core_cycle[cpu];
            // ADD LATENCY
            if (WQ.entry[other_wq_index].event_cycle < current_core_cycle[cpu])
              WQ.entry[other_wq_index].event_cycle =
                  current_core_cycle[cpu] + LATENCY;
            else
              WQ.entry[other_wq_index].event_cycle += LATENCY;

            DP(if (warmup_complete[cpu]) {
              cout << "[" << NAME
                   << "_handle_processed] packet: " << WQ.entry[other_wq_index];
            });
          }
        }
      }

      // Neelu: Checking for prefetch_translation_merges too as ITLB can have
      // translation requests from L1I prefetches. This is not true for DTLB, as
      // data prefetch translation requests are sent to the STLB.
      if (tlb.PROCESSED.entry[index].prefetch_translation_merged) {
        ITERATE_SET(other_pq_index,
                    tlb.PROCESSED.entry[index].l1_pq_index_depend_on_me,
                    PQ.SIZE) {
          if (PQ.entry[other_pq_index].translated == INFLIGHT &&
              ((tlb.PROCESSED.entry[index].full_addr) >> LOG2_PAGE_SIZE ==
               (PQ.entry[other_pq_index].full_addr) >> LOG2_PAGE_SIZE)) {

            PQ.entry[other_pq_index].translated = COMPLETED;

            if (tlb.cache_type == IS_ITLB)
              PQ.entry[other_pq_index].full_physical_address =
                  (tlb.PROCESSED.entry[index].instruction_pa
                   << LOG2_PAGE_SIZE) |
                  (PQ.entry[other_pq_index].full_addr &
                   ((1 << LOG2_PAGE_SIZE) - 1));
            else {
              assert(0); // Translation cannot come from DTLB
            }

            PQ.entry[other_pq_index].event_cycle = current_core_cycle[cpu];

            DP(if (warmup_complete[cpu]) {
              cout << "[" << NAME
                   << "_handle_processed] packet: " << PQ.entry[other_pq_index];
            });

            // ADD LATENCY
            if (PQ.entry[other_pq_index].event_cycle < current_core_cycle[cpu])
              PQ.entry[other_pq_index].event_cycle =
                  current_core_cycle[cpu] + LATENCY;
            else
              PQ.entry[other_pq_index].event_cycle += LATENCY;
          }
        }
      }

      tlb.PROCESSED.remove_queue(&tlb.PROCESSED.entry[index]);
    }
  }

  //@Vishal: Check for Prefetch translations from STLB processed queue
  if (cache_type == IS_L1D) {
    CACHE &tlb = ooo_cpu[cpu].STLB;

    //@Vishal: one translation is processed per cycle
    if (tlb.PROCESSED.occupancy != 0) {
      if ((tlb.PROCESSED.entry[tlb.PROCESSED.head].event_cycle <=
           current_core_cycle[cpu])) {
        int index = tlb.PROCESSED.head;

        // Neelu: Shouldn't this if be an assert?
        if (tlb.PROCESSED.entry[index].l1_pq_index != -1) {
          int pq_index = tlb.PROCESSED.entry[index].l1_pq_index;
          if (PQ.entry[pq_index].translated == INFLIGHT &&
              ((tlb.PROCESSED.entry[index].full_addr) >> LOG2_PAGE_SIZE ==
               (PQ.entry[pq_index].full_addr) >> LOG2_PAGE_SIZE)) {
            PQ.entry[pq_index].translated = COMPLETED;

            //@Vishal: L1D prefetch is sending request, so translation should be
            //in data_pa.
            assert(tlb.PROCESSED.entry[index].data_pa != 0 &&
                   tlb.PROCESSED.entry[index].instruction_pa == 0);

            PQ.entry[pq_index].full_physical_address =
                (tlb.PROCESSED.entry[index].data_pa << LOG2_PAGE_SIZE) |
                (PQ.entry[pq_index].full_addr & ((1 << LOG2_PAGE_SIZE) - 1));

            DP(if (warmup_complete[cpu]) {
              cout << "[" << NAME
                   << "_handle_processed] packet: " << PQ.entry[pq_index];
            });

            // ADD LATENCY
            if (PQ.entry[pq_index].event_cycle < current_core_cycle[cpu])
              PQ.entry[pq_index].event_cycle =
                  current_core_cycle[cpu] + LATENCY;
            else
              PQ.entry[pq_index].event_cycle += LATENCY;

            assert(
                (tlb.PROCESSED.entry[index].read_translation_merged == false) &&
                (tlb.PROCESSED.entry[index].write_translation_merged == false));
          }
        }

        if (tlb.PROCESSED.entry[index].prefetch_translation_merged) {
          ITERATE_SET(other_pq_index,
                      tlb.PROCESSED.entry[index].l1_pq_index_depend_on_me,
                      PQ.SIZE) {
            if (PQ.entry[other_pq_index].translated == INFLIGHT &&
                ((tlb.PROCESSED.entry[index].full_addr) >> LOG2_PAGE_SIZE ==
                 (PQ.entry[other_pq_index].full_addr) >> LOG2_PAGE_SIZE))

            {
              PQ.entry[other_pq_index].translated = COMPLETED;
              PQ.entry[other_pq_index].full_physical_address =
                  (tlb.PROCESSED.entry[index].data_pa << LOG2_PAGE_SIZE) |
                  (PQ.entry[other_pq_index].full_addr &
                   ((1 << LOG2_PAGE_SIZE) - 1));

              DP(if (warmup_complete[cpu]) {
                cout << "[" << NAME << "_handle_processed] packet: "
                     << PQ.entry[other_pq_index];
              });

              // ADD LATENCY
              if (PQ.entry[other_pq_index].event_cycle <
                  current_core_cycle[cpu])
                PQ.entry[other_pq_index].event_cycle =
                    current_core_cycle[cpu] + LATENCY;
              else
                PQ.entry[other_pq_index].event_cycle += LATENCY;
            }
          }
        }

        tlb.PROCESSED.remove_queue(&tlb.PROCESSED.entry[index]);
      } else
        return;
    }
  }
}

void CACHE::handle_read() {

  if (RQ.occupancy == 0)
    return;

  multimap<uint64_t, uint32_t> reads_ready; //{cycle_time,index}

  if (cache_type == IS_L1I ||
      cache_type == IS_L1D) // Get completed index in RQ, as it is non-fifo
  {
    for (uint32_t rq_index = 0; rq_index < RQ.SIZE; rq_index++)
      if (RQ.entry[rq_index].translated == COMPLETED &&
          (RQ.entry[rq_index].event_cycle <= current_core_cycle[cpu]))
        reads_ready.insert({RQ.entry[rq_index].event_cycle, rq_index});
  }
  auto reads_ready_it = reads_ready.begin();

  if ((cache_type == IS_L1I || cache_type == IS_L1D) && reads_ready.size() == 0)
    return;

  // handle read
  static int counter;
  for (uint32_t i = 0; i < MAX_READ; i++) {

    if (cache_type == IS_L1I || cache_type == IS_L1D) {
      if (reads_ready_it == reads_ready.end())
        return;
      RQ.head =
          reads_ready_it->second; //@Vishal: L1 RQ is non fifo, so head variable
                                  //is set to next index to be read
      reads_ready_it++;
    }

    uint32_t read_cpu = RQ.entry[RQ.head].cpu;
    if (read_cpu == NUM_CPUS)
      return;

    // handle the oldest entry
    if ((RQ.entry[RQ.head].event_cycle <= current_core_cycle[read_cpu]) &&
        (RQ.occupancy > 0)) {
      int index = RQ.head;

      // access cache
      uint32_t set = get_set(RQ.entry[index].address);
      int way = check_hit(&RQ.entry[index]);

      if (way >= 0) { // read hit

        if (cache_type == IS_ITLB) {

          RQ.entry[index].instruction_pa = block[set][way].data;
          if (PROCESSED.occupancy < PROCESSED.SIZE)
            PROCESSED.add_queue(&RQ.entry[index]);
        } else if (cache_type == IS_DTLB) {
          RQ.entry[index].data_pa = block[set][way].data;

          if (PROCESSED.occupancy < PROCESSED.SIZE)
            PROCESSED.add_queue(&RQ.entry[index]);

        } else if (cache_type == IS_STLB) {

          PACKET temp = RQ.entry[index];

          if (temp.l1_pq_index !=
              -1) //@Vishal: Check if the current request is sent from L1D
                  //prefetcher //TODO: Add condition to not send instruction
                  //translation request
          {
            assert(RQ.entry[index].l1_rq_index == -1 &&
                   RQ.entry[index].l1_wq_index ==
                       -1); //@Vishal: these should not be set

            temp.data_pa = block[set][way].data;
            temp.read_translation_merged = false;
            temp.write_translation_merged = false;
            if (PROCESSED.occupancy < PROCESSED.SIZE)
              PROCESSED.add_queue(&temp);
            else
              assert(0);
          }
          if (RQ.entry[index]
                  .prefetch_translation_merged) //@Vishal: Prefetech request
                                                //from L1D prefetcher
          {
            PACKET temp = RQ.entry[index];
            temp.data_pa = block[set][way].data;
            temp.read_translation_merged =
                0; //@Vishal: Remove this before adding to PQ
            temp.write_translation_merged = 0;
            if (PROCESSED.occupancy < PROCESSED.SIZE)
              PROCESSED.add_queue(&temp);
            else
              assert(0);
          }

        } else if (cache_type == IS_L1I) {
          if (PROCESSED.occupancy < PROCESSED.SIZE)
            PROCESSED.add_queue(&RQ.entry[index]);
        }

	//@Rahul: PTW
        #if defined(PTW_L1D)||defined(PTW_L1D_L2C)
        else if ((cache_type == IS_L1D) &&
                 (RQ.entry[index].type != PREFETCH) &&
                 (RQ.entry[index].type != LOAD_TRANSLATION) &&
		 (RQ.entry[index].type != PREFETCH_TRANSLATION) &&
                 (RQ.entry[index].type != TRANSLATION_FROM_L1D))
        #else
        else if ((cache_type == IS_L1D) &&
                 (RQ.entry[index].type != PREFETCH))
        #endif
       	{
          if (PROCESSED.occupancy < PROCESSED.SIZE)
            PROCESSED.add_queue(&RQ.entry[index]);
        }

	/*else if ((cache_type == IS_L1D) &&
                   (RQ.entry[index].type != PREFETCH)) {
          if (PROCESSED.occupancy < PROCESSED.SIZE)
            PROCESSED.add_queue(&RQ.entry[index]);
        }*/

        // update prefetcher on load instruction
        if (RQ.entry[index].type == LOAD) {
          assert(cache_type != IS_ITLB || cache_type != IS_DTLB ||
                 cache_type != IS_STLB);
          if (cache_type == IS_L1I)
            l1i_prefetcher_cache_operate(read_cpu, RQ.entry[index].ip, 1,
                                         block[set][way].prefetch);
          if (cache_type == IS_L1D)
            l1d_prefetcher_operate(RQ.entry[index].full_addr,
                                   RQ.entry[index].ip, 1, RQ.entry[index].type);
          else if ((cache_type == IS_L2C) &&
                   (RQ.entry[index].type != PREFETCH_TRANSLATION) &&
                   (RQ.entry[index].instruction == 0) &&
                   (RQ.entry[index].type != LOAD_TRANSLATION) &&
                   (RQ.entry[index].type != PREFETCH_TRANSLATION) &&
                   (RQ.entry[index].type !=
                    TRANSLATION_FROM_L1D)) // Neelu: for dense region, only
                                           // invoking on loads, check other
                                           // l2c_pref_operate as well.
            l2c_prefetcher_operate(block[set][way].address << LOG2_BLOCK_SIZE,
                                   RQ.entry[index].ip, 1, RQ.entry[index].type,
                                   0);
          else if (cache_type == IS_LLC) {
            cpu = read_cpu;
            llc_prefetcher_operate(block[set][way].address << LOG2_BLOCK_SIZE,
                                   RQ.entry[index].ip, 1, RQ.entry[index].type,
                                   0);
            cpu = 0;
          }
        } else if (RQ.entry[index].type == LOAD_TRANSLATION) {
          assert(cache_type != IS_L1I || cache_type != IS_L1D ||
                 cache_type != IS_L2C || cache_type != IS_LLC);
          if (cache_type == IS_ITLB) {
            itlb_prefetcher_operate(RQ.entry[index].address << LOG2_PAGE_SIZE,
                                    RQ.entry[index].ip, 1, RQ.entry[index].type,
                                    RQ.entry[index].instr_id,
                                    RQ.entry[index].instruction);

          } else if (cache_type == IS_DTLB) {
#ifdef SANITY_CHECK
            if (RQ.entry[index].instruction) {
              cout << "DTLB prefetch packet should not prefetch address "
                      "translation of instruction"
                   << endl;
              assert(0);
            }
#endif

            dtlb_prefetcher_operate(RQ.entry[index].address << LOG2_PAGE_SIZE,
                                    RQ.entry[index].ip, 1, RQ.entry[index].type,
                                    RQ.entry[index].instr_id,
                                    RQ.entry[index].instruction);

          } else if (cache_type == IS_STLB) {
            int temp_type = LOAD;
            if (RQ.entry[index].prefetch_translation_merged == true ||
                RQ.entry[index].l1_pq_index != -1)
              temp_type = PREFETCH;
            stlb_prefetcher_operate(RQ.entry[index].address << LOG2_PAGE_SIZE,
                                    RQ.entry[index].ip, 1, temp_type,
                                    RQ.entry[index].instr_id,
                                    RQ.entry[index].instruction);
          }
        }

        // update replacement policy
        (this->*update_replacement_state)(
            read_cpu, set, way, block[set][way].full_addr, RQ.entry[index].ip,
            0, RQ.entry[index].type, 1);

        // COLLECT STATS
        sim_hit[read_cpu][RQ.entry[index].type]++;
        sim_access[read_cpu][RQ.entry[index].type]++;

#ifdef PT_STATS
      if ((cache_type == IS_L1D || cache_type == IS_L2C || cache_type == IS_LLC) && RQ.entry[index].type == LOAD_TRANSLATION){
        assert(RQ.entry[index].translation_level > 0 && RQ.entry[index].translation_level < 6);
        sim_pt_hit[read_cpu][RQ.entry[index].translation_level-1]++;
        sim_pt_access[read_cpu][RQ.entry[index].translation_level-1]++;
      }
#endif

        // check fill level
        // data should be updated (for TLBs) in case of hit
        if (RQ.entry[index].fill_level < fill_level) {

          if (cache_type == IS_STLB) {
            RQ.entry[index].prefetch_translation_merged = false;
            if (RQ.entry[index].send_both_tlb) {
              RQ.entry[index].data = block[set][way].data;
              upper_level_icache[read_cpu]->return_data(&RQ.entry[index]);
              upper_level_dcache[read_cpu]->return_data(&RQ.entry[index]);
            } else if (RQ.entry[index].instruction) {
              RQ.entry[index].data = block[set][way].data;
              upper_level_icache[read_cpu]->return_data(&RQ.entry[index]);
            } else // data
            {
              RQ.entry[index].data = block[set][way].data;
              upper_level_dcache[read_cpu]->return_data(&RQ.entry[index]);
            }
#ifdef SANITY_CHECK
            if (RQ.entry[index].data == 0)
              assert(0);
#endif
          }

	  //@Rahul: PTW
          #ifdef PTW_L1D
          else if(cache_type == IS_L1D &&
                  (RQ.entry[index].type == PREFETCH_TRANSLATION ||
                   RQ.entry[index].type == LOAD_TRANSLATION ||
                   RQ.entry[index].type == TRANSLATION_FROM_L1D)) {
            PTW_interface[read_cpu]->return_data(&RQ.entry[index]);

          }
          #endif

          #ifdef PTW_L2C
          else if(cache_type == IS_L2C &&
                  (RQ.entry[index].type == PREFETCH_TRANSLATION ||
                   RQ.entry[index].type == LOAD_TRANSLATION ||
                   RQ.entry[index].type == TRANSLATION_FROM_L1D)) {
            PTW_interface[read_cpu]->return_data(&RQ.entry[index]);

          }
          #endif

          #ifdef PTW_LLC
          else if(cache_type == IS_LLC &&
                  (RQ.entry[index].type == PREFETCH_TRANSLATION ||
                   RQ.entry[index].type == LOAD_TRANSLATION ||
                   RQ.entry[index].type == TRANSLATION_FROM_L1D)) {
            PTW_interface[read_cpu]->return_data(&RQ.entry[index]);

          }
          #endif

	  #ifdef PTW_L1D_L2C
          else if( (RQ.entry[index].type == PREFETCH_TRANSLATION ||
                    RQ.entry[index].type == LOAD_TRANSLATION ||
                    RQ.entry[index].type == TRANSLATION_FROM_L1D) &&
	           ((cache_type == IS_L1D && RQ.entry[index].translation_level > 1) ||
		    (cache_type == IS_L2C && RQ.entry[index].translation_level == 1) ) ){

            assert(RQ.entry[index].translation_level > 0 && RQ.entry[index].translation_level < 6);
            PTW_interface[read_cpu]->return_data(&RQ.entry[index]);
          }
          #endif

	  /*else if (cache_type == IS_L2C &&
                     (RQ.entry[index].type == PREFETCH_TRANSLATION ||
                      RQ.entry[index].type == LOAD_TRANSLATION ||
                      RQ.entry[index].type == TRANSLATION_FROM_L1D)) {
            extra_interface->return_data(&RQ.entry[index]);
	  }*/

	  else if (cache_type == IS_L2C) {
            if (RQ.entry[index].send_both_cache) {
              upper_level_icache[read_cpu]->return_data(&RQ.entry[index]);
              upper_level_dcache[read_cpu]->return_data(&RQ.entry[index]);
            } else if (RQ.entry[index].fill_l1i || RQ.entry[index].fill_l1d) {
              if (RQ.entry[index].fill_l1i)
                upper_level_icache[read_cpu]->return_data(&RQ.entry[index]);
              if (RQ.entry[index].fill_l1d)
                upper_level_dcache[read_cpu]->return_data(&RQ.entry[index]);
            } else if (RQ.entry[index].instruction)
              upper_level_icache[read_cpu]->return_data(&RQ.entry[index]);
            else if (RQ.entry[index].is_data)
              upper_level_dcache[read_cpu]->return_data(&RQ.entry[index]);
          } else {
            if (RQ.entry[index].instruction) {
              RQ.entry[index].data = block[set][way].data;
              upper_level_icache[read_cpu]->return_data(&RQ.entry[index]);
            } else // data
            {
              RQ.entry[index].data = block[set][way].data;
              upper_level_dcache[read_cpu]->return_data(&RQ.entry[index]);
            }
#ifdef SANITY_CHECK
            if (cache_type == IS_ITLB || cache_type == IS_DTLB)
              if (RQ.entry[index].data == 0)
                assert(0);
#endif
          }
        }

        // update prefetch stats and reset prefetch bit
        if (block[set][way].prefetch) {
          pf_useful++;
          block[set][way].prefetch = 0;
        }
        block[set][way].used = 1;

        HIT[RQ.entry[index].type]++;
        ACCESS[RQ.entry[index].type]++;

        // remove this entry from RQ
        RQ.remove_queue(&RQ.entry[index]);
        reads_available_this_cycle--;
      } else { // read miss

        DP(if (warmup_complete[read_cpu]) {
          cout << "[" << NAME << "] " << __func__ << " read miss";
          cout << " instr_id: " << RQ.entry[index].instr_id
               << " address: " << hex << RQ.entry[index].address;
          cout << " full_addr: " << RQ.entry[index].full_addr << dec;
          cout << " cycle: " << RQ.entry[index].event_cycle << endl;
        });

#ifdef IDEAL_CACHE_FOR_TRANSLATION_ACCESS
 #ifdef IDEAL_L1D
      if (cache_type == IS_L1D && 
            (RQ.entry[index].type == PREFETCH_TRANSLATION ||
            RQ.entry[index].type == LOAD_TRANSLATION ||
            RQ.entry[index].type == TRANSLATION_FROM_L1D) &&
            unique_translation_access.find(RQ.entry[index].full_physical_address >> LOG2_BLOCK_SIZE) != unique_translation_access.end() &&
            stall_rq_index.find(index) == stall_rq_index.end() )
 #endif

 #ifdef IDEAL_L2
      if (cache_type == IS_L2C && (RQ.entry[index].type == PREFETCH_TRANSLATION ||
            RQ.entry[index].type == LOAD_TRANSLATION ||
            RQ.entry[index].type == TRANSLATION_FROM_L1D) &&
            unique_translation_access.find(RQ.entry[index].address) != unique_translation_access.end() &&
            stall_rq_index.find(index) == stall_rq_index.end() ) 
 #endif

 #ifdef IDEAL_L3
      if (cache_type == IS_LLC
         && (RQ.entry[index].type == PREFETCH_TRANSLATION ||
            RQ.entry[index].type == LOAD_TRANSLATION ||
            RQ.entry[index].type == TRANSLATION_FROM_L1D) &&
            unique_translation_access.find(RQ.entry[index].address) != unique_translation_access.end() &&
            stall_rq_index.find(index) == stall_rq_index.end() ) 
 #endif
	{

	  PTW_interface[read_cpu]->return_data(&RQ.entry[index]);

          // COLLECT STATS
          change_miss_to_hit++;
          sim_hit[read_cpu][RQ.entry[index].type]++;
          sim_access[read_cpu][RQ.entry[index].type]++;
          HIT[RQ.entry[index].type]++;
          ACCESS[RQ.entry[index].type]++;
        }
#endif

        // check mshr
        uint8_t miss_handled = 1;
        int mshr_index = check_nonfifo_queue(
            &MSHR, &RQ.entry[index], false); //@Vishal: Updated from check_mshr

        if (mshr_index == -2) {
          // this is a data/instruction collision in the MSHR, so we have to
          // wait before we can allocate this miss
          miss_handled = 0;
        }

        if ((mshr_index == -1) &&
            (MSHR.occupancy < MSHR_SIZE)) { // this is a new miss

          if (cache_type == IS_STLB &&
              MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D)
            pf_lower_level++;

          if (cache_type == IS_LLC) {
            // check to make sure the DRAM RQ has room for this LLC read miss
            if (lower_level->get_occupancy(1, RQ.entry[index].address) ==
                lower_level->get_size(1, RQ.entry[index].address)) {
              miss_handled = 0;
            } else {

              add_nonfifo_queue(
                  &MSHR, &RQ.entry[index]); //@Vishal: Updated from add_mshr
              if (lower_level) {
                lower_level->add_rq(&RQ.entry[index]);
              }
            }
          } else {

            if (cache_type == IS_L1I || cache_type == IS_L1D) //@Vishal: VIPT
            {
              assert(RQ.entry[index].full_physical_address != 0);
              // Neelu: Added to processed queue even on miss for ideal L1
              // prefetcher, comment if not needed.
#ifdef Ideal_L1D_Prefetcher
              if ((cache_type == IS_L1D) &&
                  (RQ.entry[index].type != PREFETCH)) {
                if (PROCESSED.occupancy < PROCESSED.SIZE)
                  PROCESSED.add_queue(&RQ.entry[index]);
              }
#endif
              PACKET new_packet = RQ.entry[index];
              //@Vishal: Send physical address to lower level and track physical
              //address in MSHR
              new_packet.address =
                  RQ.entry[index].full_physical_address >> LOG2_BLOCK_SIZE;
              new_packet.full_addr = RQ.entry[index].full_physical_address;

              add_nonfifo_queue(&MSHR,
                                &new_packet); //@Vishal: Updated from add_mshr
              lower_level->add_rq(&new_packet);
            } else {

              // add it to mshr (read miss)
              add_nonfifo_queue(
                  &MSHR, &RQ.entry[index]); //@Vishal: Updated from add_mshr

              // add it to the next level's read queue
              if (lower_level)
                lower_level->add_rq(&RQ.entry[index]);
              else { // this is the last level
#ifdef INS_PAGE_TABLE_WALKER
                assert(0);
#else
                if (cache_type == IS_STLB) {
                  // TODO: need to differentiate page table walk and actual swap

                  // emulate page table walk
                  uint64_t pa = va_to_pa(read_cpu, RQ.entry[index].instr_id,
                                         RQ.entry[index].full_addr,
                                         RQ.entry[index].address);
                  RQ.entry[index].data = pa >> LOG2_PAGE_SIZE;
                  RQ.entry[index].event_cycle = current_core_cycle[read_cpu];

                  if (RQ.entry[index].l1_pq_index !=
                      -1) //@Vishal: Check if the current request is sent from
                          //L1D prefetcher
                  {
                    assert(RQ.entry[index].l1_rq_index == -1 &&
                           RQ.entry[index].l1_wq_index ==
                               -1); //@Vishal: these should not be set

                    RQ.entry[index].data_pa = pa >> LOG2_PAGE_SIZE;
                    if (PROCESSED.occupancy < PROCESSED.SIZE)
                      PROCESSED.add_queue(&RQ.entry[index]);
                    else
                      assert(0);
                  }

                  return_data(&RQ.entry[index]);
                }
#endif
              }
            }
          }
        } else {
          if ((mshr_index == -1) &&
              (MSHR.occupancy == MSHR_SIZE)) { // not enough MSHR resource

            // cannot handle miss request until one of MSHRs is available
            miss_handled = 0;
            STALL[RQ.entry[index].type]++;

#ifdef IDEAL_CACHE_FOR_TRANSLATION_ACCESS
            stall_rq_index.insert(index);
#endif
          } else if (mshr_index != -1) { // already in-flight miss

#ifdef IDEAL_CACHE_FOR_TRANSLATION_ACCESS
 #ifdef IDEAL_L1D
            if (cache_type == IS_L1D && (RQ.entry[index].type == PREFETCH_TRANSLATION ||
                 RQ.entry[index].type == LOAD_TRANSLATION ||
                 RQ.entry[index].type == TRANSLATION_FROM_L1D) )
 #endif

 #ifdef IDEAL_L2
            if (cache_type == IS_L2C && (RQ.entry[index].type == PREFETCH_TRANSLATION ||
                 RQ.entry[index].type == LOAD_TRANSLATION ||
                 RQ.entry[index].type == TRANSLATION_FROM_L1D) )
 #endif

 #ifdef IDEAL_L3
            if (cache_type == IS_LLC && (RQ.entry[index].type == PREFETCH_TRANSLATION ||
                 RQ.entry[index].type == LOAD_TRANSLATION ||
                 RQ.entry[index].type == TRANSLATION_FROM_L1D) )
 #endif 
	    {
              merged_translations++;
            }
#endif

            // mark merged consumer
            if (RQ.entry[index].type == RFO) {

              if (RQ.entry[index].tlb_access) {
                // checking for dead code
                assert(0);
              }

              if (RQ.entry[index].load_merged) {
                MSHR.entry[mshr_index].load_merged = 1;
                MSHR.entry[mshr_index].lq_index_depend_on_me.join(
                    RQ.entry[index].lq_index_depend_on_me, LQ_SIZE);
              }

            } else {
              if (RQ.entry[index].instruction) {
                uint32_t rob_index = RQ.entry[index].rob_index;
                DP(if (warmup_complete[MSHR.entry[mshr_index].cpu]) {
                  cout << "read request merged with MSHR entry -"
                       << MSHR.entry[mshr_index].type << endl;
                });
                MSHR.entry[mshr_index].instr_merged = 1;
                MSHR.entry[mshr_index].rob_index_depend_on_me.insert(rob_index);

                DP(if (warmup_complete[MSHR.entry[mshr_index].cpu]) {
                  cout << "[INSTR_MERGED] " << __func__
                       << " cpu: " << MSHR.entry[mshr_index].cpu
                       << " instr_id: " << MSHR.entry[mshr_index].instr_id;
                  cout << " merged rob_index: " << rob_index
                       << " instr_id: " << RQ.entry[index].instr_id << endl;
                });

                if (RQ.entry[index].instr_merged) {
                  MSHR.entry[mshr_index].rob_index_depend_on_me.join(
                      RQ.entry[index].rob_index_depend_on_me, ROB_SIZE);
                  DP(if (warmup_complete[MSHR.entry[mshr_index].cpu]) {
                    cout << "[INSTR_MERGED] " << __func__
                         << " cpu: " << MSHR.entry[mshr_index].cpu
                         << " instr_id: " << MSHR.entry[mshr_index].instr_id;
                    cout << " merged rob_index: " << i << " instr_id: N/A"
                         << endl;
                  });
                }
              } else {
                // Neelu: Added to processed queue even on miss for ideal L1
                // prefetcher, comment if not needed.
#ifdef Ideal_L1D_Prefetcher
                if ((cache_type == IS_L1D) &&
                    (RQ.entry[index].type != PREFETCH)) {
                  if (PROCESSED.occupancy < PROCESSED.SIZE)
                    PROCESSED.add_queue(&RQ.entry[index]);
                }
#endif

                uint32_t lq_index = RQ.entry[index].lq_index;
                MSHR.entry[mshr_index].load_merged = 1;
                MSHR.entry[mshr_index].lq_index_depend_on_me.insert(lq_index);

                DP(if (warmup_complete[read_cpu]) {
                  cout << "[DATA_MERGED] " << __func__ << " cpu: " << read_cpu
                       << " instr_id: " << RQ.entry[index].instr_id;
                  cout << " merged rob_index: " << RQ.entry[index].rob_index
                       << " instr_id: " << RQ.entry[index].instr_id
                       << " lq_index: " << RQ.entry[index].lq_index << endl;
                });
                MSHR.entry[mshr_index].lq_index_depend_on_me.join(
                    RQ.entry[index].lq_index_depend_on_me, LQ_SIZE);
                if (RQ.entry[index].store_merged) {
                  MSHR.entry[mshr_index].store_merged = 1;
                  MSHR.entry[mshr_index].sq_index_depend_on_me.join(
                      RQ.entry[index].sq_index_depend_on_me, SQ_SIZE);
                }
              }
            }

            //@Vasudha:request coming from both DTLB and ITLB should be returned
            //to both
            if (cache_type == IS_STLB) {
              if (RQ.entry[index].fill_level == 1 &&
                  MSHR.entry[mshr_index].fill_level == 1)
                if (RQ.entry[index].instruction !=
                    MSHR.entry[mshr_index].instruction) {
                  RQ.entry[index].send_both_tlb =
                      1; // RQ will be overwritten to MSHR
                  MSHR.entry[mshr_index].send_both_tlb =
                      1; // If RQ in not overwritten to MSHR
                }
            }
            // update fill_level
            if (RQ.entry[index].fill_level <
                MSHR.entry[mshr_index].fill_level) {
              MSHR.entry[mshr_index].fill_level = RQ.entry[index].fill_level;
              MSHR.entry[mshr_index].instruction = RQ.entry[index].instruction;
            }

            if ((RQ.entry[index].fill_l1i) &&
                (MSHR.entry[mshr_index].fill_l1i != 1)) {
              MSHR.entry[mshr_index].fill_l1i = 1;
            }
            if ((RQ.entry[index].fill_l1d) &&
                (MSHR.entry[mshr_index].fill_l1d != 1)) {
              MSHR.entry[mshr_index].fill_l1d = 1;
            }

            bool merging_already_done = false;

            // update request
            if ((MSHR.entry[mshr_index].type == PREFETCH &&
                 RQ.entry[index].type != PREFETCH) ||
                (MSHR.entry[mshr_index].type == PREFETCH_TRANSLATION &&
                 RQ.entry[index].type != PREFETCH_TRANSLATION) ||
                (MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D &&
                 RQ.entry[index].type != TRANSLATION_FROM_L1D)) {

              merging_already_done = true;
              uint8_t prior_returned = MSHR.entry[mshr_index].returned;
              uint64_t prior_event_cycle = MSHR.entry[mshr_index].event_cycle;
              uint64_t prior_data = 0;

              uint64_t prior_address = MSHR.entry[mshr_index].address;
              uint64_t prior_full_addr = MSHR.entry[mshr_index].full_addr;
              uint64_t prior_full_physical_address =
                  MSHR.entry[mshr_index].full_physical_address;
              uint8_t prior_fill_l1i = MSHR.entry[mshr_index].fill_l1i;
              uint8_t prior_fill_l1d = MSHR.entry[mshr_index].fill_l1d;
              // Neelu: Need to save instruction field as well.
              uint8_t prior_instruction = MSHR.entry[mshr_index].instruction;

              if (cache_type == IS_ITLB || cache_type == IS_DTLB ||
                  cache_type == IS_STLB) {
                assert(MSHR.entry[mshr_index].type != PREFETCH);
                /* data(translation) should be copied in case of TLB if MSHR
                 * entry is completed and is not filled in cache yet */
                if (MSHR.entry[mshr_index].returned == COMPLETED) {
                  prior_data = MSHR.entry[mshr_index].data;
                }

                //@Vishal: Copy previous data from MSHR

                if (MSHR.entry[mshr_index].read_translation_merged) {
                  RQ.entry[index].read_translation_merged = 1;
                  RQ.entry[index].l1_rq_index_depend_on_me.join(
                      MSHR.entry[mshr_index].l1_rq_index_depend_on_me, RQ_SIZE);
                }

                if (MSHR.entry[mshr_index].write_translation_merged) {
                  RQ.entry[index].write_translation_merged = 1;
                  RQ.entry[index].l1_wq_index_depend_on_me.join(
                      MSHR.entry[mshr_index].l1_wq_index_depend_on_me, WQ_SIZE);
                }

                if (MSHR.entry[mshr_index].prefetch_translation_merged) {
                  RQ.entry[index].prefetch_translation_merged = 1;
                  RQ.entry[index].l1_pq_index_depend_on_me.join(
                      MSHR.entry[mshr_index].l1_pq_index_depend_on_me, PQ_SIZE);
                }

                if (MSHR.entry[mshr_index].l1_rq_index != -1) {
                  assert((MSHR.entry[mshr_index].l1_wq_index == -1) &&
                         (MSHR.entry[mshr_index].l1_pq_index == -1));
                  RQ.entry[index].read_translation_merged = 1;
                  RQ.entry[index].l1_rq_index_depend_on_me.insert(
                      MSHR.entry[mshr_index].l1_rq_index);
                }

                if (MSHR.entry[mshr_index].l1_wq_index != -1) {
                  assert((MSHR.entry[mshr_index].l1_rq_index == -1) &&
                         (MSHR.entry[mshr_index].l1_pq_index == -1));
                  RQ.entry[index].write_translation_merged = 1;
                  RQ.entry[index].l1_wq_index_depend_on_me.insert(
                      MSHR.entry[mshr_index].l1_wq_index);
                }

                if (MSHR.entry[mshr_index].l1_pq_index != -1) {
                  assert((MSHR.entry[mshr_index].l1_wq_index == -1) &&
                         (MSHR.entry[mshr_index].l1_rq_index == -1));
                  RQ.entry[index].prefetch_translation_merged = 1;
                  RQ.entry[index].l1_pq_index_depend_on_me.insert(
                      MSHR.entry[mshr_index].l1_pq_index);

                  DP(if (warmup_complete[read_cpu]) {
                    cout << "[" << NAME << "] " << __func__
                         << " this should be printed.  instr_id: "
                         << RQ.entry[index].instr_id
                         << " prior_id: " << MSHR.entry[mshr_index].instr_id;
                    cout << " address: " << hex << RQ.entry[index].address
                         << " full_addr: " << RQ.entry[index].full_addr << dec;
                    if (RQ.entry[index].read_translation_merged)
                      cout << " read_translation_merged ";
                    if (RQ.entry[index].write_translation_merged)
                      cout << " write_translation_merged ";
                    if (RQ.entry[index].prefetch_translation_merged)
                      cout << " prefetch_translation_merged ";

                    cout << " cycle: " << RQ.entry[index].event_cycle << endl;
                  });
                }

              } else
                assert(MSHR.entry[mshr_index].type != TRANSLATION_FROM_L1D ||
                       MSHR.entry[mshr_index].type != PREFETCH_TRANSLATION);

              if (RQ.entry[index].fill_level >
                  MSHR.entry[mshr_index].fill_level)
                RQ.entry[index].fill_level = MSHR.entry[mshr_index].fill_level;

              if (cache_type == IS_ITLB || cache_type == IS_DTLB ||
                  cache_type == IS_STLB) {
                if ((MSHR.entry[mshr_index].type == PREFETCH_TRANSLATION ||
                     MSHR.entry[mshr_index].type == TRANSLATION_FROM_L1D) &&
                    RQ.entry[index].type == LOAD_TRANSLATION)
                  ++pf_late;
              } else
                ++pf_late; //@v Late prefetch-> on-demand requests hit in MSHR

              MSHR.entry[mshr_index] = RQ.entry[index];

              if (prior_fill_l1i && MSHR.entry[mshr_index].fill_l1i == 0)
                MSHR.entry[mshr_index].fill_l1i = 1;
              if (prior_fill_l1d && MSHR.entry[mshr_index].fill_l1d == 0)
                MSHR.entry[mshr_index].fill_l1d = 1;

              // Neelu: Need to save instruction field as well.
              if (prior_instruction && MSHR.entry[mshr_index].instruction == 0)
                MSHR.entry[mshr_index].instruction = 1;

              DP(if (warmup_complete[read_cpu]) {
                cout << "[" << NAME << "] " << __func__
                     << " this should be printed";
                cout << " instr_id: " << RQ.entry[index].instr_id
                     << " prior_id: " << MSHR.entry[mshr_index].instr_id;
                cout << " address: " << hex << RQ.entry[index].address;
                cout << " full_addr: " << RQ.entry[index].full_addr << dec;
                if (MSHR.entry[mshr_index].read_translation_merged)
                  cout << " read_translation_merged ";
                if (MSHR.entry[mshr_index].write_translation_merged)
                  cout << " write_translation_merged ";
                if (MSHR.entry[mshr_index].prefetch_translation_merged)
                  cout << " prefetch_translation_merged ";

                cout << " cycle: " << RQ.entry[index].event_cycle << endl;
              });

              //@Vishal: L1 RQ has virtual address, but miss needs to track
              //physical address, so prior addresses are kept
              if (cache_type == IS_L1D || cache_type == IS_L1I) {
                MSHR.entry[mshr_index].address = prior_address;
                MSHR.entry[mshr_index].full_addr = prior_full_addr;
                MSHR.entry[mshr_index].full_physical_address =
                    prior_full_physical_address;
              }

              // in case request is already returned, we should keep event_cycle
              // and retunred variables
              MSHR.entry[mshr_index].returned = prior_returned;
              MSHR.entry[mshr_index].event_cycle = prior_event_cycle;
              MSHR.entry[mshr_index].data = prior_data;

              // Neelu: set the late bit
              if (cache_type == IS_L1D) {
                // cout<<"Neelu: MSHR entry late_pref INC"<<endl;
                MSHR.entry[mshr_index].late_pref = 1;
                late_prefetch++;
              }
            }

            //@Vishal: Check if any translation is dependent on this read
            //request
            if (!merging_already_done &&
                (cache_type == IS_ITLB || cache_type == IS_DTLB ||
                 cache_type == IS_STLB)) {
              if (RQ.entry[index].read_translation_merged) {
                MSHR.entry[mshr_index].read_translation_merged = 1;
                MSHR.entry[mshr_index].l1_rq_index_depend_on_me.join(
                    RQ.entry[index].l1_rq_index_depend_on_me, RQ_SIZE);
              }

              if (RQ.entry[index].write_translation_merged) {
                MSHR.entry[mshr_index].write_translation_merged = 1;
                MSHR.entry[mshr_index].l1_wq_index_depend_on_me.join(
                    RQ.entry[index].l1_wq_index_depend_on_me, WQ_SIZE);
              }

              if (RQ.entry[index].prefetch_translation_merged) {
                MSHR.entry[mshr_index].prefetch_translation_merged = 1;
                MSHR.entry[mshr_index].l1_pq_index_depend_on_me.join(
                    RQ.entry[index].l1_pq_index_depend_on_me, PQ_SIZE);
              }

              if (RQ.entry[index].l1_rq_index != -1) {
                assert((RQ.entry[index].l1_wq_index == -1) &&
                       (RQ.entry[index].l1_pq_index == -1));
                MSHR.entry[mshr_index].read_translation_merged = 1;
                MSHR.entry[mshr_index].l1_rq_index_depend_on_me.insert(
                    RQ.entry[index].l1_rq_index);
              }

              if (RQ.entry[index].l1_wq_index != -1) {
                assert((RQ.entry[index].l1_rq_index == -1) &&
                       (RQ.entry[index].l1_pq_index == -1));
                MSHR.entry[mshr_index].write_translation_merged = 1;
                MSHR.entry[mshr_index].l1_wq_index_depend_on_me.insert(
                    RQ.entry[index].l1_wq_index);
              }

              if (RQ.entry[index].l1_pq_index != -1) {
                assert((RQ.entry[index].l1_wq_index == -1) &&
                       (RQ.entry[index].l1_rq_index == -1));
                MSHR.entry[mshr_index].prefetch_translation_merged = 1;
                MSHR.entry[mshr_index].l1_pq_index_depend_on_me.insert(
                    RQ.entry[index].l1_pq_index);
              }
            }

            MSHR_MERGED[RQ.entry[index].type]++;

            DP(if (warmup_complete[read_cpu]) {
              cout << "[" << NAME << "] " << __func__ << " mshr merged";
              cout << " instr_id: " << RQ.entry[index].instr_id
                   << " prior_id: " << MSHR.entry[mshr_index].instr_id;
              cout << " address: " << hex << RQ.entry[index].address;
              cout << " full_addr: " << RQ.entry[index].full_addr << dec;
              if (MSHR.entry[mshr_index].read_translation_merged)
                cout << " read_translation_merged ";
              if (MSHR.entry[mshr_index].write_translation_merged)
                cout << " write_translation_merged ";
              if (MSHR.entry[mshr_index].prefetch_translation_merged)
                cout << " prefetch_translation_merged ";

              cout << " cycle: " << RQ.entry[index].event_cycle << endl;
            });
          } else { // WE SHOULD NOT REACH HERE
            cerr << "[" << NAME << "] MSHR errors" << endl;
            assert(0);
          }
        }

        if (miss_handled) {
          // update prefetcher on load instruction
          if (RQ.entry[index].type == LOAD) {
            assert(cache_type != IS_ITLB || cache_type != IS_DTLB ||
                   cache_type != IS_STLB);

            if (cache_type == IS_L1I)
              l1i_prefetcher_cache_operate(read_cpu, RQ.entry[index].ip, 0, 0);
            if (cache_type == IS_L1D)
              l1d_prefetcher_operate(RQ.entry[index].full_addr,
                                     RQ.entry[index].ip, 0,
                                     RQ.entry[index].type);
            else if ((cache_type == IS_L2C) &&
                     (RQ.entry[index].type != PREFETCH_TRANSLATION) &&
                     (RQ.entry[index].instruction == 0) &&
                     (RQ.entry[index].type != LOAD_TRANSLATION) &&
                     (RQ.entry[index].type != PREFETCH_TRANSLATION) &&
                     (RQ.entry[index].type != TRANSLATION_FROM_L1D))
              l2c_prefetcher_operate(RQ.entry[index].address << LOG2_BLOCK_SIZE,
                                     RQ.entry[index].ip, 0,
                                     RQ.entry[index].type, 0);
            else if (cache_type == IS_LLC) {
              cpu = read_cpu;
              llc_prefetcher_operate(RQ.entry[index].address << LOG2_BLOCK_SIZE,
                                     RQ.entry[index].ip, 0,
                                     RQ.entry[index].type, 0);
              cpu = 0;
            }
          } else if (RQ.entry[index].type == LOAD_TRANSLATION) {
            assert(cache_type != IS_L1D || cache_type != IS_L1I ||
                   cache_type != IS_L2C || cache_type != IS_LLC);
            if (cache_type == IS_ITLB) {
              itlb_prefetcher_operate(
                  RQ.entry[index].address << LOG2_PAGE_SIZE, RQ.entry[index].ip,
                  0, RQ.entry[index].type, RQ.entry[index].instr_id,
                  RQ.entry[index].instruction);

            } else if (cache_type == IS_DTLB) {
#ifdef SANITY_CHECK
              if (RQ.entry[index].instruction) {
                cout << "DTLB prefetch packet should not prefetch address "
                        "translation of instruction "
                     << endl;
                assert(0);
              }
#endif
              dtlb_prefetcher_operate(
                  RQ.entry[index].address << LOG2_PAGE_SIZE, RQ.entry[index].ip,
                  0, RQ.entry[index].type, RQ.entry[index].instr_id,
                  RQ.entry[index].instruction);

            } else if (cache_type == IS_STLB) {
              // Neelu: Sending l1d prefetcher accuracy and l2c mpki to stlb
              // prefetcher.
             /* uint32_t l2c_mpki;
              if (warmup_complete[read_cpu]) {
                if (ooo_cpu[read_cpu].num_retired -
                        ooo_cpu[read_cpu].warmup_instructions >
                    0)
                  l2c_mpki =
                      (ooo_cpu[read_cpu].L2C.sim_miss[read_cpu][0] * 1000) /
                      (ooo_cpu[read_cpu].num_retired -
                       ooo_cpu[read_cpu].warmup_instructions);
                else if (ooo_cpu[read_cpu].num_retired > 0)
                  l2c_mpki =
                      (ooo_cpu[read_cpu].L2C.sim_miss[read_cpu][0] * 1000) /
                      (ooo_cpu[read_cpu].num_retired);
	      }*/

              int temp_type = LOAD;
              if (RQ.entry[index].prefetch_translation_merged == true ||
                  RQ.entry[index].l1_pq_index != -1)
                temp_type = PREFETCH;
              stlb_prefetcher_operate(RQ.entry[index].address << LOG2_PAGE_SIZE,
                                      RQ.entry[index].ip, 0, temp_type,
                                      RQ.entry[index].instr_id,
                                      RQ.entry[index].instruction);
	    }
          }

          MISS[RQ.entry[index].type]++;
          ACCESS[RQ.entry[index].type]++;

          // remove this entry from RQ
          RQ.remove_queue(&RQ.entry[index]);
          reads_available_this_cycle--;

#ifdef IDEAL_CACHE_FOR_TRANSLATION_ACCESS
          unordered_set<uint64_t>::iterator it =  stall_rq_index.find(index);
          if(it != stall_rq_index.end()){
            stall_rq_index.erase(it);
          }
#endif

        }
      }
    } else {
      return;
    }

    if (reads_available_this_cycle == 0) {
      return;
    }
  }
}

void CACHE::handle_prefetch() {
  // handle prefetch

  for (uint32_t i = 0; i < MAX_READ; i++) {

    uint32_t prefetch_cpu = PQ.entry[PQ.head].cpu;
    if (prefetch_cpu == NUM_CPUS)
      return;

    // handle the oldest entry
    if ((PQ.entry[PQ.head].event_cycle <= current_core_cycle[prefetch_cpu]) &&
        (PQ.occupancy > 0)) {

      if (cache_type == IS_L1D &&
          (PQ.entry[PQ.head].translated !=
           COMPLETED)) //@Vishal: Check if the translation is done for that
                       //prefetch request or not.
      {
        return;
      }

      // Neelu: Translation complete check for L1I prefetch requsts
      if ((cache_type == IS_L1I) &&
          (PQ.entry[PQ.head].translated != COMPLETED)) {
        return;
      }
      int index = PQ.head;
      if ((cache_type == IS_L1D || cache_type == IS_L1I) &&
          (PQ.entry[PQ.head].full_physical_address >> LOG2_PAGE_SIZE) ==
              (UINT64_MAX >> LOG2_PAGE_SIZE)) {
        pf_dropped++;
        // Due to page fault, prefetch request should be dropped
        DP(if (warmup_complete[PQ.entry[index].cpu]) {
          cout << "[" << NAME << "_PQ] " << __func__
               << " prefetch_id: " << PQ.entry[index].prefetch_id
               << "from handle prefetch on dropping prefetch request"
               << "instruction : " << PQ.entry[index].instruction << endl;
        });
        PQ.remove_queue(&PQ.entry[index]);
        continue;
      }

      // access cache
      uint32_t set = get_set(PQ.entry[index].address);
      int way = check_hit(&PQ.entry[index]);

      if (way >= 0) { // prefetch hit

        // update replacement policy
        (this->*update_replacement_state)(
            prefetch_cpu, set, way, block[set][way].full_addr,
            PQ.entry[index].ip, 0, PQ.entry[index].type, 1);

        // COLLECT STATS
        sim_hit[prefetch_cpu][PQ.entry[index].type]++;
        sim_access[prefetch_cpu][PQ.entry[index].type]++;

#ifdef PT_STATS
      if ((cache_type == IS_L1D || cache_type == IS_L2C || cache_type == IS_LLC) && PQ.entry[index].type == LOAD_TRANSLATION){
        assert(PQ.entry[index].translation_level > 0 && PQ.entry[index].translation_level < 6);
        sim_pt_hit[prefetch_cpu][PQ.entry[index].translation_level-1]++;
        sim_pt_access[prefetch_cpu][PQ.entry[index].translation_level-1]++;
      }
#endif

        // run prefetcher on prefetches from higher caches
        if (PQ.entry[index].pf_origin_level < fill_level) {
          if (cache_type == IS_L1D) {
            //@Vishal: This should never be executed as fill_level of L1 is 1
            //and minimum pf_origin_level is 1
            assert(0);
          } else if ((cache_type == IS_L2C) &&
                     (RQ.entry[index].type != PREFETCH_TRANSLATION) &&
                     (RQ.entry[index].instruction == 0) &&
                     (RQ.entry[index].type != LOAD_TRANSLATION) &&
                     (RQ.entry[index].type != PREFETCH_TRANSLATION) &&
                     (RQ.entry[index].type != TRANSLATION_FROM_L1D)) {
            PQ.entry[index].pf_metadata = l2c_prefetcher_operate(
                block[set][way].address << LOG2_BLOCK_SIZE, PQ.entry[index].ip,
                1, PREFETCH, PQ.entry[index].pf_metadata);
          } else if (cache_type == IS_LLC) {
            cpu = prefetch_cpu;

            PQ.entry[index].pf_metadata = llc_prefetcher_operate(
                block[set][way].address << LOG2_BLOCK_SIZE, PQ.entry[index].ip,
                1, PREFETCH, PQ.entry[index].pf_metadata);
            cpu = 0;
          } else if (cache_type == IS_ITLB) {
            itlb_prefetcher_operate(PQ.entry[index].address << LOG2_PAGE_SIZE,
                                    PQ.entry[index].ip, 1, PQ.entry[index].type,
                                    PQ.entry[index].prefetch_id,
                                    PQ.entry[index].instruction);
            DP(if (warmup_complete[PQ.entry[index].cpu]) {
              cout << "[" << NAME << "_PQ] " << __func__
                   << " prefetch_id: " << PQ.entry[index].prefetch_id
                   << "from handle prefetch on prefetch hit"
                   << "instruction : " << PQ.entry[index].instruction << endl;
            });
          } else if (cache_type == IS_DTLB) {
#ifdef SANITY_CHECK
            if (PQ.entry[index].instruction) {
              cout << "DTLB prefetch packet should not prefetch address "
                      "translation of instruction "
                   << endl;
              assert(0);
            }
#endif
            dtlb_prefetcher_operate(PQ.entry[index].address << LOG2_PAGE_SIZE,
                                    PQ.entry[index].ip, 1, PQ.entry[index].type,
                                    PQ.entry[index].prefetch_id,
                                    PQ.entry[index].instruction);
            DP(if (warmup_complete[PQ.entry[index].cpu]) {
              cout << "[" << NAME << "_PQ] " << __func__
                   << " prefetch_id: " << PQ.entry[index].prefetch_id
                   << "from handle prefetch on prefetch hit"
                   << "instruction : " << PQ.entry[index].instruction << endl;
            });
          } else if (cache_type == IS_STLB) {
            stlb_prefetcher_operate(PQ.entry[index].address << LOG2_PAGE_SIZE,
                                    PQ.entry[index].ip, 1, PQ.entry[index].type,
                                    PQ.entry[index].prefetch_id,
                                    PQ.entry[index].instruction);
            DP(if (warmup_complete[PQ.entry[index].cpu]) {
              cout << "[" << NAME << "_PQ] " << __func__
                   << " prefetch_id: " << PQ.entry[index].prefetch_id
                   << "from handle prefetch on prefetch hit"
                   << "instruction " << PQ.entry[index].instruction
                   << "  address: " << PQ.entry[index].address << endl;
            });
          }
        }

        // check fill level
        // data should be updated (for TLBs) in case of hit
        if (PQ.entry[index].fill_level < fill_level) {

          if (cache_type == IS_STLB) {
            if (PQ.entry[index].send_both_tlb) {
              PQ.entry[index].data = block[set][way].data;
              upper_level_icache[prefetch_cpu]->return_data(&PQ.entry[index]);
              upper_level_dcache[prefetch_cpu]->return_data(&PQ.entry[index]);
            } else if (PQ.entry[index].instruction) {
              PQ.entry[index].data = block[set][way].data;
              upper_level_icache[prefetch_cpu]->return_data(&PQ.entry[index]);
            } else // data
            {
              PQ.entry[index].data = block[set][way].data;
              upper_level_dcache[prefetch_cpu]->return_data(&PQ.entry[index]);
            }

#ifdef SANITY_CHECK
            if (PQ.entry[index].data == 0)
              assert(0);
#endif
          } else if (fill_level == FILL_L2) {
            if (PQ.entry[index].fill_l1i) {
              PQ.entry[index].data = block[set][way].data;
              upper_level_icache[prefetch_cpu]->return_data(&PQ.entry[index]);
            }
            if (PQ.entry[index].fill_l1d) {
              PQ.entry[index].data = block[set][way].data;
              upper_level_dcache[prefetch_cpu]->return_data(&PQ.entry[index]);
            }
          } else {
            if (PQ.entry[index].instruction) {
              PQ.entry[index].data = block[set][way].data;
              upper_level_icache[prefetch_cpu]->return_data(&PQ.entry[index]);
            } else // data
            {
              PQ.entry[index].data = block[set][way].data;
              upper_level_dcache[prefetch_cpu]->return_data(&PQ.entry[index]);
            }

#ifdef SANITY_CHECK
            if (cache_type == IS_ITLB || cache_type == IS_DTLB)
              if (PQ.entry[index].data == 0)
                assert(0);
#endif
          }
        }

        HIT[PQ.entry[index].type]++;
        ACCESS[PQ.entry[index].type]++;

        // remove this entry from PQ
        PQ.remove_queue(&PQ.entry[index]);
        reads_available_this_cycle--;
      } else { // prefetch miss

        DP(if (warmup_complete[prefetch_cpu]) {
          cout << "[" << NAME << "] " << __func__ << " prefetch miss";
          cout << " instr_id: " << PQ.entry[index].prefetch_id
               << " address: " << hex << PQ.entry[index].address;
          cout << " full_addr: " << PQ.entry[index].full_addr << dec
               << " fill_level: " << PQ.entry[index].fill_level;
          cout << " cycle: " << PQ.entry[index].event_cycle << endl;
        });

        // check mshr
        uint8_t miss_handled = 1;
        int mshr_index = check_nonfifo_queue(
            &MSHR, &PQ.entry[index], false); //@Vishal: Updated from check_mshr

        if ((mshr_index == -1) &&
            (MSHR.occupancy < MSHR_SIZE)) { // this is a new miss

          // Neelu: Calculting number of prefetches issued from L1D to L2C i.e.
          // the next level
          if (cache_type == IS_L1D)
            prefetch_count++;

          ++pf_lower_level; //@v Increment for new prefetch miss

          DP(if (warmup_complete[PQ.entry[index].cpu]) {
            cout << "[" << NAME << "_PQ] " << __func__
                 << " want to add prefetch_id: " << PQ.entry[index].prefetch_id
                 << " address: " << hex << PQ.entry[index].address;
            cout << " full_addr: " << PQ.entry[index].full_addr << dec;
            if (lower_level)
              cout << " occupancy: "
                   << lower_level->get_occupancy(3, PQ.entry[index].address)
                   << " SIZE: "
                   << lower_level->get_size(3, PQ.entry[index].address) << endl;
          });

          // first check if the lower level PQ is full or not
          // this is possible since multiple prefetchers can exist at each level
          // of caches
          if (lower_level) {
            if (cache_type == IS_LLC) {
              if (lower_level->get_occupancy(1, PQ.entry[index].address) ==
                  lower_level->get_size(1, PQ.entry[index].address))
                miss_handled = 0;
              else {

                // run prefetcher on prefetches from higher caches
                if (PQ.entry[index].pf_origin_level < fill_level) {
                  if (cache_type == IS_LLC) {
                    cpu = prefetch_cpu;
                    PQ.entry[index].pf_metadata = llc_prefetcher_operate(
                        PQ.entry[index].address << LOG2_BLOCK_SIZE,
                        PQ.entry[index].ip, 0, PREFETCH,
                        PQ.entry[index].pf_metadata);
                    cpu = 0;
                  }
                }

                // add it to MSHRs if this prefetch miss will be filled to this
                // cache level
                if (PQ.entry[index].fill_level <= fill_level)
                  add_nonfifo_queue(
                      &MSHR, &PQ.entry[index]); //@Vishal: Updated from add_mshr

                lower_level->add_rq(&PQ.entry[index]); // add it to the DRAM RQ
              }
            } else {
              if (lower_level->get_occupancy(3, PQ.entry[index].address) ==
                  lower_level->get_size(3, PQ.entry[index].address))
                miss_handled = 0;
              else {

                // run prefetcher on prefetches from higher caches
                if (PQ.entry[index].pf_origin_level < fill_level) {
                  //if (cache_type == IS_L1D)
		  //@Rahul: PTW
                  #if defined(PTW_L1D)||defined(PTW_L1D_L2C)
                  if ((cache_type == IS_L1D) &&
                      (RQ.entry[index].instruction == 0) &&
                      (RQ.entry[index].type != LOAD_TRANSLATION) &&
                      (RQ.entry[index].type != PREFETCH_TRANSLATION) &&
                      (RQ.entry[index].type != TRANSLATION_FROM_L1D))
                  #else
                  if (cache_type == IS_L1D)
                  #endif
                    l1d_prefetcher_operate(PQ.entry[index].full_addr,
                                           PQ.entry[index].ip, 0, PREFETCH);
                  else if ((cache_type == IS_L2C) &&
                           (RQ.entry[index].type != PREFETCH_TRANSLATION) &&
                           (RQ.entry[index].instruction == 0) &&
                           (RQ.entry[index].type != LOAD_TRANSLATION) &&
                           (RQ.entry[index].type != PREFETCH_TRANSLATION) &&
                           (RQ.entry[index].type != TRANSLATION_FROM_L1D)) {
                    PQ.entry[index].pf_metadata = l2c_prefetcher_operate(
                        PQ.entry[index].address << LOG2_BLOCK_SIZE,
                        PQ.entry[index].ip, 0, PREFETCH,
                        PQ.entry[index].pf_metadata);
                  } else if (cache_type == IS_ITLB) {
                    itlb_prefetcher_operate(
                        PQ.entry[index].address << LOG2_PAGE_SIZE,
                        PQ.entry[index].ip, 0, PQ.entry[index].type,
                        PQ.entry[index].prefetch_id,
                        PQ.entry[index].instruction);
                    DP(if (warmup_complete[PQ.entry[index].cpu]) {
                      cout << "[" << NAME << "_PQ] " << __func__
                           << " prefetch_id: " << PQ.entry[index].prefetch_id
                           << "from handle prefetch"
                           << "instruction: " << PQ.entry[index].instruction
                           << endl;
                    });
                  } else if (cache_type == IS_DTLB) {
#ifdef SANITY_CHECK
                    if (PQ.entry[index].instruction) {
                      cout << "DTLB prefetch packet should not prefetch "
                              "address translation of instruction"
                           << endl;
                      assert(0);
                    }
#endif
                    dtlb_prefetcher_operate(
                        PQ.entry[index].address << LOG2_PAGE_SIZE,
                        PQ.entry[index].ip, 0, PQ.entry[index].type,
                        PQ.entry[index].prefetch_id,
                        PQ.entry[index].instruction);
                    DP(if (warmup_complete[PQ.entry[index].cpu]) {
                      cout << "[" << NAME << "_PQ] " << __func__
                           << " prefetch_id: " << PQ.entry[index].prefetch_id
                           << "from handle prefetch"
                           << "instruction: " << PQ.entry[index].instruction
                           << endl;
                    });
                  } else if (cache_type == IS_STLB) {
                    stlb_prefetcher_operate(
                        PQ.entry[index].address << LOG2_PAGE_SIZE,
                        PQ.entry[index].ip, 0, PQ.entry[index].type,
                        PQ.entry[index].prefetch_id,
                        PQ.entry[index].instruction);
                    DP(if (warmup_complete[PQ.entry[index].cpu]) {
                      cout << "[" << NAME << "_PQ] " << __func__
                           << " prefetch_id: " << PQ.entry[index].prefetch_id
                           << "from handle prefetch"
                           << " instruction : " << PQ.entry[index].instruction
                           << endl;
                    });
                  }
                }

                if (cache_type == IS_L1D || cache_type == IS_L1I) {
                  assert(PQ.entry[index].full_physical_address != 0);
                  PACKET new_packet = PQ.entry[index];
                  //@Vishal: Send physical address to lower level and track
                  //physical address in MSHR
                  new_packet.address =
                      PQ.entry[index].full_physical_address >> LOG2_BLOCK_SIZE;
                  new_packet.full_addr = PQ.entry[index].full_physical_address;

                  if (PQ.entry[index].fill_level <= fill_level)
                    add_nonfifo_queue(
                        &MSHR, &new_packet); //@Vishal: Updated from add_mshr
                  lower_level->add_pq(&new_packet);
                } else {

                  // add it to MSHRs if this prefetch miss will be filled to
                  // this cache level
                  if (PQ.entry[index].fill_level <= fill_level)
                    add_nonfifo_queue(
                        &MSHR,
                        &PQ.entry[index]); //@Vishal: Updated from add_mshr

                  lower_level->add_pq(
                      &PQ.entry[index]); // add it to the DRAM RQ
                }
              }
            }
          } else {
#ifdef INS_PAGE_TABLE_WALKER
            assert(0);
#else

            if (PQ.entry[index].fill_level <= fill_level)
              add_nonfifo_queue(&MSHR, &PQ.entry[index]);
            if (cache_type == IS_STLB) {
              // emulate page table walk
              uint64_t pa =
                  va_to_pa(PQ.entry[index].cpu, PQ.entry[index].instr_id,
                           PQ.entry[index].full_addr, PQ.entry[index].address);
              PQ.entry[index].data = pa >> LOG2_PAGE_SIZE;
              PQ.entry[index].event_cycle = current_core_cycle[cpu];
              if (PQ.entry[index].l1_pq_index != -1) {
                assert(PQ.entry[index].l1_pq_index == -1 &&
                       PQ.entry[index].l1_wq_index == -1);
                PQ.entry[index].data_pa = pa >> LOG2_PAGE_SIZE;
                if (PROCESSED.occupancy < PROCESSED.SIZE)
                  PROCESSED.add_queue(&PQ.entry[index]);
                else
                  assert(0);
              }
              return_data(&PQ.entry[index]);
            }
#endif
          }
        } else {
          if ((mshr_index == -1) &&
              (MSHR.occupancy == MSHR_SIZE)) { // not enough MSHR resource

            // TODO: should we allow prefetching with lower fill level at this
            // case?

            // cannot handle miss request until one of MSHRs is available
            miss_handled = 0;
            STALL[PQ.entry[index].type]++;
          } else if (mshr_index != -1) { // already in-flight miss

            // request coming from both DTLB and ITLB should be returned to both
            if (cache_type == IS_STLB) {
              if (PQ.entry[index].fill_level == 1 &&
                  MSHR.entry[mshr_index].fill_level == 1)
                if (PQ.entry[index].instruction !=
                    MSHR.entry[mshr_index].instruction)
                  MSHR.entry[mshr_index].send_both_tlb = 1;
            }
            // no need to update request except fill_level
            // update fill_level
            if (PQ.entry[index].fill_level <
                MSHR.entry[mshr_index].fill_level) {
              //@Vasudha:STLB Prefetch packet can have instruction variable as 1
              //or 0. Update instruction variable when upper level TLB sends
              //request.
              MSHR.entry[mshr_index].instruction = PQ.entry[index].instruction;
              MSHR.entry[mshr_index].fill_level = PQ.entry[index].fill_level;
            }

            if ((PQ.entry[index].fill_l1i) &&
                (MSHR.entry[mshr_index].fill_l1i != 1)) {
              MSHR.entry[mshr_index].fill_l1i = 1;
            }
            if ((PQ.entry[index].fill_l1d) &&
                (MSHR.entry[mshr_index].fill_l1d != 1)) {
              MSHR.entry[mshr_index].fill_l1d = 1;
            }

	    if ((MSHR.entry[mshr_index].type != PREFETCH && PQ.entry[index].type == PREFETCH) ||(MSHR.entry[mshr_index].type != PREFETCH_TRANSLATION && PQ.entry[index].type == PREFETCH_TRANSLATION) || (MSHR.entry[mshr_index].type != TRANSLATION_FROM_L1D && PQ.entry[index].type == TRANSLATION_FROM_L1D))
	            ++pf_late;

            MSHR_MERGED[PQ.entry[index].type]++;

            DP(if (warmup_complete[prefetch_cpu]) {
              cout << "[" << NAME << "] " << __func__ << " mshr merged";
              cout << " instr_id: " << PQ.entry[index].instr_id
                   << " prior_id: " << MSHR.entry[mshr_index].instr_id;
              cout << " address: " << hex << PQ.entry[index].address;
              cout << " full_addr: " << PQ.entry[index].full_addr << dec
                   << " fill_level: " << MSHR.entry[mshr_index].fill_level;
              cout << " cycle: " << MSHR.entry[mshr_index].event_cycle << endl;
            });
          } else { // WE SHOULD NOT REACH HERE
            cerr << "[" << NAME << "] MSHR errors" << endl;
            assert(0);
          }
        }

        if (miss_handled) {

          DP(if (warmup_complete[prefetch_cpu]) {
            cout << "[" << NAME << "] " << __func__ << " prefetch miss handled";
            cout << " instr_id: " << PQ.entry[index].instr_id
                 << " address: " << hex << PQ.entry[index].address;
            cout << " full_addr: " << PQ.entry[index].full_addr << dec
                 << " fill_level: " << PQ.entry[index].fill_level;
            cout << " cycle: " << PQ.entry[index].event_cycle << endl;
          });

          MISS[PQ.entry[index].type]++;
          ACCESS[PQ.entry[index].type]++;

          // remove this entry from PQ
          PQ.remove_queue(&PQ.entry[index]);
          reads_available_this_cycle--;
        }
      }
    } else {
      return;
    }

    if (reads_available_this_cycle == 0) {
      return;
    }
  }
}

void CACHE::operate() {
  handle_fill();
  handle_writeback();
  reads_available_this_cycle = MAX_READ;

  //@Vishal: VIPT
  if (cache_type == IS_L1I || cache_type == IS_L1D)
    handle_processed();
  handle_read();

  if (PQ.occupancy && (reads_available_this_cycle > 0))
    handle_prefetch();

  if (PQ.occupancy && ((current_core_cycle[cpu] -
                        PQ.entry[PQ.head].cycle_enqueued) > DEADLOCK_CYCLE)) {
    cout << "DEADLOCK, PQ entry is not serviced for " << DEADLOCK_CYCLE
         << " cycles cache_type: " << NAME
         << " prefetch_id: " << PQ.entry[PQ.head].prefetch_id << endl;
    cout << PQ.entry[PQ.head];
    assert(0);
  }
}

uint32_t CACHE::get_set(uint64_t address) {
	 if (knob_cloudsuite && (cache_type == IS_DTLB || cache_type == IS_ITLB || cache_type == IS_STLB))
                return (uint32_t) ((address >> 9) & ((1 << lg2(NUM_SET)) - 1));
        else
                return (uint32_t) (address & ((1 << lg2(NUM_SET)) - 1));
}

uint32_t CACHE::get_way(uint64_t address, uint32_t set) {
  for (uint32_t way = 0; way < NUM_WAY; way++) {
    if (block[set][way].valid && (block[set][way].tag == address))
      return way;
  }

  return NUM_WAY;
}

void CACHE::fill_cache(uint32_t set, uint32_t way, PACKET *packet) {
#ifdef SANITY_CHECK
  if (cache_type == IS_ITLB) {
    if (packet->data == 0) {
      cout << "current = " << current_core_cycle[cpu]
           << " instr_id = " << packet->instr_id << endl;
      assert(0);
    }
  }

  if (cache_type == IS_DTLB) {
    if (packet->data == 0) {
      cout << "current = " << current_core_cycle[cpu]
           << " instr_id = " << packet->instr_id << endl;
      assert(0);
    }
  }

  if (cache_type == IS_STLB) {
    if (packet->data == 0)
      assert(0);
  }

  if (cache_type == IS_PSCL5) {
    if (packet->data == 0)
      assert(0);
  }

  if (cache_type == IS_PSCL4) {
    if (packet->data == 0)
      assert(0);
  }

  if (cache_type == IS_PSCL3) {
    if (packet->data == 0)
      assert(0);
  }

  if (cache_type == IS_PSCL2) {
    if (packet->data == 0)
      assert(0);
  }
#endif
  if (block[set][way].prefetch && (block[set][way].used == 0))
    pf_useless++;

  if (block[set][way].valid == 0)
    block[set][way].valid = 1;
  block[set][way].dirty = 0;
  block[set][way].prefetch =
      (packet->type == PREFETCH || packet->type == PREFETCH_TRANSLATION ||
       packet->type == TRANSLATION_FROM_L1D)
          ? 1
          : 0;
  block[set][way].used = 0;

  if (block[set][way].prefetch) {
    pf_fill++;
  }

  //@Rahul calculating dead blocks
  block[set][way].type = packet->type;

#ifdef KEEP_TRIP_COUNT
  block[set][way].trip_count = 0;
#endif

  block[set][way].delta = packet->delta;
  block[set][way].depth = packet->depth;
  block[set][way].signature = packet->signature;
  block[set][way].confidence = packet->confidence;

  block[set][way].tag =
      packet->address; //@Vishal: packet->address will be physical address for
                       //L1I, as it is only filled on a miss.
  block[set][way].address = packet->address;
  block[set][way].full_addr = packet->full_addr;
  block[set][way].data = packet->data;
  block[set][way].cpu = packet->cpu;
  block[set][way].instr_id = packet->instr_id;

  DP(if (warmup_complete[packet->cpu]) {
    cout << "[" << NAME << "] " << __func__ << " set: " << set
         << " way: " << way;
    cout << " lru: " << block[set][way].lru << " tag: " << hex
         << block[set][way].tag << " full_addr: " << block[set][way].full_addr;
    cout << " data: " << block[set][way].data << dec << endl;
  });
}

int CACHE::check_hit(PACKET *packet) {
  uint32_t set = get_set(packet->address);
  int match_way = -1;

  if (NUM_SET < set) {
    cerr << "[" << NAME << "_ERROR] " << __func__
         << " invalid set index: " << set << " NUM_SET: " << NUM_SET;
    cerr << " address: " << hex << packet->address
         << " full_addr: " << packet->full_addr << dec;
    cerr << " event: " << packet->event_cycle << endl;
    assert(0);
  }

  uint64_t packet_tag;
  if (cache_type == IS_L1I || cache_type == IS_L1D) //@Vishal: VIPT
  {
    assert(packet->full_physical_address != 0);
    packet_tag = packet->full_physical_address >> LOG2_BLOCK_SIZE;
  } else
    packet_tag = packet->address;

  // hit
  for (uint32_t way = 0; way < NUM_WAY; way++) {
    if (block[set][way].valid && (block[set][way].tag == packet_tag)) {

      match_way = way;

      DP(if (warmup_complete[packet->cpu]) {
        cout << "[" << NAME << "] " << __func__
             << " instr_id: " << packet->instr_id << " type: " << +packet->type
             << hex << " addr: " << packet->address;
        cout << " full_addr: " << packet->full_addr
             << " tag: " << block[set][way].tag
             << " data: " << block[set][way].data << dec;
        cout << " set: " << set << " way: " << way
             << " lru: " << block[set][way].lru;
        cout << " event: " << packet->event_cycle
             << " cycle: " << current_core_cycle[cpu] << endl;
      });

      break;
    }
  }

  return match_way;
}

int CACHE::invalidate_entry(uint64_t inval_addr) {
  uint32_t set = get_set(inval_addr);
  int match_way = -1;

  if (NUM_SET < set) {
    cerr << "[" << NAME << "_ERROR] " << __func__
         << " invalid set index: " << set << " NUM_SET: " << NUM_SET;
    cerr << " inval_addr: " << hex << inval_addr << dec << endl;
    assert(0);
  }

  // invalidate
  for (uint32_t way = 0; way < NUM_WAY; way++) {
    if (block[set][way].valid && (block[set][way].tag == inval_addr)) {

      block[set][way].valid = 0;

      match_way = way;

      DP(if (warmup_complete[cpu]) {
        cout << "[" << NAME << "] " << __func__ << " inval_addr: " << hex
             << inval_addr;
        cout << " tag: " << block[set][way].tag
             << " data: " << block[set][way].data << dec;
        cout << " set: " << set << " way: " << way
             << " lru: " << block[set][way].lru
             << " cycle: " << current_core_cycle[cpu] << endl;
      });

      break;
    }
  }

  return match_way;
}

void CACHE::flush_TLB() {
  for (uint32_t set = 0; set < NUM_SET; set++) {
    for (uint32_t way = 0; way < NUM_WAY; way++) {
      block[set][way].valid = 0;
    }
  }
}

int CACHE::add_rq(PACKET *packet) {

  // check for the latest wirtebacks in the write queue
  // @Vishal: WQ is non-fifo for L1 cache

  int wq_index;
  if (cache_type == IS_L1D || cache_type == IS_L1I)
    wq_index = check_nonfifo_queue(&WQ, packet, false);
  else
    wq_index = WQ.check_queue(packet);

  if (wq_index != -1) {

    if (WQ.entry[wq_index].cpu != packet->cpu) {
      cout << "Read request from CPU " << packet->cpu
           << " merging with Write request from CPU " << WQ.entry[wq_index].cpu
           << endl;
      assert(0);
    }

    // Neelu: 1 cycle WQ forwarding latency added.
    if (packet->event_cycle < current_core_cycle[packet->cpu])
      packet->event_cycle = current_core_cycle[packet->cpu] + 1;
    else
      packet->event_cycle += 1;

    // check fill level
    if (packet->fill_level < fill_level) {

      packet->data = WQ.entry[wq_index].data;

      if (fill_level == FILL_L2) {
        if (packet->fill_l1i) {
          upper_level_icache[packet->cpu]->return_data(packet);
        }
        if (packet->fill_l1d) {
          upper_level_dcache[packet->cpu]->return_data(packet);
        }
      } else {

        if (packet->instruction)
          upper_level_icache[packet->cpu]->return_data(packet);
        else // data
          upper_level_dcache[packet->cpu]->return_data(packet);
      }
    }

#ifdef SANITY_CHECK
    if (cache_type == IS_ITLB)
      assert(0);
    else if (cache_type == IS_DTLB)
      assert(0);
    else if (cache_type == IS_STLB)
      assert(0);
    else if (cache_type == IS_L1I)
      assert(0);
#endif
    // update processed packets
    //if ((cache_type == IS_L1D) && (packet->type != PREFETCH))

    // @Rahul: PTW
    #if defined(PTW_L1D)||defined(PTW_L1D_L2C)
    if ((cache_type == IS_L1D) && (packet->type != PREFETCH) && (packet->type != LOAD_TRANSLATION))
    #else
    if ((cache_type == IS_L1D) && (packet->type != PREFETCH))
    #endif
    {
      if (PROCESSED.occupancy < PROCESSED.SIZE)
        PROCESSED.add_queue(packet);

      DP(if (warmup_complete[packet->cpu]) {
        cout << "[" << NAME << "_RQ] " << __func__
             << " instr_id: " << packet->instr_id << " found recent writebacks";
        cout << hex << " read: " << packet->address
             << " writeback: " << WQ.entry[wq_index].address << dec;
        cout << " index: " << MAX_READ << " rob_signal: " << packet->rob_signal
             << endl;
      });
    }

    HIT[packet->type]++;
    ACCESS[packet->type]++;

    WQ.FORWARD++;
    RQ.ACCESS++;

    return -1;
  }

  // check for duplicates in the read queue
  // @Vishal: RQ is non-fifo for L1 cache

  int index;
  if (cache_type == IS_L1D || cache_type == IS_L1I)
    index = check_nonfifo_queue(&RQ, packet, false);
  else
    index = RQ.check_queue(packet);

#ifdef IDEAL_CACHE_FOR_TRANSLATION_ACCESS
 #ifdef IDEAL_L1D
  if(cache_type == IS_L1D && (packet->type == LOAD_TRANSLATION ||
     packet->type == PREFETCH_TRANSLATION ||
     packet->type == TRANSLATION_FROM_L1D) && index != -1)
 #endif

 #ifdef IDEAL_L2
  if(cache_type == IS_L2C && (packet->type == LOAD_TRANSLATION ||
     packet->type == PREFETCH_TRANSLATION ||
     packet->type == TRANSLATION_FROM_L1D) && index != -1)
 #endif

 #ifdef IDEAL_L3
  if(cache_type == IS_LLC && (packet->type == LOAD_TRANSLATION ||
     packet->type == PREFETCH_TRANSLATION ||
     packet->type == TRANSLATION_FROM_L1D) && index != -1)
 #endif
  {
    index = -1;
  }
#endif

  if (index != -1) {

    if (RQ.entry[index].cpu != packet->cpu) {
      cout << "Read request from CPU " << packet->cpu
           << " merging with Read request from CPU " << RQ.entry[index].cpu
           << endl;
      assert(0);
    }

    if (cache_type == IS_STLB) {
      /* Fill level of incoming request and prefetch packet should be same else
       * STLB prefetch request(with instruction=1) might get          merged
       * with DTLB/ITLB, making send_both_tlb=1 due to a msimatch in instruction
       * variable. If this happens, data will be returned to           both ITLB
       * and DTLB, incurring MSHR miss*/
      if (RQ.entry[index].fill_level == 1 && packet->fill_level == 1) {
        if ((RQ.entry[index].instruction != packet->instruction) &&
            RQ.entry[index].send_both_tlb == 0) {
          RQ.entry[index].send_both_tlb = 1;
        }
      }
    }

    if (cache_type == IS_L2C) {
      if (RQ.entry[index].fill_level == 1 && packet->fill_level == 1) {
        if ((RQ.entry[index].instruction != packet->instruction) &&
            RQ.entry[index].send_both_cache == 0)
          RQ.entry[index].send_both_cache = 1;
      }
    }
    if (packet->fill_level < RQ.entry[index].fill_level) {
      RQ.entry[index].fill_level = packet->fill_level;
    }

    if (packet->instruction) {
      uint32_t rob_index = packet->rob_index;
      RQ.entry[index].rob_index_depend_on_me.insert(rob_index);
      RQ.entry[index].instr_merged = 1;
      RQ.entry[index].instruction = 1; // add as instruction type

      DP(if (warmup_complete[packet->cpu]) {
        cout << "[" << NAME << "_INSTR_MERGED] " << __func__
             << " cpu: " << packet->cpu
             << " instr_id: " << RQ.entry[index].instr_id;
        cout << " merged rob_index: " << rob_index
             << " instr_id: " << packet->instr_id << endl;
      });

      if (cache_type == IS_DTLB) {
        RQ.entry[index].read_translation_merged = true;
        assert(packet->l1_rq_index != -1);
        RQ.entry[index].l1_rq_index_depend_on_me.insert(packet->l1_rq_index);
      }

      // Neelu: packet can be PQ packet as well for ITLB and STLB as L1I
      // prefetching can be enabled.
      if (cache_type == IS_ITLB || cache_type == IS_STLB) {
        if (packet->l1_rq_index != -1) {
          RQ.entry[index].read_translation_merged = true;
          RQ.entry[index].l1_rq_index_depend_on_me.insert(packet->l1_rq_index);

        } else if (packet->l1_pq_index != -1) {
          RQ.entry[index].prefetch_translation_merged = true;
          RQ.entry[index].l1_pq_index_depend_on_me.insert(packet->l1_pq_index);
        }

        if (packet->type == LOAD_TRANSLATION &&
            RQ.entry[index].type == TRANSLATION_FROM_L1D) {
          assert(cache_type == IS_ITLB);
          RQ.entry[index].type = LOAD_TRANSLATION;
        }
      }
    } else {

      // mark merged consumer
      if (cache_type == IS_ITLB || cache_type == IS_DTLB ||
          cache_type == IS_STLB) {
        if (packet->l1_wq_index != -1) {
          RQ.entry[index].write_translation_merged = true;
          RQ.entry[index].l1_wq_index_depend_on_me.insert(packet->l1_wq_index);
        } else if (packet->l1_rq_index != -1) {
          RQ.entry[index].read_translation_merged = true;
          RQ.entry[index].l1_rq_index_depend_on_me.insert(packet->l1_rq_index);

        } else if (packet->l1_pq_index != -1) {
          assert(cache_type == IS_STLB);
          RQ.entry[index].prefetch_translation_merged = true;
          RQ.entry[index].l1_pq_index_depend_on_me.insert(packet->l1_pq_index);
        }

        if (packet->type == LOAD_TRANSLATION &&
            RQ.entry[index].type == TRANSLATION_FROM_L1D) {
          assert(cache_type == IS_STLB);
          RQ.entry[index].type = LOAD_TRANSLATION;
        }
      } else {
        if (packet->type == RFO) {
          uint32_t sq_index = packet->sq_index;
          RQ.entry[index].sq_index_depend_on_me.insert(sq_index);
          RQ.entry[index].store_merged = 1;
        } else {
          uint32_t lq_index = packet->lq_index;
          RQ.entry[index].lq_index_depend_on_me.insert(lq_index);
          RQ.entry[index].load_merged = 1;
        }
        RQ.entry[index].is_data = 1; // add as data type
      }

      if ((packet->fill_l1i) && (RQ.entry[index].fill_l1i != 1))

      {

        RQ.entry[index].fill_l1i = 1;
      }
      if ((packet->fill_l1d) && (RQ.entry[index].fill_l1d != 1)) {
        RQ.entry[index].fill_l1d = 1;
      }

      DP(if (warmup_complete[packet->cpu]) {
        cout << "[" << NAME << "_DATA_MERGED] " << __func__
             << " cpu: " << packet->cpu
             << " instr_id: " << RQ.entry[index].instr_id;
        cout << " Fill level: " << RQ.entry[index].fill_level;
        if (RQ.entry[index].read_translation_merged)
          cout << " read_translation_merged ";
        if (RQ.entry[index].write_translation_merged)
          cout << " write_translation_merged ";
        if (RQ.entry[index].prefetch_translation_merged)
          cout << " prefetch_translation_merged ";

        cout << " merged rob_index: " << packet->rob_index
             << " instr_id: " << packet->instr_id
             << " lq_index: " << packet->lq_index << endl;
      });
    }

    RQ.MERGED++;
    RQ.ACCESS++;

    return index; // merged index
  }
  // check occupancy
  if (RQ.occupancy == RQ_SIZE) {
    RQ.FULL++;

    return -2; // cannot handle this request
  }

  /*Requests from L1D and L1I will be sent for translation to the corresponding
   * TLB as well as added to the cache's read/write/prefetch queue as these are
   * VIPT caches.*/

  bool translation_sent = false;
  int get_translation_index = -1;
  int get_translation_queue = IS_RQ;
  // if there is no duplicate, add it to RQ
  index = RQ.tail;

  //@Vishal: Since L1 RQ is non fifo, find empty index
  if (cache_type == IS_L1I || cache_type == IS_L1D) {
    for (uint i = 0; i < RQ.SIZE; i++)
      if (RQ.entry[i].address == 0) {
        index = i;
        break;
      }
  }

  //@Vishal: Check if pending translation sent to TLB
  if (cache_type == IS_L1I || cache_type == IS_L1D) {

    if (cache_type ==
        IS_L1I) // TODO: Check if extra interface can be used here?
    {
      if (ooo_cpu[packet->cpu].ITLB.RQ.occupancy ==
          ooo_cpu[packet->cpu].ITLB.RQ.SIZE) {
        ooo_cpu[packet->cpu].ITLB.RQ.FULL++;
        return -2; // cannot handle this request because translation cannot be
                   // sent to TLB
      }

      PACKET translation_packet = *packet;
      translation_packet.instruction = 1;
      translation_packet.fill_level = FILL_L1;
      translation_packet.l1_rq_index = index;
      translation_packet.type = LOAD_TRANSLATION;

      if (knob_cloudsuite)
        translation_packet.address =
            ((packet->ip >> LOG2_PAGE_SIZE) << 9) | (256 + packet->asid[0]);
      else
        translation_packet.address = packet->ip >> LOG2_PAGE_SIZE;

      ooo_cpu[packet->cpu].ITLB.add_rq(&translation_packet);
    } else {

      // @Rahul: PTW
      #if defined(PTW_L1D)||defined(PTW_L1D_L2C)
      if(packet->type != LOAD_TRANSLATION && packet->type != PREFETCH_TRANSLATION && packet->type != TRANSLATION_FROM_L1D){
      #endif

      if (ooo_cpu[packet->cpu].DTLB.RQ.occupancy ==
          ooo_cpu[packet->cpu].DTLB.RQ.SIZE) {
        ooo_cpu[packet->cpu].DTLB.RQ.FULL++;
        return -2; // cannot handle this request because translation cannot be
                   // sent to TLB
      }

      PACKET translation_packet = *packet;
      translation_packet.instruction = 0;
      translation_packet.fill_level = FILL_L1;
      translation_packet.l1_rq_index = index;
      translation_packet.type = LOAD_TRANSLATION;
      if (knob_cloudsuite)
        translation_packet.address =
            ((packet->full_addr >> LOG2_PAGE_SIZE) << 9) | packet->asid[1];
      else
        translation_packet.address = packet->full_addr >> LOG2_PAGE_SIZE;

      ooo_cpu[packet->cpu].DTLB.add_rq(&translation_packet);

      //@Rahul: PTW
      #if defined(PTW_L1D)||defined(PTW_L1D_L2C)
      }
      #endif

      }
  }

#ifdef SANITY_CHECK
  if (RQ.entry[index].address != 0) {
    cerr << "[" << NAME << "_ERROR] " << __func__
         << " is not empty index: " << index;
    cerr << " address: " << hex << RQ.entry[index].address;
    cerr << " full_addr: " << RQ.entry[index].full_addr << dec << endl;
    assert(0);
  }
#endif

  RQ.entry[index] = *packet;

  // ADD LATENCY
  if (RQ.entry[index].event_cycle < current_core_cycle[packet->cpu])
    RQ.entry[index].event_cycle = current_core_cycle[packet->cpu] + LATENCY;
  else
    RQ.entry[index].event_cycle += LATENCY;

  //@Rahul: PTW
  #if defined(PTW_L1D)||defined(PTW_L1D_L2C)
  if(cache_type == IS_L1I || (cache_type == IS_L1D && (packet->type != LOAD_TRANSLATION && packet->type != PREFETCH_TRANSLATION && packet->type != TRANSLATION_FROM_L1D))) {
    RQ.entry[index].translated = INFLIGHT;
  }
  #else
  if (cache_type == IS_L1I || cache_type == IS_L1D) {
    RQ.entry[index].translated = INFLIGHT;
  }
  #endif

 /* if (cache_type == IS_L1I || cache_type == IS_L1D) {
    RQ.entry[index].translated = INFLIGHT;
  }*/

  RQ.occupancy++;
  RQ.tail++;
  if (RQ.tail >= RQ.SIZE)
    RQ.tail = 0;

  DP(if (warmup_complete[RQ.entry[index].cpu]) {
    cout << "[" << NAME << "_RQ] " << __func__
         << " instr_id: " << RQ.entry[index].instr_id << " address: " << hex
         << RQ.entry[index].address;
    cout << " full_addr: " << RQ.entry[index].full_addr << dec;
    cout << " type: " << +RQ.entry[index].type << " head: " << RQ.head
         << " tail: " << RQ.tail << " occupancy: " << RQ.occupancy;
    cout << " event: " << RQ.entry[index].event_cycle
         << " current: " << current_core_cycle[RQ.entry[index].cpu] << endl;
  });

  if (packet->address == 0)
    assert(0);

  RQ.TO_CACHE++;
  RQ.ACCESS++;

#ifdef CALC_REUSE_DIST
  if (cache_type == IS_L1D && (packet->type == LOAD || packet->type == LOAD_TRANSLATION)) {
    access_history.push_back(packet->address);

    if (warmup_complete[RQ.entry[index].cpu] && packet->type == LOAD_TRANSLATION && packet->translation_level == 2){
      translation_access_count++;

      if (last_access.find(packet->address) != last_access.end()){
	reuse_translation_access_count++;

	uint64_t last_access_index = last_access[packet->address];
        unordered_set<uint64_t> unique_accesses(access_history.begin()+last_access_index, access_history.end());

        reuse_dist[unique_accesses.size()]++;

      }
      last_access[packet->address] = access_index;
    }
    access_index++;
  }
#endif

  return -1;
}

int CACHE::add_wq(PACKET *packet) {

  assert(
      cache_type != IS_L1I || cache_type != IS_ITLB || cache_type != IS_DTLB ||
      cache_type != IS_STLB); //@Vishal: L1I cache does not have write packets

  // check for duplicates in the write queue
  int index;
  if (cache_type == IS_L1D)
    index = check_nonfifo_queue(&WQ, packet, false);
  else
    index = WQ.check_queue(packet);

  if (index != -1) {

    if (WQ.entry[index].cpu != packet->cpu) {
      cout << "Write request from CPU " << packet->cpu
           << " merging with Write request from CPU " << WQ.entry[index].cpu
           << endl;
      assert(0);
    }

    WQ.MERGED++;
    WQ.ACCESS++;

    return index; // merged index
  }

  // sanity check
  if (WQ.occupancy >= WQ.SIZE)
    assert(0);

  /*Requests from L1D and L1I will be sent for translation to the corresponding
   * TLB as well as added to the cache's read/write/prefetch queue as these are
   * VIPT caches.*/

  bool translation_sent = false;
  int get_translation_index = -1;
  int get_translation_queue = IS_RQ;

  // if there is no duplicate, add it to the write queue
  index = WQ.tail;

  //@Vishal: Since L1 WQ is non fifo, find empty index
  if (cache_type == IS_L1D) {
    for (uint i = 0; i < WQ.SIZE; i++)
      if (WQ.entry[i].address == 0) {
        index = i;
        break;
      }
  }

  //@Vishal: Check if pending translation sent to TLB
  if (cache_type == IS_L1D) {

    if (ooo_cpu[packet->cpu].DTLB.RQ.occupancy ==
        ooo_cpu[packet->cpu].DTLB.RQ.SIZE) {
      ooo_cpu[packet->cpu].DTLB.RQ.FULL++;
      return -2; // cannot handle this request because translation cannotbe sent
                 // to TLB
    }
    PACKET translation_packet = *packet;
    translation_packet.instruction = 0;
    translation_packet.l1_wq_index = index;
    translation_packet.fill_level = FILL_L1;
    translation_packet.type = LOAD_TRANSLATION;
    if (knob_cloudsuite)
      translation_packet.address =
          ((packet->full_addr >> LOG2_PAGE_SIZE) << 9) | packet->asid[1];
    else
      translation_packet.address = packet->full_addr >> LOG2_PAGE_SIZE;

    ooo_cpu[packet->cpu].DTLB.add_rq(&translation_packet);
  }

  if (WQ.entry[index].address != 0) {
    cerr << "[" << NAME << "_ERROR] " << __func__
         << " is not empty index: " << index;
    cerr << " address: " << hex << WQ.entry[index].address;
    cerr << " full_addr: " << WQ.entry[index].full_addr << dec << endl;
    assert(0);
  }

  WQ.entry[index] = *packet;

  // ADD LATENCY
  if (WQ.entry[index].event_cycle < current_core_cycle[packet->cpu])
    WQ.entry[index].event_cycle = current_core_cycle[packet->cpu] + LATENCY;
  else
    WQ.entry[index].event_cycle += LATENCY;

  if (cache_type == IS_L1D)
    WQ.entry[index].translated = INFLIGHT;

  WQ.occupancy++;
  WQ.tail++;
  if (WQ.tail >= WQ.SIZE)
    WQ.tail = 0;

  DP(if (warmup_complete[WQ.entry[index].cpu]) {
    cout << "[" << NAME << "_WQ] " << __func__
         << " instr_id: " << WQ.entry[index].instr_id << " address: " << hex
         << WQ.entry[index].address;
    cout << " full_addr: " << WQ.entry[index].full_addr << dec;
    cout << " head: " << WQ.head << " tail: " << WQ.tail
         << " occupancy: " << WQ.occupancy;
    cout << " data: " << hex << WQ.entry[index].data << dec;
    cout << " event: " << WQ.entry[index].event_cycle
         << " current: " << current_core_cycle[WQ.entry[index].cpu] << endl;
  });

  WQ.TO_CACHE++;
  WQ.ACCESS++;

  return -1;
}

int CACHE::prefetch_line(uint64_t ip, uint64_t base_addr, uint64_t pf_addr,
                         int pf_fill_level, uint32_t prefetch_metadata) {
  pf_requested++;
  DP(if (warmup_complete[cpu]) {
    cout << "entered prefetch_line, occupancy = " << PQ.occupancy
         << "SIZE=" << PQ.SIZE << endl;
  });
  if (PQ.occupancy < PQ.SIZE) {

    DP(if (warmup_complete[cpu]) { cout << "packet entered in PQ" << endl; });
    PACKET pf_packet;
    pf_packet.fill_level = pf_fill_level;
    pf_packet.pf_origin_level = fill_level;
    if (pf_fill_level == FILL_L1) {
      pf_packet.fill_l1d = 1;
    }

    pf_packet.pf_metadata = prefetch_metadata;
    pf_packet.cpu = cpu;
    pf_packet.address = pf_addr >> LOG2_BLOCK_SIZE;
    pf_packet.full_addr = pf_addr;
    pf_packet.full_virtual_address = pf_addr;

    pf_packet.ip = ip;
    pf_packet.prefetch_id = 0;
    pf_packet.type = PREFETCH;
    pf_packet.event_cycle = current_core_cycle[cpu];

    // give a dummy 0 as the IP of a prefetch
    add_pq(&pf_packet);
    DP(if (warmup_complete[pf_packet.cpu]) {
      cout << "returned from add_pq" << endl;
    });
    pf_issued++;

    return 1;
  }

  return 0;
}

int CACHE::prefetch_translation(uint64_t ip, uint64_t pf_addr,
                                int pf_fill_level, uint32_t prefetch_metadata,
                                uint64_t prefetch_id, uint8_t instruction) {
  pf_requested++;
  DP(if (warmup_complete[cpu]) {
    cout << "entered prefetch_translation, occupancy = " << PQ.occupancy
         << "SIZE=" << PQ.SIZE << endl;
  });
  if (PQ.occupancy < PQ.SIZE) {
    DP(if (warmup_complete[cpu]) { cout << "packet entered in PQ" << endl; });
    PACKET pf_packet;
    pf_packet.fill_level = pf_fill_level;
    pf_packet.pf_origin_level = fill_level;
    pf_packet.pf_metadata = prefetch_metadata;
    pf_packet.cpu = cpu;
    pf_packet.instruction = instruction;
    pf_packet.address = pf_addr >> LOG2_PAGE_SIZE;
    pf_packet.full_addr = pf_addr;
    pf_packet.full_virtual_address = pf_addr;
    pf_packet.ip = ip;
    pf_packet.prefetch_id = prefetch_id;
    pf_packet.type = PREFETCH_TRANSLATION;
    pf_packet.event_cycle = current_core_cycle[cpu];

    // give a dummy 0 as the IP of a prefetch
    add_pq(&pf_packet);
    DP(if (warmup_complete[pf_packet.cpu]) {
      cout << "returned from add_pq" << endl;
    });
    pf_issued++;

    return 1;
  }

  return 0;
}

int CACHE::add_pq(PACKET *packet) {

  assert(packet->type == PREFETCH || packet->type == PREFETCH_TRANSLATION);

  // check for the latest wirtebacks in the write queue
  // @Vishal: WQ is non-fifo for L1 cache

  int wq_index;
  if (cache_type == IS_L1D || cache_type == IS_L1I)
    wq_index = check_nonfifo_queue(&WQ, packet, false);
  else
    wq_index = WQ.check_queue(packet);

  if (wq_index != -1) {

    if (WQ.entry[wq_index].cpu != packet->cpu) {
      cout << "Prefetch request from CPU " << packet->cpu
           << " merging with Write request from CPU " << WQ.entry[wq_index].cpu
           << endl;
      assert(0);
    }

    // Neelu: Adding 1 cycle WQ forwarding latency
    if (packet->event_cycle < current_core_cycle[packet->cpu])
      packet->event_cycle = current_core_cycle[packet->cpu] + 1;
    else
      packet->event_cycle += 1;

      // Neelu: Todo: Is this sanity check sane? Removed check for L1-I
#ifdef SANITY_CHECK

    if (cache_type == IS_ITLB || cache_type == IS_DTLB || cache_type == IS_STLB)
      assert(0);

#endif

    // check fill level
    if (packet->fill_level < fill_level) {

      packet->data = WQ.entry[wq_index].data;

      if (fill_level == FILL_L2) {
        if (packet->fill_l1i) {
          upper_level_icache[packet->cpu]->return_data(packet);
        }
        if (packet->fill_l1d) {
          upper_level_dcache[packet->cpu]->return_data(packet);
        }
      } else {

        if (packet->instruction)
          upper_level_icache[packet->cpu]->return_data(packet);
        else // data
          upper_level_dcache[packet->cpu]->return_data(packet);
      }
    }

    HIT[packet->type]++;
    ACCESS[packet->type]++;

    WQ.FORWARD++;
    PQ.ACCESS++;

    return -1;
  }

  // check for duplicates in the PQ
  int index = PQ.check_queue(packet);
  if (index != -1) {
    if (PQ.entry[index].cpu != packet->cpu) {
      cout << "Prefetch request from CPU " << packet->cpu
           << " merging with Prefetch request from CPU " << PQ.entry[index].cpu
           << endl;
      assert(0);
    }

    //@v send_both_tlb should be updated in STLB PQ if the entry needs to be
    //serviced to both ITLB and DTLB
    if (cache_type == IS_STLB) {
      /* Fill level of incoming request and prefetch packet should be same else
       * STLB prefetch request(with instruction=1) might get
       * merged with DTLB/ITLB, making send_both_tlb=1 due to a msimatch in
       * instruction variable. If this happens, data will be returned to
       * both ITLB and DTLB, incurring MSHR miss*/

      if (PQ.entry[index].fill_level == 1 && packet->fill_level == 1) {
        if ((PQ.entry[index].instruction != packet->instruction) &&
            PQ.entry[index].send_both_tlb == 0) {
          PQ.entry[index].send_both_tlb = 1;
        }
      }
    }

    if (packet->fill_level < PQ.entry[index].fill_level) {
      PQ.entry[index].fill_level = packet->fill_level;
      PQ.entry[index].instruction = packet->instruction;
    }

    if ((packet->is_data == 1) && (PQ.entry[index].is_data != 1)) {
      PQ.entry[index].is_data = 1;
    }
    if ((packet->fill_l1i) && (PQ.entry[index].fill_l1i != 1)) {
      PQ.entry[index].fill_l1i = 1;
    }
    if ((packet->fill_l1d) && (PQ.entry[index].fill_l1d != 1)) {
      PQ.entry[index].fill_l1d = 1;
    }

    PQ.MERGED++;
    PQ.ACCESS++;

    return index; // merged index
  }

  // check occupancy
  if (PQ.occupancy == PQ_SIZE) {
    PQ.FULL++;

    DP(if (warmup_complete[packet->cpu]) {
      cout << "[" << NAME << "] cannot process add_pq since it is full" << endl;
    });
    return -2; // cannot handle this request
  }

  // if there is no duplicate, add it to PQ
  index = PQ.tail;

#ifdef SANITY_CHECK
  if (PQ.entry[index].address != 0) {
    cerr << "[" << NAME << "_ERROR] " << __func__
         << " is not empty index: " << index;
    cerr << " address: " << hex << PQ.entry[index].address;
    cerr << " full_addr: " << PQ.entry[index].full_addr << dec << endl;
    assert(0);
  }
#endif

  /*Requests from L1D and L1I will be sent for translation to the corresponding
   * TLB as well as added to the cache's read/write/prefetch queue as these are
   * VIPT caches.*/

  bool translation_sent = false;
  int get_translation_index = -1;
  int get_translation_queue = IS_RQ;

  //@Vishal: Check if pending translation sent to TLB if its need to be
  //translated
  if (cache_type == IS_L1D && packet->full_physical_address == 0) {
    if (ooo_cpu[packet->cpu].STLB.RQ.occupancy ==
        ooo_cpu[packet->cpu].STLB.RQ.SIZE) {
      ooo_cpu[packet->cpu].STLB.RQ.FULL++;
      return -2; // cannot handle this request because translation cannot be
                 // sent to TLB
    }

    PACKET translation_packet = *packet;
    translation_packet.l1_pq_index = index;
    translation_packet.fill_level = FILL_L2;
    translation_packet.type = TRANSLATION_FROM_L1D;
    pf_requested++;
    if (knob_cloudsuite)
      translation_packet.address =
          ((packet->full_addr >> LOG2_PAGE_SIZE) << 9) |
          packet->asid[1]; //@Vishal: TODO Check this address, will be wrong
                           //when L1I prefetcher is used
    else
      translation_packet.address = packet->full_addr >> LOG2_PAGE_SIZE;

    //@Vishal: Add translation packet from PQ to L2 cache.
    ooo_cpu[packet->cpu].STLB.add_rq(&translation_packet);
    pf_issued++;
  }

  // Neelu: Adding translation request to ITLB for instruction prefetch
  // requests.
  if (cache_type == IS_L1I && packet->full_physical_address == 0) {
    if (ooo_cpu[packet->cpu].ITLB.RQ.occupancy ==
        ooo_cpu[packet->cpu].ITLB.RQ.SIZE) {
      ooo_cpu[packet->cpu].ITLB.RQ.FULL++;
      return -2; // cannot handle this request as ITLB read queue is full.
    }

    // ITLB RQ occupancy is not full.
    PACKET translation_packet = *packet;
    translation_packet.l1_pq_index = index;
    translation_packet.fill_level = FILL_L1;
    translation_packet.instruction = 1;
    translation_packet.type = TRANSLATION_FROM_L1D;
    // Neelu: As pf_v_addr is assigned to ip as well as full_addr in
    // prefetch_code_line function, either will work for assigning address.
    if (knob_cloudsuite)
      translation_packet.address =
          ((packet->ip >> LOG2_PAGE_SIZE) << 9) | (256 + packet->asid[0]);
    else
      translation_packet.address = packet->ip >> LOG2_PAGE_SIZE;

    // Neelu: Assigning full virtual address to the packet.
    // Todo: Not sure of the implications to cloudsuite.
    translation_packet.full_virtual_address = packet->ip;

    ooo_cpu[packet->cpu].ITLB.add_rq(&translation_packet);
  }

  PQ.entry[index] = *packet;
  PQ.entry[index].cycle_enqueued = current_core_cycle[cpu];

  //@Vasudha - if any TLB calls add_pq
  if (knob_cloudsuite && (cache_type == IS_ITLB || cache_type == IS_DTLB ||
                          cache_type == IS_STLB)) {
    if (PQ.entry[index].instruction == 1)
      PQ.entry[index].address =
          ((packet->ip >> LOG2_PAGE_SIZE) << 9) | (256 + packet->asid[0]);
    else
      PQ.entry[index].address =
          ((packet->full_addr >> LOG2_PAGE_SIZE) << 9) | packet->asid[1];
  }

  // ADD LATENCY
  if (PQ.entry[index].event_cycle < current_core_cycle[packet->cpu])
    PQ.entry[index].event_cycle = current_core_cycle[packet->cpu] + LATENCY;
  else
    PQ.entry[index].event_cycle += LATENCY;

  // Neelu: Adding condition to mark translated as INFLIGHT only if it is
  // COMPLETED.
  if (cache_type == IS_L1D) {
    PQ.entry[index].translated = INFLIGHT;
  }

  // Neelu: Marking translations as inflight for L1I as well.
  if (cache_type == IS_L1I)
    PQ.entry[index].translated = INFLIGHT;

  PQ.occupancy++;
  PQ.tail++;
  if (PQ.tail >= PQ.SIZE)
    PQ.tail = 0;

  DP(if (warmup_complete[PQ.entry[index].cpu]) {
    cout << "[" << NAME << "_PQ] " << __func__
         << " prefetch_id: " << PQ.entry[index].prefetch_id
         << " address: " << hex << PQ.entry[index].address;
    cout << " full_addr: " << PQ.entry[index].full_addr << dec;
    cout << " type: " << +PQ.entry[index].type << " head: " << PQ.head
         << " tail: " << PQ.tail << " occupancy: " << PQ.occupancy;
    cout << " event: " << PQ.entry[index].event_cycle
         << " current: " << current_core_cycle[PQ.entry[index].cpu] << endl;
  });

  if (packet->address == 0)
    assert(0);

  PQ.TO_CACHE++;
  PQ.ACCESS++;

  return -1;
}

void CACHE::return_data(PACKET *packet) {
  // check MSHR information
  int mshr_index = check_nonfifo_queue(&MSHR, packet,
                                       true); //@Vishal: Updated from check_mshr

  // sanity check
  if (mshr_index == -1) {
    cerr << "[" << NAME << "_MSHR] " << __func__
         << " instr_id: " << packet->instr_id
         << " prefetch_id: " << packet->prefetch_id
         << " cannot find a matching entry!";
    cerr << " full_addr: " << hex << packet->full_addr;
    cerr << " address: " << packet->address << dec;
    cerr << " event: " << packet->event_cycle
         << " current: " << current_core_cycle[packet->cpu] << endl;
    cerr << " send_both_tlb: " << unsigned(packet->send_both_tlb) << endl;
    cerr << " instruction: " << unsigned(packet->instruction)
         << ", data: " << unsigned(packet->is_data) << endl;
    cerr << " fill_l1d: " << unsigned(packet->fill_l1d)
         << ", fill_l1i: " << unsigned(packet->fill_l1i) << endl;
    assert(0);
  }

  // MSHR holds the most updated information about this request
  // no need to do memcpy
  MSHR.num_returned++;
  MSHR.entry[mshr_index].returned = COMPLETED;
#ifdef INS_PAGE_TABLE_WALKER
  if (cache_type == IS_STLB) {
    packet->data >>= LOG2_PAGE_SIZE; //@Vishal: Remove last 12 bits from the
                                     //data coming from PTW
  }
#endif
  MSHR.entry[mshr_index].data = packet->data;

  if (cache_type == IS_ITLB || cache_type == IS_DTLB || cache_type == IS_STLB) {
    if (MSHR.entry[mshr_index].data == 0) {
      cout << "return_data writes 0 in TLB.data\n";
      assert(0);
    }
  }
  MSHR.entry[mshr_index].pf_metadata = packet->pf_metadata;

  // ADD LATENCY
  if (MSHR.entry[mshr_index].event_cycle < current_core_cycle[packet->cpu])
    MSHR.entry[mshr_index].event_cycle =
        current_core_cycle[packet->cpu] + LATENCY;
  else
    MSHR.entry[mshr_index].event_cycle += LATENCY;

  update_fill_cycle();

  DP(if (warmup_complete[packet->cpu]) {
    cout << "[" << NAME << "_MSHR] " << __func__
         << " instr_id: " << MSHR.entry[mshr_index].instr_id;
    cout << " address: " << hex << MSHR.entry[mshr_index].address
         << " full_addr: " << MSHR.entry[mshr_index].full_addr;
    cout << " data: " << MSHR.entry[mshr_index].data << dec
         << " num_returned: " << MSHR.num_returned;
    cout << " index: " << mshr_index << " occupancy: " << MSHR.occupancy;
    if (MSHR.entry[mshr_index].read_translation_merged)
      cout << " read_translation_merged ";
    else if (MSHR.entry[mshr_index].write_translation_merged)
      cout << " write_translation_merged ";
    else if (MSHR.entry[mshr_index].prefetch_translation_merged)
      cout << " prefetch_translation_merged ";

    cout << " event: " << MSHR.entry[mshr_index].event_cycle
         << " current: " << current_core_cycle[packet->cpu]
         << " next: " << MSHR.next_fill_cycle << endl;
  });
}

void CACHE::update_fill_cycle() {
  // update next_fill_cycle

  uint64_t min_cycle = UINT64_MAX;
  uint32_t min_index = MSHR.SIZE;
  for (uint32_t i = 0; i < MSHR.SIZE; i++) {
    if ((MSHR.entry[i].returned == COMPLETED) &&
        (MSHR.entry[i].event_cycle < min_cycle)) {
      min_cycle = MSHR.entry[i].event_cycle;
      min_index = i;
    }

    DP(if (warmup_complete[MSHR.entry[i].cpu]) {
      cout << "[" << NAME << "_MSHR] " << __func__
           << " checking instr_id: " << MSHR.entry[i].instr_id;
      cout << " address: " << hex << MSHR.entry[i].address
           << " full_addr: " << MSHR.entry[i].full_addr;
      cout << " data: " << MSHR.entry[i].data << dec
           << " returned: " << +MSHR.entry[i].returned
           << " fill_level: " << MSHR.entry[i].fill_level;
      cout << " index: " << i << " occupancy: " << MSHR.occupancy;
      cout << " event: " << MSHR.entry[i].event_cycle
           << " current: " << current_core_cycle[MSHR.entry[i].cpu]
           << " next: " << MSHR.next_fill_cycle << endl;
    });
  }

  MSHR.next_fill_cycle = min_cycle;
  MSHR.next_fill_index = min_index;
  if (min_index < MSHR.SIZE) {

    DP(if (warmup_complete[MSHR.entry[min_index].cpu]) {
      cout << "[" << NAME << "_MSHR] " << __func__
           << " instr_id: " << MSHR.entry[min_index].instr_id;
      cout << " address: " << hex << MSHR.entry[min_index].address
           << " full_addr: " << MSHR.entry[min_index].full_addr;
      cout << " data: " << MSHR.entry[min_index].data << dec
           << " num_returned: " << MSHR.num_returned;
      cout << " event: " << MSHR.entry[min_index].event_cycle
           << " current: " << current_core_cycle[MSHR.entry[min_index].cpu]
           << " next: " << MSHR.next_fill_cycle << endl;
    });
  }
}

//@Vishal: Made check_mshr generic; packet_direction (Required only for MSHR)
//=>true, going to lower level else coming from lower level
int CACHE::check_nonfifo_queue(PACKET_QUEUE *queue, PACKET *packet,
                               bool packet_direction) {
  uint64_t check_address = packet->address;

  //@Vishal: packet_direction will be true only for return_data function. We
  //don't need to check address translation for that.
  if (!packet_direction && (cache_type == IS_L1I || cache_type == IS_L1D) &&
      queue->NAME.compare(NAME + "_MSHR") == 0) {
    if (packet->full_physical_address == 0) {
      assert(packet->full_physical_address !=
             0); //@Vishal: If MSHR is checked, then address translation should
                 //be present
    }

    if (packet->address != (packet->full_physical_address >> LOG2_BLOCK_SIZE))
      check_address = packet->full_physical_address >>
                      LOG2_BLOCK_SIZE; //@Vishal: L1 MSHR has physical address
  }

  if (cache_type == IS_L1D && queue->NAME.compare(NAME + "_WQ") == 0) {
    // search queue
    for (uint32_t index = 0; index < queue->SIZE; index++) {
      if (queue->entry[index].full_addr == packet->full_addr) {

        DP(if (warmup_complete[packet->cpu]) {
          cout << "[" << NAME << "_" << queue->NAME << "] " << __func__
               << " same entry instr_id: " << packet->instr_id
               << " prior_id: " << queue->entry[index].instr_id;
          cout << " address: " << hex << packet->address;
          cout << " full_addr: " << packet->full_addr << dec << endl;
        });

        return index;
      }
    }

  } else {
    // search queue
    for (uint32_t index = 0; index < queue->SIZE; index++) {
      if (queue->entry[index].address == check_address) {

        DP(if (warmup_complete[packet->cpu]) {
          cout << "[" << NAME << "_" << queue->NAME << "] " << __func__
               << " same entry instr_id: " << packet->instr_id
               << " prior_id: " << queue->entry[index].instr_id;
          cout << " address: " << hex << packet->address;
          cout << " full_addr: " << packet->full_addr << dec << endl;
        });

        return index;
      }
    }
  }

  DP(if (warmup_complete[packet->cpu]) {
    cout << "[" << NAME << "_" << queue->NAME << "] " << __func__
         << " new address: " << hex << packet->address;
    cout << " full_addr: " << packet->full_addr << dec << endl;
  });

  DP(if (warmup_complete[packet->cpu] && (queue->occupancy == queue->SIZE)) {
    cout << "[" << NAME << "_" << queue->NAME << "] " << __func__
         << " mshr is full";
    cout << " instr_id: " << packet->instr_id
         << " occupancy: " << queue->occupancy;
    cout << " address: " << hex << packet->address;
    cout << " full_addr: " << packet->full_addr << dec;
    cout << " cycle: " << current_core_cycle[packet->cpu] << endl;
  });

  return -1;
}

//@Vishal: Made add_mshr generic
void CACHE::add_nonfifo_queue(PACKET_QUEUE *queue, PACKET *packet) {
  uint32_t index = 0;

  packet->cycle_enqueued = current_core_cycle[packet->cpu];

  // search queue
  for (index = 0; index < queue->SIZE; index++) {
    if (queue->entry[index].address == 0) {

      queue->entry[index] = *packet;
      queue->entry[index].returned = INFLIGHT;
      queue->occupancy++;

      DP(if (warmup_complete[packet->cpu]) {
        cout << "[" << NAME << "_" << queue->NAME << "] " << __func__
             << " instr_id: " << packet->instr_id;
        cout << " address: " << hex << packet->address
             << " full_addr: " << packet->full_addr << dec;
        if (packet->read_translation_merged)
          cout << " read_translation_merged ";
        else if (packet->write_translation_merged)
          cout << " write_translation_merged ";
        else if (packet->prefetch_translation_merged)
          cout << " prefetch_translation_merged ";
        cout << " fill_level: " << queue->entry[index].fill_level;
        cout << " index: " << index << " occupancy: " << queue->occupancy
             << endl;
      });

      break;
    }
  }
}

uint32_t CACHE::get_occupancy(uint8_t queue_type, uint64_t address) {
  if (queue_type == 0)
    return MSHR.occupancy;
  else if (queue_type == 1)
    return RQ.occupancy;
  else if (queue_type == 2)
    return WQ.occupancy;
  else if (queue_type == 3)
    return PQ.occupancy;

  return 0;
}

uint32_t CACHE::get_size(uint8_t queue_type, uint64_t address) {
  if (queue_type == 0)
    return MSHR.SIZE;
  else if (queue_type == 1)
    return RQ.SIZE;
  else if (queue_type == 2)
    return WQ.SIZE;
  else if (queue_type == 3)
    return PQ.SIZE;

  return 0;
}

void CACHE::increment_WQ_FULL(uint64_t address) { WQ.FULL++; }
