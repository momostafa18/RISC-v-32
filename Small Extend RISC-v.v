module Sign_Extend_RISC_ARCH(
input [1:0]ImmSrc,
input [31:7]INSTR_Current,
output reg [31:0]ImmExt);

always @(*)
begin

case (ImmSrc)
             2'b00 :
			 ImmExt = {{20{INSTR_Current[31]}},INSTR_Current[31:20]};
			 2'b01 :
			 ImmExt = {{20{INSTR_Current[31]}},INSTR_Current[31:25],INSTR_Current[11:7]};
			 2'b10 :
			 ImmExt = {{20{INSTR_Current[31]}},INSTR_Current[7],INSTR_Current[30:25],INSTR_Current[11:8],1'b0};
			 default 
			 ImmExt = 0;
			 endcase
end
endmodule