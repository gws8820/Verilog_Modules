`include "../riscv_defines.v"

module riscv_seq_multiplier(
	input clk_i, 
	input rstn_i,  
	input [3:0] id_alu_op_r, 
	input id_a_signed_r,
	input id_b_signed_r,
	input [31:0] id_ra_value_r,
	input [31:0] id_rb_value_r,
	output reg [63:0] mul_res_r,
	output ex_stall_mul_w
);

wire mul_request_w;
reg mul_busy_r, mul_ready_r;
reg [4:0] mul_count_r;
reg [63:0] mul_sum_w;

assign mul_request_w = (id_alu_op_r == `ALU_MULL);
assign ex_stall_mul_w = mul_busy_r;

always @ (posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) begin
        mul_busy_r <= 1'b0;
        mul_ready_r <= 1'b0;
        mul_count_r <= 5'b0;
        mul_res_r <= 64'b0;
    end else begin
        if (mul_busy_r) begin
            mul_sum_w = { 1'b0, mul_res_r[63:32] } + (mul_res_r[0] ? id_rb_value_r : 32'b0);
            mul_res_r <= { mul_sum_w, mul_res_r[31:1] };
            mul_count_r <= mul_count_r - 1;
            
            if (mul_count_r == 5'd0) begin
                mul_busy_r <= 1'b0;
                mul_ready_r <= 1'b1;
            end
        end else if (mul_ready_r) begin
            mul_ready_r <= 1'b0;
        end else if (mul_request_w) begin
            mul_count_r <= 5'd31;
            mul_busy_r <= 1'b1;
            mul_res_r <= { 32'b0, id_ra_value_r };
        end
    end
end

endmodule
