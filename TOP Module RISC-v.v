module Top_Module_RISC_ARCH(
input clk,
input areset
);

wire [31:0]Input1_to_ALU;
wire [31:0]Input2_to_ALU;
wire [2:0]ALU_Control ;
wire [31:0]AlU_Result;


wire SF;
wire ZF;


wire [31:0]INSTRUCTION_32;


wire [31:0]PC_32;
wire [31:0]PC_NEXT_32;



wire REG_WRITE;
wire [1:0]ImmSrc;
wire ALUSrc;
wire MEMWrite;
wire ResultSrc;
wire Branch;
wire PCSrc;
wire load;
wire [1:0]ALUop;


wire [31:0]ImmExt;

wire [31:0]Output_data_MEM;
wire [31:0]Output2_From_RF;

wire [31:0]Write_RF;




ALU_RISC_ARCH                                   ALU_RISC_32(Input1_to_ALU,Input2_to_ALU,ALU_Control,AlU_Result,ZF,SF);
Main_Decoder_RISC_ARCH                          MD_RISC_32(INSTRUCTION_32[6:0],ZF,SF,INSTRUCTION_32[14:12],REG_WRITE,ImmSrc,ALUSrc,MEMWrite,ResultSrc,PCSrc,load,ALUop);
ALU_DECODER_RISC_ARCH                           ALU_DECODER_RISC_32(ALUop,INSTRUCTION_32[14:12],INSTRUCTION_32[30],INSTRUCTION_32[6:0],ALU_Control);
Sign_Extend_RISC_ARCH                           SE_RISC_32(ImmSrc,INSTRUCTION_32[31:7],ImmExt);
PC_RISC_ARCH                                    PC_RISC_32(PC_NEXT_32,clk,areset,load,PC_32);
Calc_PC_Next                                    PC_Calc_Next_RISC_32(PCSrc,ImmExt,PC_32,PC_NEXT_32);
INST_MEM_RISC_ARCH                              INST_MEM_RISC_32(PC_32,INSTRUCTION_32);
MUX                                             MUX_RISC_32(ResultSrc,AlU_Result,Output_data_MEM,Write_RF);
RF_RISC_ARCH                                    RF_RISC_32(Write_RF,INSTRUCTION_32[19:15],INSTRUCTION_32[24:20],INSTRUCTION_32[11:7],clk,areset,REG_WRITE,Input1_to_ALU,Output2_From_RF);
MUX_ALU                                         MUX_ALU_32(ALUSrc,Output2_From_RF,ImmExt,Input2_to_ALU);
DATA_MEM_RISC_ARCH                              DATA_MEM_RISC_32(Output2_From_RF,AlU_Result,clk,MEMWrite,Output_data_MEM);


endmodule