#ifndef CHAMPSIM_H
#define CHAMPSIM_H

#include <assert.h>
#include <limits.h>
#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

#include <iomanip>
#include <iostream>
#include <map>
#include <queue>
#include <random>
#include <string>

// USEFUL MACROS
//#define DEBUG_PRINT
#define SANITY_CHECK
#define LLC_BYPASS
#define DRC_BYPASS
//#define NO_CRC2_COMPILE

//@Rahul: PTW
#define INS_PAGE_TABLE_WALKER
#define PTW_L1D
//#define PTW_L2C
//#define PTW_LLC
//#define PTW_DRAM
//#define PTW_L1D_L2C

//#define IDEAL_CACHE_FOR_TRANSLATION_ACCESS
//#define IDEAL_L1D
//#define IDEAL_L2
//#define IDEAL_L3

//#define DYNAMIC_POLICY

#define PT_STATS
//#define CALC_REUSE_DIST


//@Rahul: calculating dead blocks
#define FIND_DEAD_BLOCKS

//@Rahul: find which blocks are getting evicted by which block
#define FIND_INTERFERENCE

//@Rahul: measuring ROB stalls due to address translation
#define ROB_STALL_STATS

//#define KEEP_TRIP_COUNT

//#define PERFECT_BTB

#pragma GCC diagnostic ignored                                                 \
    "-Wmisleading-indentation" //@Vishal: Added to ignore this warning
#pragma GCC diagnostic ignored "-Wunused-variable"

#ifdef DEBUG_PRINT
//#define DP(x) x //@Vishal: Use this to print only in simulation

#define DP(x) {int temp=warmup_complete[0];warmup_complete[0]=1;x;warmup_complete[0]=temp;}
////@Vishal: Use this to print in warmup+simulation

#else
#define DP(x)
#endif

// CPU
#define NUM_CPUS 1
#define CPU_FREQ 4000
#define DRAM_IO_FREQ 6400 // 1600	Neelu: Changed
#define PAGE_SIZE 4096
#define LOG2_PAGE_SIZE 12

// CACHE
#define BLOCK_SIZE 64
#define LOG2_BLOCK_SIZE 6
#define MAX_READ_PER_CYCLE 8
#define MAX_FILL_PER_CYCLE 1

#define INFLIGHT 1
#define COMPLETED 2

#define FILL_L1 1
#define FILL_ITLB 1
#define FILL_DTLB 1
#define FILL_L2 2
#define FILL_STLB 2
#define FILL_LLC 4
#define FILL_DRC 8
#define FILL_DRAM 16

// Context-switch
#define CONTEXT_SWITCH_FILE_SIZE 20

// DRAM
#define DRAM_CHANNELS 1 // default: assuming one DIMM per one channel 4GB * 1 => 4GB off-chip memory
#define LOG2_DRAM_CHANNELS 0
#define DRAM_RANKS 1 // 512MB * 8 ranks => 4GB per DIMM
#define LOG2_DRAM_RANKS 0
#define DRAM_BANKS 8 // 64MB * 8 banks => 512MB per rank
#define LOG2_DRAM_BANKS 3
#define DRAM_ROWS 65536 // 2KB * 32K rows => 64MB per bank
#define LOG2_DRAM_ROWS 16
#define DRAM_COLUMNS                                                           \
  128 // 64B * 32 column chunks (Assuming 1B DRAM cell * 8 chips * 8
      // transactions = 64B size of column chunks) => 2KB per row
#define LOG2_DRAM_COLUMNS 7
#define DRAM_ROW_SIZE (BLOCK_SIZE * DRAM_COLUMNS / 1024)

#define DRAM_SIZE                                                              \
  (DRAM_CHANNELS * DRAM_RANKS * DRAM_BANKS * DRAM_ROWS * DRAM_ROW_SIZE / 1024)
#define DRAM_PAGES ((DRAM_SIZE << 10) >> 2)
//#define DRAM_PAGES 10

using namespace std;

extern uint8_t warmup_complete[NUM_CPUS], simulation_complete[NUM_CPUS],
    context_switch[NUM_CPUS], all_warmup_complete, all_simulation_complete,
    MAX_INSTR_DESTINATIONS, knob_cloudsuite, knob_low_bandwidth,
    knob_context_switch;

extern uint64_t current_core_cycle[NUM_CPUS], stall_cycle[NUM_CPUS],
    last_drc_read_mode, last_drc_write_mode, drc_blocks;

extern queue<uint64_t> page_queue;
extern map<uint64_t, uint64_t> inverse_table, recent_page, unique_cl[NUM_CPUS];
extern uint64_t previous_ppage, num_adjacent_page, allocated_pages;

extern uint64_t previous_ppage, num_adjacent_page, num_cl[NUM_CPUS],
    allocated_pages, num_page[NUM_CPUS], minor_fault[NUM_CPUS],
    major_fault[NUM_CPUS];

//@Vasudha: Dumped page table
extern map<uint64_t, uint64_t> temp_page_table;

void print_stats();
uint64_t rotl64(uint64_t n, unsigned int c), rotr64(uint64_t n, unsigned int c),
    va_to_pa(uint32_t cpu, uint64_t instr_id, uint64_t va,
             uint64_t unique_vpage);

// log base 2 function from efectiu
int lg2(int n);

// smart random number generator
class RANDOM {
public:
  std::random_device rd;
  std::mt19937_64 engine{rd()};
  std::uniform_int_distribution<uint64_t> dist{
      0, 0xFFFFFFFFF}; // used to generate random physical page numbers

  RANDOM(uint64_t seed) { engine.seed(seed); }

  uint64_t draw_rand() { return dist(engine); };
};
extern uint64_t champsim_seed;
extern RANDOM champsim_rand;
#endif
