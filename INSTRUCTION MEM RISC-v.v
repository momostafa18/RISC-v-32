
module INST_MEM_RISC_ARCH(
input [31:0]PC_Current ,
output reg [31:0]INSTRUCTION_Current
);

reg [31:0]ROM_MEM[63:0];

initial 
begin
$readmemh("code.txt",ROM_MEM,0,20);
end

always @(*)
begin 
INSTRUCTION_Current = ROM_MEM[PC_Current/4];
end
endmodule




