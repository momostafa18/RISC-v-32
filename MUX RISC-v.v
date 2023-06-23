module MUX(
input ResultSrc,
input [31:0]ALUResult,
input [31:0]OutputDataMEM,
output reg [31:0]WriteRF);

always @(*)
begin 
case (ResultSrc)
                1'b0 :
				WriteRF = ALUResult ;
				1'b1 :
				WriteRF = OutputDataMEM ;
default: WriteRF = ALUResult ;
endcase

end

endmodule
