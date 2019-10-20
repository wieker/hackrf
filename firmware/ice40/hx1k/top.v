`include "../common/shift.v"
`include "../common/counter.v"
`include "../common/ring.v"

module top(
    output led1, led2, led3, tx, input rx
);

    wire clk;
    reg [20:0] counter;
    wire [21:0] next = counter + 1;


    ringoscillator #(.DELAY_LUTS(200)) rng(clk);



    always @(posedge clk)
        begin
            counter <= next;
        end

    assign led1 = next[20];
    assign led2 = next[19];
    wire tmp;

    uart_tx uart_tx(clk, 1, next[21], 8'h3f, tmp, led3);
    assign tx = tmp;

endmodule
