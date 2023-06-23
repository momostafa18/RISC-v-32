
module DATA_MEM_RISC_ARCH(
input [31:0]WD,
input [31:0]A,
input clk ,
input WE,
output reg [31:0]RD);

reg [31:0] MEM_SIZE [63:0];

always @(*)
begin 
    RD <= MEM_SIZE[A];
end

always @(posedge clk)
begin

if(WE)
    MEM_SIZE[A[31:2]] <= WD;
end
endmodule
