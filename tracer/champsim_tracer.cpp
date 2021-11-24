
/*! @file
 *  This is an example of the PIN tool that demonstrates some basic PIN APIs 
 *  and could serve as the starting point for developing your first PIN tool
 */

#include "pin.H"
#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <string.h>
#include <string>

using namespace std;

#define NUM_INSTR_DESTINATIONS 2
#define NUM_INSTR_SOURCES 4

typedef struct trace_instr_format {
    unsigned long long int ip;  // instruction pointer (program counter) value

    unsigned char is_branch;    // is this branch
    unsigned char branch_taken; // if so, is this taken

    unsigned char destination_registers[NUM_INSTR_DESTINATIONS]; // output registers
    unsigned char source_registers[NUM_INSTR_SOURCES];           // input registers

    unsigned long long int destination_memory[NUM_INSTR_DESTINATIONS]; // output memory
    unsigned long long int source_memory[NUM_INSTR_SOURCES];           // input memory
} trace_instr_format_t;

/* ================================================================== */
// Global variables 
/* ================================================================== */

UINT64 instrCount = 0;

FILE* out;

LOCALVAR ADDRINT UpdateRegIndexAddress = 0;

bool output_file_closed = false;
bool tracing_on = false;

trace_instr_format_t curr_instr;

void updateRegIndex(int index)
{
    std::cout<<"hello_in"<<std::endl;
    std::string trial = "hello-it works";
    fwrite(trial.c_str(),trial.size(),1,out);
}


/* ===================================================================== */
// Command line switches
/* ===================================================================== */
KNOB<string> KnobOutputFile(KNOB_MODE_WRITEONCE,  "pintool", "o", "champsim.trace", 
        "specify file name for Champsim tracer output");

KNOB<UINT64> KnobSkipInstructions(KNOB_MODE_WRITEONCE, "pintool", "s", "0", 
        "How many instructions to skip before tracing begins");

KNOB<UINT64> KnobTraceInstructions(KNOB_MODE_WRITEONCE, "pintool", "t", "1000000", 
        "How many instructions to trace");

/* ===================================================================== */
// Utilities
/* ===================================================================== */

/*!
 *  Print out help message.
 */
INT32 Usage()
{
    cerr << "This tool creates a register and memory access trace" << endl 
        << "Specify the output trace file with -o" << endl 
        << "Specify the number of instructions to skip before tracing with -s" << endl
        << "Specify the number of instructions to trace with -t" << endl << endl;

    cerr << KNOB_BASE::StringKnobSummary() << endl;

    return -1;
}

/* ===================================================================== */
// Analysis routines
/* ===================================================================== */

void BeginInstruction(VOID *ip, UINT32 op_code, VOID *opstring)
{
    instrCount++;
    //printf("[%p %u %s ", ip, opcode, (char*)opstring);

    if(instrCount > KnobSkipInstructions.Value()) 
    {
        tracing_on = true;

        if(instrCount > (KnobTraceInstructions.Value()+KnobSkipInstructions.Value()))
            tracing_on = false;
    }

    if(!tracing_on) 
        return;

    // reset the current instruction
    curr_instr.ip = (unsigned long long int)ip;

    curr_instr.is_branch = 0;
    curr_instr.branch_taken = 0;

    for(int i=0; i<NUM_INSTR_DESTINATIONS; i++) 
    {
        curr_instr.destination_registers[i] = 0;
        curr_instr.destination_memory[i] = 0;
    }

    for(int i=0; i<NUM_INSTR_SOURCES; i++) 
    {
        curr_instr.source_registers[i] = 0;
        curr_instr.source_memory[i] = 0;
    }
}

void EndInstruction()
{
    //printf("%d]\n", (int)instrCount);

    //printf("\n");

    if(instrCount > KnobSkipInstructions.Value())
    {
        tracing_on = true;

        if(instrCount <= (KnobTraceInstructions.Value()+KnobSkipInstructions.Value()))
        {
            // keep tracing
            fwrite(&curr_instr, sizeof(trace_instr_format_t), 1, out);
        }
        else
        {
            tracing_on = false;
            // close down the file, we're done tracing
            if(!output_file_closed)
            {
                fclose(out);
                output_file_closed = true;
            }

            exit(0);
        }
    }
}

void BranchOrNot(UINT32 taken, ADDRINT Target)
{
    //printf("[%d] ", taken);

    curr_instr.is_branch = 1;
    if(taken != 0)
    {
        curr_instr.branch_taken = 1;
    }
    // std::cout<<"hurray "<<Target<<std::endl;
}

