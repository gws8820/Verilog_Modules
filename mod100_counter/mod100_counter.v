module mod100_counter (d1, d0, clk, rstb);

output reg [3:0] d1, d0;
input clk, rstb;

always @ (posedge clk or negedge rstb) begin
    if (!rstb) begin
        d1 <= 0;
        d0 <= 0;
    end
    else if (d1 == 9) begin
        if (d0 == 9) begin
            d1 <= 0;
            d0 <= 0;
        end
        else
            d0 <= d0 + 1;
    end
    else begin
        if (d0 == 9) begin
            d1 <= d1 + 1;
            d0 <= 0;
        end
        else begin
            d0 <= d0 + 1;
        end
    end
end


endmodule