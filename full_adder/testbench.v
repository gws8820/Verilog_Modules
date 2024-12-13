`timescale 1ns/100ps

module testbench;

wire c_out, sum;
reg a, b, c_in;

full_adder uut (
  .a(a),
  .b(b),
  .c_in(c_in),
  .c_out(c_out),
  .sum(sum)
);

always #40 c_in = c_in +1;
always #20 a <= a + 1;
always #10 b = b + 1;

initial begin
  // VCD 파일 생성
  $dumpfile("wave.vcd");
  $dumpvars(0, testbench);

  a = 0;
  b = 0;
  c_in = 0;

  // 시뮬레이션 종료
  #100 $finish;
end

endmodule