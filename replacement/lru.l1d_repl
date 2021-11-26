#include "cache.h"
#include "uncore.h"
#include <fstream>
using std::ofstream;

ofstream out;

uint64_t num_access=0;

// initialize replacement state
void CACHE::l1d_initialize_replacement() {
  out.open("l1d.logs");
  cout << NAME << " has LRU replacement policy" << endl;
}

// find replacement victim
uint32_t CACHE::l1d_find_victim(uint32_t cpu, uint64_t instr_id, uint32_t set,
                                const BLOCK *current_set, uint64_t ip,
                                uint64_t full_addr, uint32_t type) {
  // baseline LRU
  return lru_victim(cpu, instr_id, set, current_set, ip, full_addr, type);
}

uint64_t lru_pa_to_va(uint64_t full_addr){
    uint64_t vfull_addr; // Inverse check of virtual address as base and bound are virtual
    map<uint64_t, uint64_t>::iterator ppage_check = inverse_table.find(
        full_addr >> LOG2_PAGE_SIZE);
    if (ppage_check == inverse_table.end()) {
    cout << "Inverse Mapping Failed! cache victim address: "<<full_addr<< endl;
        assert(0);
    }
    vfull_addr = (ppage_check->second) << LOG2_PAGE_SIZE;
    vfull_addr |=(full_addr & ((1 << LOG2_PAGE_SIZE) - 1));
    return vfull_addr;
}

// called on every cache hit and cache fill
void CACHE::l1d_update_replacement_state(uint32_t cpu, uint32_t set,
                                         uint32_t way, uint64_t full_addr,
                                         uint64_t ip, uint64_t victim_addr,
                                         uint32_t type, uint8_t hit) {

  if ((type == WRITEBACK) && ip)
    assert(0);

  // uncomment this line to see the LLC accesses
  // cout << "CPU: " << cpu << "  L1D " << setw(9) << TYPE_NAME << " set: " <<
  // setw(5) << set << " way: " << setw(2) << way; cout << hex << " paddr: " <<
  // setw(12) << paddr << " ip: " << setw(8) << ip << " victim_addr: " <<
  // victim_addr << dec << endl;
  out<<"ADDR: "<<lru_pa_to_va(full_addr)<<endl;
  // baseline LRU
  if (hit && (type == WRITEBACK)) // writeback hit does not update LRU state
    return;


  if ((uncore.LLC.irreg_data_base<=lru_pa_to_va(full_addr)) && (lru_pa_to_va(full_addr)<uncore.LLC.irreg_data_bound)) {
          num_access++;
      }

  return lru_update(set, way);
}

void CACHE::l1d_replacement_final_stats() {
  cout<<"IRREG DATA L1D ACCESS: "<<num_access<<endl;
}
