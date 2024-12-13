module dff(D,RSTn,CLK,Q,Qb);

input [1:0] D;
input RSTn, CLK;
output reg [1:0] Q;
output [1:0] Qb;

assign Qb=~Q;

always @(posedge CLK or negedge RSTn) begin

if(!RSTn)
    Q <= 2'b00;
else
    Q <= D;
end

endmodule