`timescale 1ns/100ps

module testbench;

wire [3:0] d1, d0;
reg clk, rstb;

mod100_counter uut(
    .d1(d1),
    .d0(d0),
    .clk(clk),
    .rstb(rstb)
);

always #10 clk = ~clk;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench);

    rstb = 0;
    clk = 0;

    #80 rstb = 1;

    #1000 $finish;
end

endmodule