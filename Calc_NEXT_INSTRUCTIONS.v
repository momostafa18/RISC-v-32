
module Calc_PC_Next(
input PCSrc ,
input [31:0]IMMExt,
input [31:0]PC_Current,
output reg [31:0] PC_Next);

always @(*)
begin 
case (PCSrc)
            1'b0 : PC_Next = PC_Current + 3'd4 ;
			1'b1 : PC_Next = PC_Current + IMMExt ;
			default : PC_Next = PC_Current + 3'd4 ;
endcase
end
endmodule
