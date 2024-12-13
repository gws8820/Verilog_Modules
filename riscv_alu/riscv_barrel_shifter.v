module riscv_barrel_shifter(data_in, size, type, data_out);

input [31:0] data_in;
input [3:0] size;
input [1:0] type;
output reg [31:0] data_out;

always @* begin
    data_out = data_in;

    if (type == 2'b00) begin // SLL
        if (size[3]) data_out = data_out << 8;
        if (size[2]) data_out = data_out << 4;
        if (size[1]) data_out = data_out << 2;
        if (size[0]) data_out = data_out << 1;
    end
    else if (type == 2'b01) begin // SRL
        if (size[3]) data_out = data_out >> 8;
        if (size[2]) data_out = data_out >> 4;
        if (size[1]) data_out = data_out >> 2;
        if (size[0]) data_out = data_out >> 1;
    end
    else if (type == 2'b10) begin // SRA
        if (size[3]) data_out = data_out >>> 8;
        if (size[2]) data_out = data_out >>> 4;
        if (size[1]) data_out = data_out >>> 2;
        if (size[0]) data_out = data_out >>> 1;
    end
end

endmodule
