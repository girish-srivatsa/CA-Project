#include <iostream>
#include <fstream>

using namespace std;

#define NUM_INSTR_DESTINATIONS 2
#define NUM_INSTR_SOURCES 4
#define NUM_GRAPH_NUMERIC_OPERANDS 2
#define NUM_GRAPH_STRING_OPERANDS 1
#define MAX_GRAPH_FILE_NAME 64

typedef struct trace_instr_format {
    unsigned long long int ip;  // instruction pointer (program counter) value

    unsigned char is_branch;    // is this branch
    unsigned char branch_taken; // if so, is this taken

    uint8_t is_graph_instruction; // check for being a graph function
    uint8_t graph_opcode; // checks which of the graph functions is called
    // 0 - updateCurrDst - PIN_updateCurrDst
    // 1 - updateRegBaseBound 
    // 2 - registerGraphs
    uint64_t graph_operands[NUM_GRAPH_NUMERIC_OPERANDS]; // store a list of graph operands
    char graph_name[MAX_GRAPH_FILE_NAME];

    unsigned char destination_registers[NUM_INSTR_DESTINATIONS]; // output registers
    unsigned char source_registers[NUM_INSTR_SOURCES];           // input registers

    unsigned long long int destination_memory[NUM_INSTR_DESTINATIONS]; // output memory
    unsigned long long int source_memory[NUM_INSTR_SOURCES];           // input memory
} trace_instr_format_t;

int main() {

    char *filename = (char*)"pull_g15_k2.trace";
    trace_instr_format_t T;
    FILE* in = fopen(filename, "rb");
    while (fread(&T, sizeof(trace_instr_format_t), 1, in)) {
        if (T.is_graph_instruction && T.graph_opcode == 1) {
            cout << T.graph_operands[0] << " " << T.graph_operands[1] << "\n";
            cout << T.graph_operands[1] - T.graph_operands[0] << "\n";  
        }
    }

    fclose(in);

    return 0;
}