module encoder_4bit(out, in);

output reg [3:0] out;
input [15:0] in;

always @* begin
    for (integer i=0; i<16; i=i+1) begin
        if (in[i] == 1)
            out <= i;
    end
end
endmodule