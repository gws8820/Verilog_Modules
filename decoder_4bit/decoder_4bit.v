module decoder_4bit(out, in);
output reg [15:0] out;
input [3:0] in;

always @* begin
    out = 16'b0;
    out[in] = 1;
end

endmodule