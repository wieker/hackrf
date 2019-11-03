`include "../common/shift.v"
`include "../common/counter.v"
`include "../common/ring.v"

module top(
    output led1, led2, led3, led4, led5, led6, led7, led8, led9, tx, input rx
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
        end

    assign led1 = leds[0];
    assign led2 = leds[1];
    assign led3 = leds[2];
    assign led4 = leds[0];
    assign led5 = leds[1];
    assign led6 = leds[2];
    assign led7 = leds[0];
    assign led8 = leds[1];
    assign led9 = leds[2];

    always @(posedge clk)
        begin
             leds <= counter[20:18];
        end

endmodule