void RegRead(UINT32 i, UINT32 index)
{
    if(!tracing_on) return;

    REG r = (REG)i;

    /*
       if(r == 26)
       {
    // 26 is the IP, which is read and written by branches
    return;
    }
    */

    //cout << r << " " << REG_StringShort((REG)r) << " " ;
    //cout << REG_StringShort((REG)r) << " " ;

    //printf("%d ", (int)r);

    // check to see if this register is already in the list
    int already_found = 0;
    for(int i=0; i<NUM_INSTR_SOURCES; i++)
    {
        if(curr_instr.source_registers[i] == ((unsigned char)r))
        {
            already_found = 1;
            break;
        }
    }
    if(already_found == 0)
    {
        for(int i=0; i<NUM_INSTR_SOURCES; i++)
        {
            if(curr_instr.source_registers[i] == 0)
            {
                curr_instr.source_registers[i] = (unsigned char)r;
                break;
            }
        }
    }
}

void RegWrite(REG i, UINT32 index)
{
    if(!tracing_on) return;

    REG r = (REG)i;

    /*
       if(r == 26)
       {
    // 26 is the IP, which is read and written by branches
    return;
    }
    */

    //cout << "<" << r << " " << REG_StringShort((REG)r) << "> ";
    //cout << "<" << REG_StringShort((REG)r) << "> ";

    //printf("<%d> ", (int)r);

    int already_found = 0;
    for(int i=0; i<NUM_INSTR_DESTINATIONS; i++)
    {
        if(curr_instr.destination_registers[i] == ((unsigned char)r))
        {
            already_found = 1;
            break;
        }
    }
    if(already_found == 0)
    {
        for(int i=0; i<NUM_INSTR_DESTINATIONS; i++)
        {
            if(curr_instr.destination_registers[i] == 0)
            {
                curr_instr.destination_registers[i] = (unsigned char)r;
                break;
            }
        }
    }
    /*
       if(index==0)
       {
       curr_instr.destination_register = (unsigned long long int)r;
       }
       */
}

void MemoryRead(VOID* addr, UINT32 index, UINT32 read_size)
{
    if(!tracing_on) return;

    //printf("0x%llx,%u ", (unsigned long long int)addr, read_size);

    // check to see if this memory read location is already in the list
    int already_found = 0;
    for(int i=0; i<NUM_INSTR_SOURCES; i++)
    {
        if(curr_instr.source_memory[i] == ((unsigned long long int)addr))
        {
            already_found = 1;
            break;
        }
    }
    if(already_found == 0)
    {
        for(int i=0; i<NUM_INSTR_SOURCES; i++)
        {
            if(curr_instr.source_memory[i] == 0)
            {
                curr_instr.source_memory[i] = (unsigned long long int)addr;
                break;
            }
        }
    }
}

void MemoryWrite(VOID* addr, UINT32 index)
{
    if(!tracing_on) return;

    //printf("(0x%llx) ", (unsigned long long int) addr);

    // check to see if this memory write location is already in the list
    int already_found = 0;
    for(int i=0; i<NUM_INSTR_DESTINATIONS; i++)
    {
        if(curr_instr.destination_memory[i] == ((unsigned long long int)addr))
        {
            already_found = 1;
            break;
        }
    }
    if(already_found == 0)
    {
        for(int i=0; i<NUM_INSTR_DESTINATIONS; i++)
        {
            if(curr_instr.destination_memory[i] == 0)
            {
                curr_instr.destination_memory[i] = (unsigned long long int)addr;
                break;
            }
        }
    }
    /*
       if(index==0)
       {
       curr_instr.destination_memory = (long long int)addr;
       }
       */
}
// Test

/* ===================================================================== */
// Instrumentation callbacks
/* ===================================================================== */

void Before(int index){
    std::string test="testing123";
    std::cout<<test<<" "<<index<<std::endl;
    fwrite(test.c_str(),test.size(),1,out);
}

void After(){
    std::string test="testing123";
    std::cout<<test<<std::endl;
    fwrite(test.c_str(),test.size(),1,out);
}

// Is called for every instruction and instruments reads and writes
VOID Instruction(INS ins, VOID *v)
{
    // begin each instruction with this function
    if(INS_IsCall(ins)){
        if (INS_IsDirectControlFlow(ins))
        {
            // RTN rtn = RTN_FindByAddress(INS_DirectControlFlowTargetAddress(ins));
            // std::cout<<"happening "<<RTN_Name(rtn)<<" at "<<INS_DirectControlFlowTargetAddress(ins)<<std::endl;
            // INS_InsertCall(ins, IPOINT_BEFORE, AFUNPTR(Before), IARG_FUNCARG_CALLSITE_VALUE, 0,
            //               IARG_END);
        } else{
            
        }
    }


    UINT32 opcode = INS_Opcode(ins);
    INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)BeginInstruction, IARG_INST_PTR, IARG_UINT32, opcode, IARG_END);

    // instrument branch instructions
    if(INS_IsBranch(ins))
        INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)BranchOrNot, IARG_BRANCH_TAKEN,IARG_BRANCH_TARGET_ADDR, IARG_END);

    // instrument register reads
    UINT32 readRegCount = INS_MaxNumRRegs(ins);
    for(UINT32 i=0; i<readRegCount; i++) 
    {
        UINT32 regNum = INS_RegR(ins, i);

        INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)RegRead,
                IARG_UINT32, regNum, IARG_UINT32, i,
                IARG_END);
    }

    // instrument register writes
    UINT32 writeRegCount = INS_MaxNumWRegs(ins);
    for(UINT32 i=0; i<writeRegCount; i++) 
    {
        UINT32 regNum = INS_RegW(ins, i);

        INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)RegWrite,
                IARG_UINT32, regNum, IARG_UINT32, i,
                IARG_END);
    }

    // instrument memory reads and writes
    UINT32 memOperands = INS_MemoryOperandCount(ins);

    // Iterate over each memory operand of the instruction.
    for (UINT32 memOp = 0; memOp < memOperands; memOp++) 
    {
        if (INS_MemoryOperandIsRead(ins, memOp)) 
        {
            UINT32 read_size = INS_MemoryReadSize(ins);

            INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)MemoryRead,
                    IARG_MEMORYOP_EA, memOp, IARG_UINT32, memOp, IARG_UINT32, read_size,
                    IARG_END);
        }
        if (INS_MemoryOperandIsWritten(ins, memOp)) 
        {
            INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)MemoryWrite,
                    IARG_MEMORYOP_EA, memOp, IARG_UINT32, memOp,
                    IARG_END);
        }
    }

    // finalize each instruction with this function
    INS_InsertCall(ins, IPOINT_BEFORE, (AFUNPTR)EndInstruction, IARG_END);
}

