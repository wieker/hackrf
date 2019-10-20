`include "../common/shift.v"
`include "../common/counter.v"
`include "../common/ring.v"

module top(
    output led1, led2, led3, tx, input rx
);

    wire clk;
    reg [20:0] counter;
    wire [21:0] next = counter + 1;

    wire tmp, tmp2;
    reg [7:0] dt = 8'h3f;
    wire [7:0] dtwire;
    wire int;
    reg [7:0] cmd = 0;
    reg [2:0] leds = 0;

    ringoscillator #(.DELAY_LUTS(200)) rng(clk);



    always @(posedge clk)
        begin
            counter <= next;
            if (int)
                dt <= dtwire;
            if (int)
                cmd <= dtwire;
            else
                cmd <= 0;
        end

    assign led1 = leds[0];
    assign led2 = leds[1];
    assign led3 = leds[2];

    uart_tx uart_tx(clk, 1, next[21], dt, tmp, tmp2);
    uart_rx uart_rx(clk, 1, rx, int, dtwire);
    assign tx = tmp;
    always @(posedge clk)
        begin
            if (cmd == 8'h3f)
                leds[0] <= 1;
        end

endmodule
