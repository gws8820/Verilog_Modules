`timescale 1ns/100ps

module testbench;

reg a, b;
wire sum, carry;

half_adder uut (
  .a(a),
  .b(b),
  .sum(sum),
  .carry(carry)
);

always
  #10 a = ~a;

always
  #5 b = ~b;

initial begin
  // VCD 파일 생성
  $dumpfile("wave.vcd");
  $dumpvars(0, testbench);

  a = 0;
  b = 0;

  // 시뮬레이션 종료
  #20 $finish;
end

endmodule