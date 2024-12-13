`define CLOCK_PERIOD 10
`timescale 1ns/10ps

module riscv_down_counter_tb;

wire [5:0] cnt;
wire oflag;
reg clk, ena;
reg [5:0] din;

riscv_down_counter uut(
    .clk(clk), 
    .din(din),
    .ena(ena),
    .cnt(cnt),
    .oflag(oflag)
);

always #(`CLOCK_PERIOD/2) clk = ~clk;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, counter_tb);

    din = 6'd0;
    ena = 1'd0;
    clk = 0;
    
    #(`CLOCK_PERIOD * 5) din = 6'd8;
    ena = 1'd1;
    #(`CLOCK_PERIOD) ena = 1'd0;
    
    #(`CLOCK_PERIOD * 10) din = 6'd16;
    ena = 1'd1;
    #(`CLOCK_PERIOD) ena = 1'd0;

    #(`CLOCK_PERIOD * 20) $finish;
end

endmodule
