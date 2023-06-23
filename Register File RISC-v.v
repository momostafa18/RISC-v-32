
module RF_RISC_ARCH(
input [31:0]WD3,
input [4:0]A1,
input [4:0]A2,
input [4:0]A3,
input clk,
input areset,
input WE3,
output reg [31:0]RD1,
output reg [31:0]RD2);

reg [31:0]RF_SIZE[31:0];


integer i;
initial
begin
for(i=0;i<32;i=i+1)
 RF_SIZE[i] = 0;
end

always @(*)
begin

RD1 <= RF_SIZE[A1];
RD2 <= RF_SIZE[A2];

end

always @(posedge clk)
begin

if (WE3)
         RF_SIZE[A3]<=WD3;
end
endmodule

