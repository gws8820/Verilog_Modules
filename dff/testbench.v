`timescale 1ns/1ns

module testbench;

wire [1:0] Q;
wire [1:0] Qb;
reg [1:0] D;
reg CLK;
reg RSTn;

dff uut (
  .D(D),
  .RSTn(RSTn),
  .CLK(CLK),
  .Q(Q),
  .Qb(Qb)
);

always #5 CLK = ~CLK;
always #10 D = D + 1;

initial begin
  // VCD 파일 생성
  $dumpfile("wave.vcd");
  $dumpvars(0, testbench);

  CLK = 0;
  RSTn = 0;
  D = 2'b00;

  #10 RSTn = 1;

  // 시뮬레이션 종료
  #100 $finish;
end

endmodule