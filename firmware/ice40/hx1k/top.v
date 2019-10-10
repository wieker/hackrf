`include "../common/shift.v"
`include "../common/counter.v"

module top(
    input  clk, led1, output led2, led3
);

    assign led2 = led1;
    assign led3 = clk;

endmodule
