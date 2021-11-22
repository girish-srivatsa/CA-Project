#include "cache.h"

#include <map>

void CACHE::l1d_prefetcher_initialize() {}

void CACHE::l1d_prefetcher_operate(uint64_t addr, uint64_t ip,
                                   uint8_t cache_hit, uint8_t type) {}

void CACHE::l1d_prefetcher_notify_about_dtlb_eviction(
    uint64_t addr, uint32_t set, uint32_t way, uint8_t prefetch,
    uint64_t evicted_addr, uint32_t metadata_in) {}

void CACHE::l1d_prefetcher_cache_fill(uint64_t v_addr, uint64_t addr,
                                      uint32_t set, uint32_t way,
                                      uint8_t prefetch, uint64_t v_evicted_addr,
                                      uint64_t evicted_addr,
                                      uint32_t metadata_in) {}

void CACHE::l1d_prefetcher_final_stats() {}
