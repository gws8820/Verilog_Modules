`include "riscv_defines.v"
`timescale 1ns / 100ps

module riscv_seq_multiplier_tb;

reg rstn, clk;
reg [3:0] alu_op_i;
reg [31:0] alu_a_i, alu_b_i;
reg a_signed, b_signed;
wire [63:0] alu_p_o_f;
wire ex_stall_mul_w_f;

riscv_seq_multiplier multiplier(
	.clk_i(clk),
	.rstn_i(rstn),
	.id_alu_op_r(alu_op_i),
	.id_a_signed_r(a_signed),
	.id_b_signed_r(b_signed),
	.id_ra_value_r(alu_a_i),
	.id_rb_value_r(alu_b_i),
	.mul_res_r(alu_p_o_f),
	.ex_stall_mul_w(ex_stall_mul_w_f)
);

always #1 clk = ~clk;

initial begin
	rstn = 0;
	clk = 0;

	alu_a_i = 0;
	alu_b_i = 0;
	alu_op_i = 0;
	a_signed = 0;
	b_signed = 0;
	alu_op_i = `ALU_ADD;
	
	#20	rstn = 1;
	
	#20	alu_a_i = 32'h00000008;
			alu_b_i = 32'h00000008;
			
	#20	alu_op_i = `ALU_MULL;
	
	#50	alu_op_i = `ALU_ADD;
	
	#20	alu_a_i = 32'h00000007;
			alu_b_i = 32'h00000009;
			
	#20	alu_op_i = `ALU_MULL;
	
	#50 	alu_op_i = `ALU_ADD;
	
	#60 $finish;
end

endmodule