/*
void Routine(RTN rtn, void* v)
{
    std::string rtn_name = RTN_Name(rtn);
    if(rtn_name.find("UpdateRegIndex")!=std::string::npos){
        // Instrument to print the input argument value and the return value.
        UpdateRegIndexAddress = RTN_Address(rtn);
        std::cout<<"hit "<<UpdateRegIndexAddress<<std::endl;
        RTN_Open(rtn);

        RTN_InsertCall(rtn, IPOINT_BEFORE, AFUNPTR(Before), IARG_FUNCARG_ENTRYPOINT_VALUE, 0, IARG_END);

        RTN_Close(rtn);
    }
}
*/
/*!
 * Print out analysis results.
 * This function is called when the application exits.
 * @param[in]   code            exit code of the application
 * @param[in]   v               value specified by the tool in the 
 *                              PIN_AddFiniFunction function call
 */
VOID Fini(INT32 code, VOID *v)
{
    // close the file if it hasn't already been closed
    if(!output_file_closed) 
    {
        fclose(out);
        output_file_closed = true;
    }
}


VOID Image(IMG img, VOID* v)
{
    // Walk through the symbols in the symbol table.
    //
    for (SYM sym = IMG_RegsymHead(img); SYM_Valid(sym); sym = SYM_Next(sym))
    {
        string undFuncName = PIN_UndecorateSymbolName(SYM_Name(sym), UNDECORATION_NAME_ONLY);
 
        //  Find the RtlAllocHeap() function.
        if (undFuncName == "PIN_UpdateRegIndex")
        {
            RTN allocRtn = RTN_FindByAddress(IMG_LowAddress(img) + SYM_Value(sym));

            UpdateRegIndexAddress = RTN_Address(allocRtn);
            // std::cout<<"hit "<<UpdateRegIndexAddress<<std::endl;
            if (RTN_Valid(allocRtn))
            {
                // Instrument to print the input argument value and the return value.
                RTN_Open(allocRtn);

                RTN_InsertCall(allocRtn, IPOINT_BEFORE, AFUNPTR(Before), IARG_FUNCARG_ENTRYPOINT_VALUE, 0, IARG_END);

                RTN_Close(allocRtn);
            }
        }
  
    }
}

/*!
 * The main procedure of the tool.
 * This function is called when the application image is loaded but not yet started.
 * @param[in]   argc            total number of elements in the argv array
 * @param[in]   argv            array of command line arguments, 
 *                              including pin -t <toolname> -- ...
 */
int main(int argc, char *argv[])
{
    // Initialize PIN library. Print help message if -h(elp) is specified
    // in the command line or the command line is invalid 
    PIN_InitSymbols();
    if( PIN_Init(argc,argv) )
        return Usage();

    const char* fileName = KnobOutputFile.Value().c_str();

    out = fopen(fileName, "ab");
    if (!out) 
    {
        cout << "Couldn't open output trace file. Exiting." << endl;
        exit(1);
    }

    IMG_AddInstrumentFunction(Image, 0);

    // Register function to be called to register Routines
    // RTN_AddInstrumentFunction(Routine, 0);

    // Register function to be called to instrument instructions
    INS_AddInstrumentFunction(Instruction, 0);

    // Register function to be called when the application exits
    PIN_AddFiniFunction(Fini, 0);

    //cerr <<  "===============================================" << endl;
    //cerr <<  "This application is instrumented by the Champsim Trace Generator" << endl;
    //cerr <<  "Trace saved in " << KnobOutputFile.Value() << endl;
    //cerr <<  "===============================================" << endl;

    // Start the program, never returns
    PIN_StartProgram();

    return 0;
}

/* ===================================================================== */
/* eof */
/* ===================================================================== */
