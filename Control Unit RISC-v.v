module Main_Decoder_RISC_ARCH(
input [6:0]OP_CODE,
input ZF,
input SF,
input [2:0]Func3 ,
output reg RegWrite,
output reg [1:0]IMMSrc,
output reg ALUSrc,
output reg MEMWrite,
output reg ResultSrc,
output reg PCSrc,
output load,
output reg [1:0]ALUop);

reg Branch;

always @(*)
begin
case (OP_CODE)
         7'b000_0011 : 
		 begin
		 RegWrite = 1;
		 IMMSrc = 2'b00;
		 ALUSrc = 1;
		 MEMWrite = 0;
		 ResultSrc = 1;
		 Branch = 0 ;
		 ALUop = 2'b00;
		 end
		 7'b010_0011 :
		 begin
		 RegWrite = 0;
		 IMMSrc = 2'b01;
		 ALUSrc = 1;
		 MEMWrite = 1;
		 Branch = 0 ;
		 ALUop = 2'b00;
		 end
		 7'b011_0011 :
		 begin
		 RegWrite = 1;
		 ALUSrc = 0;
		 MEMWrite = 0;
		 ResultSrc = 0;
		 Branch = 0 ;
		 ALUop = 2'b10;
		 end
		 7'b001_0011 :
		 begin 
		 RegWrite = 1;
		 IMMSrc = 2'b00;
		 ALUSrc = 1;
		 MEMWrite = 0;
		 ResultSrc = 0;
		 Branch = 0 ;
		 ALUop = 2'b10;
		 end
		 7'b1100011 :
		  begin
		 RegWrite = 0;
		 IMMSrc = 2'b10;
		 ALUSrc = 0;
		 MEMWrite = 0;
		 Branch = 1;
		 ALUop = 2'b01;
		 end
		 default : 
		  begin
		 RegWrite = 0;
		 IMMSrc = 2'b00;
		 ALUSrc = 0;
		 MEMWrite = 0;
		 ResultSrc = 0;
		 Branch = 0 ;
		 ALUop = 2'b00;
		 end
		 endcase
end

always @(*)
begin
if(Branch)
begin
      case(Func3)
         3'b000 : 
		 PCSrc = Branch & ZF ;
		 3'b001 : 
		 PCSrc = Branch & ~(ZF) ;
		 3'b100 :
		 PCSrc = Branch & SF ;
         default : 
		 PCSrc = 1'b0;
		 endcase
		 end
		 
		 else 
		 PCSrc = 1'b0; 
end
         assign load = 1'b1;
endmodule
