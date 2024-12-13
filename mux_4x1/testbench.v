`timescale 1ns/100ps

module testbench;

wire [3:0] out;
reg [3:0] data3, data2, data1, data0;
reg [1:0] sel;
reg rstb;

mux_4x1 uut (
  .out(out),
  .rstb(rstb),
  .data3(data3),
  .data2(data2),
  .data1(data1),
  .data0(data0),
  .sel(sel)
);

always #20 sel = sel + 1;

initial begin
  // VCD 파일 생성
  $dumpfile("wave.vcd");
  $dumpvars(0, testbench);

  rstb = 0;
  #10 rstb = 1;

  sel = 0;
  data3 = 4'b1000;
  data2 = 4'b0100;
  data1 = 4'b0010;
  data0 = 4'b0001;

  #70 $finish;
end

endmodule