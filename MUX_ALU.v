module MUX_ALU(
input ALUSrc,
input [31:0]Output2_from_RF,
input [31:0]Imm_Ext,
output reg [31:0]SRC_B_TO_ALU
);

always @(*)
begin
case (ALUSrc)
          1'b0:
		  SRC_B_TO_ALU = Output2_from_RF ;
		  1'b1 :
		  SRC_B_TO_ALU = Imm_Ext ;
default :
SRC_B_TO_ALU = Output2_from_RF;

endcase
end
endmodule
