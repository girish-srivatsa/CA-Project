#ifndef CACHE_H
#define CACHE_H

#include "memory_class.h"
#include <unordered_set>
#include <map>
#include <unordered_map>
#include <vector>
#include <queue>
// Gabps -- Helper files
#include "reader.h"
typedef int32_t NodeID;
typedef int32_t WeightT;

typedef CSRGraph<NodeID> Graph;

typedef Reader<NodeID, NodeID, WeightT, true> MyReader; // defines Graph and WGraph

// PAGE
extern uint32_t PAGE_TABLE_LATENCY, SWAP_LATENCY;

#define MAX_MISS_COUNTER 0xFFFFF 
#define TRANSLATION_MISS_INC 128

// CACHE TYPE
#define IS_ITLB 0
#define IS_DTLB 1
#define IS_STLB 2
#define IS_L1I 3
#define IS_L1D 4
#define IS_L2C 5
#define IS_LLC 6
#define IS_PTW 7
#ifdef PUSH_DTLB_PB
#define IS_DTLB_PB 8
#endif
#define IS_BTB 12

// MMU CACHE TYPE
#define IS_PSCL5 8
#define IS_PSCL4 9
#define IS_PSCL3 10
#define IS_PSCL2 11

// QUEUE TYPE
#define IS_RQ 0
#define IS_WQ 1
#define IS_PQ 2

// INSTRUCTION TLB
#define ITLB_SET 16
#define ITLB_WAY 4
#define ITLB_RQ_SIZE 16
#define ITLB_WQ_SIZE 16
#define ITLB_PQ_SIZE 8
#define ITLB_MSHR_SIZE 8
#define ITLB_LATENCY 1

// DATA TLB
#define DTLB_SET 16
#define DTLB_WAY 4
#define DTLB_RQ_SIZE 16
#define DTLB_WQ_SIZE 16
#define DTLB_PQ_SIZE 8
#define DTLB_MSHR_SIZE 8
#define DTLB_LATENCY 1

//@Vasudha: Coding DTLB prefetch buffer
#ifdef PUSH_DTLB_PB
#define DTLB_PB_SET 1
#define DTLB_PB_WAY 256
#define DTLB_PB_RQ_SIZE 0
#define DTLB_PB_WQ_SIZE 0
#define DTLB_PB_PQ_SIZE 0
#define DTLB_PB_MSHR_SIZE 0
#endif

// SECOND LEVEL TLB
#define STLB_SET 128
#define STLB_WAY 12
#define STLB_RQ_SIZE 32
#define STLB_WQ_SIZE 32
#define STLB_PQ_SIZE 8
#define STLB_MSHR_SIZE 16
#define STLB_LATENCY 8

// L1 INSTRUCTION CACHE
#define L1I_SET 64
#define L1I_WAY 8
#define L1I_RQ_SIZE 64
#define L1I_WQ_SIZE 64
#define L1I_PQ_SIZE 16
#define L1I_MSHR_SIZE 8
#define L1I_LATENCY 4

// L1 DATA CACHE
#define L1D_SET 64
#define L1D_WAY 12
#define L1D_RQ_SIZE 64
#define L1D_WQ_SIZE 64
#define L1D_PQ_SIZE 16
#define L1D_MSHR_SIZE 16
#define L1D_LATENCY 5

// L2 CACHE
#define L2C_SET 1024
#define L2C_WAY 8
#define L2C_RQ_SIZE 32
#define L2C_WQ_SIZE 32
#define L2C_PQ_SIZE 16
#define L2C_MSHR_SIZE 32
#define L2C_LATENCY 10 // 5 (L1I or L1D) + 10 = 15 cycles

// LAST LEVEL CACHE
#define LLC_SET NUM_CPUS * 2048
#define LLC_WAY 16
#define LLC_RQ_SIZE NUM_CPUS *L2C_MSHR_SIZE // 48
#define LLC_WQ_SIZE NUM_CPUS *L2C_MSHR_SIZE // 48
#define LLC_PQ_SIZE NUM_CPUS * 32
#define LLC_MSHR_SIZE NUM_CPUS * 64
#define LLC_LATENCY 20 // 5 (L1I or L1D) + 10 + 20 = 35 cycles

