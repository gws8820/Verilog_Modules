`include "../riscv_defines.v"

module riscv_alu(clk, rstb, alu_op_i, alu_a_i, alu_b_i, alu_p_o);

input clk, rstb;
input [3:0] alu_op_i;
input [31:0] alu_a_i;
input [31:0] alu_b_i;
output reg [31:0] alu_p_o;

wire [31:0] shift_out;
reg [1:0] shift_type;

riscv_barrel_shifter shift(
	.data_in(alu_a_i),
	.size(alu_b_i),
	.type(shift_type),
	.data_out(shift_out)
);

always @(posedge clk or negedge rstb) begin
	if(!rstb) begin
		alu_p_o <= 32'b0;
		shift_type <= 2'b00;
	end
	else begin
		case(alu_op_i)
			`ALU_ADD:	alu_p_o = alu_a_i + alu_b_i;
			`ALU_SUB:	alu_p_o = alu_a_i - alu_b_i;
			`ALU_AND:	alu_p_o = alu_a_i & alu_b_i;
			`ALU_OR:	alu_p_o = alu_a_i | alu_b_i;
			`ALU_XOR:	alu_p_o = alu_a_i ^ alu_b_i;
			`ALU_SLT: 	alu_p_o = $signed(alu_a_i) < $signed(alu_b_i) ? 1 : 0;
			`ALU_SLTU: 	alu_p_o = alu_a_i < alu_b_i ? 1 : 0;
			`ALU_SLL: 	begin
							shift_type=2'b00;
							alu_p_o = shift_out;
						end
			`ALU_SRL: 	begin
							shift_type=2'b01;
							alu_p_o = shift_out;
						end
			`ALU_SRA: 	begin
							shift_type=2'b10;
							alu_p_o = shift_out;
						end
			`ALU_MULL: alu_p_o = alu_a_i * alu_b_i;
			`ALU_MULH: alu_p_o = ($signed(alu_a_i) * $signed(alu_b_i)) >>> 32;
			`ALU_DIV: alu_p_o = $signed(alu_a_i) / $signed(alu_b_i);
			`ALU_REM: alu_p_o = $signed(alu_a_i) % $signed(alu_b_i);
			`ALU_AUIPC: alu_p_o = alu_a_i + (alu_b_i << 20);
			`ALU_IDLE: alu_p_o = 32'd0;
			default: alu_p_o = 32'b0;
		endcase
	end
end

endmodule
