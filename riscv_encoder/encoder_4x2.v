module encoder_4x2(in, out);

output reg [1:0] out;
input [3:0] in;

always @* begin
    case (in)
        4'b0001: out <= 00;
        4'b0010: out <= 01;
        4'b0100: out <= 10;
        4'b1000: out <= 11;
        default: out <= 00;
    endcase
end

endmodule
