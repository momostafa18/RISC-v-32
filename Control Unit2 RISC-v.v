module ALU_DECODER_RISC_ARCH(
input [1:0]ALU_OP,
input [2:0]Func3,
input Func7,
input [6:0]OP,
output reg [2:0]ALU_control);

always @(*)
begin
case (ALU_OP)
            2'b00 : 
			ALU_control = 3'b000 ;
			2'b01 :
			ALU_control = 3'b010 ;
			2'b10 :
            if (Func3 == 3'b000 && ({OP[5],Func7} == 2'b00 || {OP[5],Func7} == 2'b01 || {OP[5],Func7} == 2'b10 ))		
						ALU_control = 3'b000 ;
			else if (Func3 == 3'b000 && {OP[5],Func7} == 2'b11)			
			            ALU_control = 3'b010 ;
		    else if (Func3 == 3'b001)
			            ALU_control = 3'b001;
			else if (Func3 == 3'b100)
                        ALU_control = 3'b100;
			else if (Func3 == 3'b101)
                        ALU_control = 3'b101;
			else if (Func3 == 3'b110)
                        ALU_control = 3'b110;	
			else if (Func3 == 3'b111)
                        ALU_control = 3'b111;			
            default : ALU_control = 3'b000 ;
endcase

end
endmodule
