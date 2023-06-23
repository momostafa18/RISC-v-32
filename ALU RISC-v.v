
module ALU_RISC_ARCH(
input [31:0] Src_A,
input [31:0] Src_B,
input [2:0] ALU_Control,
output reg [31:0] ALU_Result,
output ZF,SF );


always @(*)
begin
case (ALU_Control)
     3'b000 : ALU_Result = Src_A + Src_B ;
	 3'b001 : ALU_Result = Src_A << Src_B ;
	 3'b010 : ALU_Result = Src_A - Src_B ;
	 3'b100 : ALU_Result = Src_A ^ Src_B ;
	 3'b101 : ALU_Result = Src_A >> Src_B ;
	 3'b110 : ALU_Result = Src_A | Src_B ;
	 3'b111 : ALU_Result = Src_A & Src_B ;
	 default : ALU_Result = 0 ;
	 endcase
	 end
assign SF = ALU_Result[31];
assign ZF = ~(|ALU_Result);

endmodule