class CACHE : public MEMORY {
public:
  int32_t regIdx;
  uint32_t cpu;
  const string NAME;
  const uint32_t NUM_SET, NUM_WAY, NUM_LINE, WQ_SIZE, RQ_SIZE, PQ_SIZE,
      MSHR_SIZE;
  uint32_t LATENCY;
  BLOCK **block;
  int fill_level;
  uint32_t MAX_READ, MAX_FILL;
  uint32_t reads_available_this_cycle;
  uint8_t cache_type;

  Graph *matrix; // Matrix for reading and next-reference
  uint32_t irreg_data_base, irreg_data_bound; // Registers
  uint32_t curr_dst_vertex; // Current access
  bool is_pull; // Kernel Identification

  // prefetch stats
  uint64_t pf_requested, pf_issued, pf_useful, pf_useless, pf_fill,
      pf_late, // Number of On-demand translation requests hit in TLB MSHR with
               // packet.type = PREFETCH.
      pf_lower_level, // Count prefetch request that enters MSHR as new miss(not
                      // merged)-used for TLBs as many prefetches issued gets
                      // merged
      pf_dropped, late_prefetch, prefetch_count;

  uint64_t pref_useful[NUM_CPUS][6], pref_filled[NUM_CPUS][6], pref_late[NUM_CPUS][6];

  // queues
  PACKET_QUEUE WQ{NAME + "_WQ", WQ_SIZE},       // write queue
      RQ{NAME + "_RQ", RQ_SIZE},                // read queue
      PQ{NAME + "_PQ", PQ_SIZE},                // prefetch queue
      MSHR{NAME + "_MSHR", MSHR_SIZE},          // MSHR
      PROCESSED{NAME + "_PROCESSED", ROB_SIZE}; // processed queue

  uint64_t sim_access[NUM_CPUS][NUM_TYPES], sim_hit[NUM_CPUS][NUM_TYPES],
      sim_miss[NUM_CPUS][NUM_TYPES], roi_access[NUM_CPUS][NUM_TYPES],
      roi_hit[NUM_CPUS][NUM_TYPES], roi_miss[NUM_CPUS][NUM_TYPES];

#ifdef DYNAMIC_POLICY
  uint64_t miss_counter, miss_counter_tr, miss_counter_ld, translation_miss_inc;
  uint32_t data_insertion, translation_insertion;
#endif

  uint64_t total_miss_latency, load_miss_latency, load_translation_miss_latency;

#ifdef IDEAL_CACHE_FOR_TRANSLATION_ACCESS 
  uint64_t merged_translations, translations_not_filled, change_miss_to_hit;
  unordered_set<uint64_t> unique_translation_access, stall_rq_index;
#endif

#ifdef PT_STATS
  uint64_t sim_pt_access[NUM_CPUS][5], sim_pt_hit[NUM_CPUS][5], sim_pt_miss[NUM_CPUS][5],
           roi_pt_access[NUM_CPUS][5], roi_pt_hit[NUM_CPUS][5], roi_pt_miss[NUM_CPUS][5];
#endif

#ifdef CALC_REUSE_DIST
  uint64_t access_index, translation_access_count, reuse_translation_access_count;
  vector<uint64_t> access_history;
  unordered_map<uint64_t, uint64_t> reuse_dist;
  unordered_map<uint64_t, uint64_t> last_access;
#endif

