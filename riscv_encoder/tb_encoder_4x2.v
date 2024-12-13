`timescale 1ns / 1ps

module tb_encoder_4x2;

wire [1:0] out;
reg  [3:0] in;

Encoder_4x2 uut (.in(in), .out(out));

initial begin
#20 in = 4'b0001;
#20 in = 4'b0010;
#20 in = 4'b0100;
#20 in = 4'b1000;

#20 $finish;
end

endmodule