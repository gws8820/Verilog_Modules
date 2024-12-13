module riscv_down_counter(clk, din, ena, cnt, oflag);

output reg [5:0] cnt;
output reg oflag;
input clk, ena;
input [5:0] din;

always @ (posedge clk) begin
    if (cnt != 0)
        cnt <= cnt - 1;
    else if (ena)
        cnt <= din;

    oflag <= (cnt == 6'b000001 ? 1'b1 : 0);
end

endmodule