  //@Rahul: calculating dead blocks
#ifdef FIND_DEAD_BLOCKS
  uint64_t used_translations, unused_translations, used_load, unused_load, used_total, unused_total;
#endif

#ifdef KEEP_TRIP_COUNT
  uint64_t translations_exceeding_trip_count;
#endif

#ifdef FIND_INTERFERENCE
  uint64_t translation_evicting_translation, translation_evicting_load, load_evicting_translation, load_evicting_load, total_eviction, total_translation_evictions;
#endif

#ifdef BYPASS_TRANSLATIONS
  uint64_t translations_not_filled;
  unordered_set<uint64_t> dont_fill_translation, fill_translation;
#endif

#ifdef KEEP_TRANSLATION_COUNT
  uint64_t translation_count, access_count;
  queue<uint32_t> q;
  //map<uint64_t, uint64_t> hit_translation_count, miss_translation_count;
#endif

  uint64_t alternate_victim, no_alternate_victim;

  // constructor
  CACHE(string v1, uint32_t v2, int v3, uint32_t v4, uint32_t v5, uint32_t v6,
        uint32_t v7, uint32_t v8)
      : NAME(v1), NUM_SET(v2), NUM_WAY(v3), NUM_LINE(v4), WQ_SIZE(v5),
        RQ_SIZE(v6), PQ_SIZE(v7), MSHR_SIZE(v8) {

    LATENCY = 0;
    // Constructor for Graph Specific Values
    irreg_data_base = irreg_data_bound = curr_dst_vertex = -1;
    is_pull = false;

    // cache block
    block = new BLOCK *[NUM_SET];
    for (uint32_t i = 0; i < NUM_SET; i++) {
      block[i] = new BLOCK[NUM_WAY];

      for (uint32_t j = 0; j < NUM_WAY; j++) {
        block[i][j].lru = j;
      }
    }

    for (uint32_t i = 0; i < NUM_CPUS; i++) {
      upper_level_icache[i] = NULL;
      upper_level_dcache[i] = NULL;

      for (uint32_t j = 0; j < NUM_TYPES; j++) {
        sim_access[i][j] = 0;
        sim_hit[i][j] = 0;
        sim_miss[i][j] = 0;
        roi_access[i][j] = 0;
        roi_hit[i][j] = 0;
        roi_miss[i][j] = 0;
      }
    }

#ifdef DYNAMIC_POLICY
    miss_counter = MAX_MISS_COUNTER/2;
    miss_counter_tr = 0;
    miss_counter_ld = 0;
    data_insertion = 7;
    translation_insertion = 7;
    translation_miss_inc = 1;
#endif

    total_miss_latency = 0;
    load_miss_latency = 0;
    load_translation_miss_latency = 0;

    lower_level = NULL;
    extra_interface = NULL;
    fill_level = -1;
    MAX_READ = 1;
    MAX_FILL = 1;

    pf_requested = 0;
    pf_issued = 0;
    pf_useful = 0;
    pf_useless = 0;
    pf_fill = 0;
    pf_late = 0;
    pf_lower_level = 0;
    pf_dropped = 0;

    late_prefetch = 0;
    prefetch_count = 0;

#ifdef IDEAL_CACHE_FOR_TRANSLATION_ACCESS
    merged_translations = 0;
    change_miss_to_hit = 0;
    unique_translation_access.clear();
    stall_rq_index.clear();
#endif

#ifdef PT_STATS
    for (uint32_t i = 0; i < NUM_CPUS; i++) {
      for (uint32_t j = 0; j < 5; j++) {
        sim_pt_access[i][j] = 0;
        sim_pt_hit[i][j] = 0;
        sim_pt_miss[i][j] = 0;
        roi_pt_access[i][j] = 0;
        roi_pt_hit[i][j] = 0;
        roi_pt_miss[i][j] = 0;
      }
    }
#endif

#ifdef CALC_REUSE_DIST
    access_index = 0;
    translation_access_count = 0;
    reuse_translation_access_count = 0;
    reuse_dist.clear();
    access_history.clear();
    last_access.clear();
#endif

    //@Rahul: calculating dead blocks
#ifdef FIND_DEAD_BLOCKS
    used_translations = 0;
    unused_translations = 0;
    used_load = 0;
    unused_load = 0;
    used_total = 0;
    unused_total = 0;
#endif

#ifdef KEEP_TRIP_COUNT
  translations_exceeding_trip_count = 0;
#endif

#ifdef FIND_INTERFERENCE
  translation_evicting_translation = 0;
  translation_evicting_load = 0;
  load_evicting_translation = 0;
  load_evicting_load = 0;
  total_eviction = 0;
  total_translation_evictions = 0;
#endif

#ifdef BYPASS_TRANSLATIONS
  translations_not_filled = 0;
#endif

#ifdef KEEP_TRANSLATION_COUNT
  translation_count = 0;
  access_count = 0;
#endif




    alternate_victim = 0;
    no_alternate_victim = 0;

    initialize_replacement = &CACHE::base_initialize_replacement;
    update_replacement_state = &CACHE::base_update_replacement_state;
    find_victim = &CACHE::base_find_victim;
    replacement_final_stats = &CACHE::base_replacement_final_stats;
  };

