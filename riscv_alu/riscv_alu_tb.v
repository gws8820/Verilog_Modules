`timescale 1ns / 100ps
`include "riscv_defines.v"

module riscv_alu_tb;

reg clk, rstb;
reg [31:0] alu_a_i, alu_b_i;
reg [3:0] alu_op_i;
wire [31:0] alu_p_o;

riscv_alu uut (
	.clk(clk),
	.rstb(rstb),
	.alu_op_i(alu_op_i),
	.alu_a_i(alu_a_i),
	.alu_b_i(alu_b_i),
	.alu_p_o(alu_p_o)
);

always #5 clk = ~clk;

initial begin
	rstb = 0;
	clk = 0;
	
	#20 rstb = 1;
	
	#40 alu_a_i = 32'h0;
			alu_b_i = 32'h0;
			alu_op_i = `ALU_SLT;
		
	#40 alu_a_i = 32'd2020;
			alu_b_i = 32'd2021;
			alu_op_i = `ALU_ADD;
	
	#40 alu_op_i = `ALU_SUB;
	#40 alu_op_i = `ALU_AND;
	#40 alu_op_i = `ALU_OR;
	#40 alu_op_i = `ALU_XOR;
	
	#40 $finish;
end

endmodule
