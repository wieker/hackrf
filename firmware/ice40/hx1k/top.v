`include "../common/shift.v"
`include "../common/counter.v"
`include "../common/ring.v"

module top(
    output led3
);

    wire clk;
    reg [23:0] counter;


    ringoscillator #(.DELAY_LUTS(200)) rng(clk);



    always @(posedge clk)
        begin
            counter <= counter + 1;
        end

    assign led3 = counter[20];

endmodule