  // destructor //TODO: @Vishal: double free error coming because of PTW
  /*~CACHE() {
      for (uint32_t i=0; i<NUM_SET; i++)
          delete[] block[i];
      delete[] block;
  };*/
  
  // GRAPH functions
  void updateCurrDst(uint32_t curr_dst),
       updateRegBaseBound(uint32_t base, uint32_t bound),
       registerGraphs(char* normal, bool is_pull);

  // functions
  int add_rq(PACKET *packet), add_wq(PACKET *packet), add_pq(PACKET *packet);

  void return_data(PACKET *packet), operate(),
      increment_WQ_FULL(uint64_t address);

  uint32_t get_occupancy(uint8_t queue_type, uint64_t address),
      get_size(uint8_t queue_type, uint64_t address);

  int check_hit(PACKET *packet), invalidate_entry(uint64_t inval_addr),
      check_mshr(PACKET *packet),
      prefetch_line(uint64_t ip, uint64_t base_addr, uint64_t pf_addr,
                    int prefetch_fill_level, uint32_t prefetch_metadata),
      kpc_prefetch_line(uint64_t base_addr, uint64_t pf_addr,
                        int prefetch_fill_level, int delta, int depth,
                        int signature, int confidence,
                        uint32_t prefetch_metadata),
      prefetch_translation(uint64_t ip, uint64_t pf_addr, int pf_fill_level,
                           uint32_t prefetch_metadata, uint64_t prefetch_id,
                           uint8_t instruction),
      check_nonfifo_queue(
          PACKET_QUEUE *queue, PACKET *packet,
          bool packet_direction); //@Vishal: Updated from check_mshr

  void handle_fill(), handle_writeback(), handle_read(), handle_prefetch(),
      flush_TLB(), handle_processed();

  void add_nonfifo_queue(PACKET_QUEUE *queue,
                         PACKET *packet), //@Vishal: Updated from add_mshr
      update_fill_cycle(),

      (CACHE::*initialize_replacement)(),

      base_initialize_replacement(), btb_initialize_replacement(),
      l1i_initialize_replacement(), l1d_initialize_replacement(),
      l2c_initialize_replacement(), llc_initialize_replacement(),
      itlb_initialize_replacement(), dtlb_initialize_replacement(),
      stlb_initialize_replacement(),

      (CACHE::*update_replacement_state)(uint32_t cpu, uint32_t set,
                                         uint32_t way, uint64_t full_addr,
                                         uint64_t ip, uint64_t victim_addr,
                                         uint32_t type, uint8_t hit),

