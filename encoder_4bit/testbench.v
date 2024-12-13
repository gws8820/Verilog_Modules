`timescale 1ns/100ps

module testbench;

wire [3:0] out;
reg [15:0] in;

encoder_4bit uut (
    .out(out),
    .in(in)
);

always #10 begin
    in = in << 1;
end

initial begin  
    $dumpfile("wave.vcd");
    $dumpvars(0, testbench);
    
    in = 1;

    #160 $finish;
end


endmodule