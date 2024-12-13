module mux_4x1(rstb, data3, data2, data1, data0, sel, out);

output reg [3:0] out;
input [3:0] data3, data2, data1, data0;
input [1:0] sel;
input rstb;

always @ (sel or negedge rstb) begin
    if (!rstb)
        out <= 4'bx;

    else begin
        case(sel)
            2'b00: out <= data3;
            2'b01: out <= data2;
            2'b10: out <= data1;
            2'b11: out <= data0;
            default: out <= 4'bx;
        endcase
    end
end


endmodule