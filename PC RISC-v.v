
module PC_RISC_ARCH(
input [31:0]PC_Next,
input clk ,
input areset ,
input load ,
output reg [31:0]PC_Current);


always @(posedge clk or negedge areset)
begin 
if (~areset)
      PC_Current <= 0;
else
begin
       if(load)
       PC_Current <= PC_Next;
	   else 
	  PC_Current <= PC_Current;

end	   
end

endmodule 