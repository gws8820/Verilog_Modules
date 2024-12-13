`timescale 1ns/100ps

module testbench;

wire [15:0] out;
reg [3:0] in;

decoder_4bit uut (
  .in(in),
  .out(out)
);

always #10 in = in + 1;

initial begin
  // VCD 파일 생성
  $dumpfile("wave.vcd");
  $dumpvars(0, testbench);

  in = 0;

  // 시뮬레이션 종료
  #160 $finish;
end

endmodule