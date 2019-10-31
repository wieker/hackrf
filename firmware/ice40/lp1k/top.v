`include "../common/shift.v"
`include "../common/counter.v"
`include "../common/ring.v"

module top(
    output led1, led2, led3
);

    wire clk;
    reg [21:0] counter;

    ringoscillator #(.DELAY_LUTS(200)) rng(clk);



    always @(posedge clk)
        begin
            counter <= counter + 1;
        end

    assign led1 = counter[19];
    assign led2 = counter[20];
    assign led3 = counter[21];

endmodule