      base_update_replacement_state(uint32_t cpu, uint32_t set, uint32_t way,
                                    uint64_t full_addr, uint64_t ip,
                                    uint64_t victim_addr, uint32_t type,
                                    uint8_t hit),
      btb_update_replacement_state(uint32_t cpu, uint32_t set, uint32_t way,
                                   uint64_t full_addr, uint64_t ip,
                                   uint64_t victim_addr, uint32_t type,
                                   uint8_t hit),
      l1i_update_replacement_state(uint32_t cpu, uint32_t set, uint32_t way,
                                   uint64_t full_addr, uint64_t ip,
                                   uint64_t victim_addr, uint32_t type,
                                   uint8_t hit),
      l1d_update_replacement_state(uint32_t cpu, uint32_t set, uint32_t way,
                                   uint64_t full_addr, uint64_t ip,
                                   uint64_t victim_addr, uint32_t type,
                                   uint8_t hit),
      l2c_update_replacement_state(uint32_t cpu, uint32_t set, uint32_t way,
                                   uint64_t full_addr, uint64_t ip,
                                   uint64_t victim_addr, uint32_t type,
                                   uint8_t hit),
      llc_update_replacement_state(uint32_t cpu, uint32_t set, uint32_t way,
                                   uint64_t full_addr, uint64_t ip,
                                   uint64_t victim_addr, uint32_t type,
                                   uint8_t hit),
      itlb_update_replacement_state(uint32_t cpu, uint32_t set, uint32_t way,
                                    uint64_t full_addr, uint64_t ip,
                                    uint64_t victim_addr, uint32_t type,
                                    uint8_t hit),
      dtlb_update_replacement_state(uint32_t cpu, uint32_t set, uint32_t way,
                                    uint64_t full_addr, uint64_t ip,
                                    uint64_t victim_addr, uint32_t type,
                                    uint8_t hit),
      stlb_update_replacement_state(uint32_t cpu, uint32_t set, uint32_t way,
                                    uint64_t full_addr, uint64_t ip,
                                    uint64_t victim_addr, uint32_t type,
                                    uint8_t hit),

      lru_update(uint32_t set, uint32_t way),
      fill_cache(uint32_t set, uint32_t way, PACKET *packet),

      (CACHE::*replacement_final_stats)(),

      base_replacement_final_stats(), btb_replacement_final_stats(),
      l1i_replacement_final_stats(), l1d_replacement_final_stats(),
      l2c_replacement_final_stats(), llc_replacement_final_stats(),
      itlb_replacement_final_stats(), dtlb_replacement_final_stats(),
      stlb_replacement_final_stats(),

      // prefetcher_initialize(),
      l1d_prefetcher_initialize(), l2c_prefetcher_initialize(),
      llc_prefetcher_initialize(), itlb_prefetcher_initialize(),
      dtlb_prefetcher_initialize(), stlb_prefetcher_initialize(),
      prefetcher_operate(uint64_t addr, uint64_t ip, uint8_t cache_hit,
                         uint8_t type),
      l1d_prefetcher_operate(uint64_t addr, uint64_t ip, uint8_t cache_hit,
                             uint8_t type),
      itlb_prefetcher_operate(uint64_t addr, uint64_t ip, uint8_t cache_hit,
                              uint8_t type, uint64_t prefetch_id,
                              uint8_t instruction),
      dtlb_prefetcher_operate(uint64_t addr, uint64_t ip, uint8_t cache_hit,
                              uint8_t type, uint64_t prefetch_id,
                              uint8_t instruction),
      stlb_prefetcher_operate(uint64_t addr, uint64_t ip, uint8_t cache_hit,
                              uint8_t type, uint64_t prefetch_id,
                              uint8_t instruction),
      prefetcher_cache_fill(uint64_t addr, uint32_t set, uint32_t way,
                            uint8_t prefetch, uint64_t evicted_addr),
      l1d_prefetcher_cache_fill(uint64_t v_addr, uint64_t addr, uint32_t set,
                                uint32_t way, uint8_t prefetch,
                                uint64_t v_evicted_addr, uint64_t evicted_addr,
                                uint32_t metadata_in),
      l1d_prefetcher_notify_about_dtlb_eviction(uint64_t addr, uint32_t set,
                                                uint32_t way, uint8_t prefetch,
                                                uint64_t evicted_addr,
                                                uint32_t metadata_in),
      itlb_prefetcher_cache_fill(uint64_t addr, uint32_t set, uint32_t way,
                                 uint8_t prefetch, uint64_t evicted_addr,
                                 uint32_t metadata_in),
      dtlb_prefetcher_cache_fill(uint64_t addr, uint32_t set, uint32_t way,
                                 uint8_t prefetch, uint64_t evicted_addr,
                                 uint32_t metadata_in),
      stlb_prefetcher_cache_fill(uint64_t addr, uint32_t set, uint32_t way,
                                 uint8_t prefetch, uint64_t evicted_addr,
                                 uint32_t metadata_in),
      // prefetcher_final_stats(),
      l1d_prefetcher_final_stats(), l2c_prefetcher_final_stats(),
      llc_prefetcher_final_stats(), itlb_prefetcher_final_stats(),
      dtlb_prefetcher_final_stats(), stlb_prefetcher_final_stats();

