`include "../common/shift.v"
`include "../common/counter.v"

module top(
    input  clk, output led1, led2, led3
);

    reg [23:0] led1_reg;
    reg [23:0] led2_reg;
    reg [23:0] led3_reg;

    always @(posedge clk) begin
        led1_reg <= led1_reg + 1;
        led2_reg <= led2_reg + 1;
        led3_reg <= led3_reg + 1;
    end

    assign led1 = led1_reg[23];
    assign led2 = ~led1_reg[21];
    assign led3 = led1_reg[22];

endmodule
