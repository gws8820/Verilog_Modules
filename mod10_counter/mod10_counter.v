module mod10_counter(clk,clk_out,rst);
input clk,rst;
output reg[3:0] clk_out;
reg [3:0] counter;

always @(posedge clk)
begin
  if (rst)
    counter <= 4'd0;
  else if(counter==4'b1010)
    counter<=4'd0;
  else
    counter<=counter+1;

  clk_out <= counter;
  end
  
endmodule