  // Neelu: adding for l1i prefetcher
  void (*l1i_prefetcher_cache_operate)(uint32_t, uint64_t, uint8_t, uint8_t);
  void (*l1i_prefetcher_cache_fill)(uint32_t, uint64_t, uint32_t, uint32_t,
                                    uint8_t, uint64_t);

  uint32_t
  l2c_prefetcher_operate(uint64_t addr, uint64_t ip, uint8_t cache_hit,
                         uint8_t type,
                         uint32_t metadata_in), // uint64_t prefetch_id),
      llc_prefetcher_operate(uint64_t addr, uint64_t ip, uint8_t cache_hit,
                             uint8_t type, uint32_t metadata_in),
      l2c_prefetcher_cache_fill(uint64_t addr, uint32_t set, uint32_t way,
                                uint8_t prefetch, uint64_t evicted_addr,
                                uint32_t metadata_in),
      llc_prefetcher_cache_fill(uint64_t addr, uint32_t set, uint32_t way,
                                uint8_t prefetch, uint64_t evicted_addr,
                                uint32_t metadata_in);

  uint32_t get_set(uint64_t address), get_way(uint64_t address, uint32_t set),

      (CACHE::*find_victim)(uint32_t cpu, uint64_t instr_id, uint32_t set,
                            const BLOCK *current_set, uint64_t ip,
                            uint64_t full_addr, uint32_t type),
      base_find_victim(uint32_t cpu, uint64_t instr_id, uint32_t set,
                       const BLOCK *current_set, uint64_t ip,
                       uint64_t full_addr, uint32_t type),
      btb_find_victim(uint32_t cpu, uint64_t instr_id, uint32_t set,
                      const BLOCK *current_set, uint64_t ip, uint64_t full_addr,
                      uint32_t type),
      l1i_find_victim(uint32_t cpu, uint64_t instr_id, uint32_t set,
                      const BLOCK *current_set, uint64_t ip, uint64_t full_addr,
                      uint32_t type),
      l1d_find_victim(uint32_t cpu, uint64_t instr_id, uint32_t set,
                      const BLOCK *current_set, uint64_t ip, uint64_t full_addr,
                      uint32_t type),
      l2c_find_victim(uint32_t cpu, uint64_t instr_id, uint32_t set,
                      const BLOCK *current_set, uint64_t ip, uint64_t full_addr,
                      uint32_t type),
      llc_find_victim(uint32_t cpu, uint64_t instr_id, uint32_t set,
                      const BLOCK *current_set, uint64_t ip, uint64_t full_addr,
                      uint32_t type),
      itlb_find_victim(uint32_t cpu, uint64_t instr_id, uint32_t set,
                       const BLOCK *current_set, uint64_t ip,
                       uint64_t full_addr, uint32_t type),
      dtlb_find_victim(uint32_t cpu, uint64_t instr_id, uint32_t set,
                       const BLOCK *current_set, uint64_t ip,
                       uint64_t full_addr, uint32_t type),
      stlb_find_victim(uint32_t cpu, uint64_t instr_id, uint32_t set,
                       const BLOCK *current_set, uint64_t ip,
                       uint64_t full_addr, uint32_t type),

      lru_victim(uint32_t cpu, uint64_t instr_id, uint32_t set,
                 const BLOCK *current_set, uint64_t ip, uint64_t full_addr,
                 uint32_t type);
};

#endif
