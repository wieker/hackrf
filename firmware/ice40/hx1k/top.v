`include "../common/shift.v"
`include "../common/counter.v"
`include "../common/ring.v"

module top(
    output led1, led2, led3, tx, input rx
);

    wire clk;
    reg [20:0] counter;
    wire [21:0] next = counter + 1;

    wire tmp;
    reg [7:0] dt = 8'h3f;
    wire [7:0] dtwire;
    wire int;

    ringoscillator #(.DELAY_LUTS(200)) rng(clk);



    always @(posedge clk)
        begin
            counter <= next;
            if (int)
                dt <= dtwire;
        end

    assign led1 = next[20];
    assign led2 = next[19];

    uart_tx uart_tx(clk, 1, next[21], dt, tmp, led3);
    uart_rx uart_rx(clk, 1, rx, int, dtwire);
    assign tx = tmp;

endmodule
