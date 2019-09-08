`include "../common/shift.v"
`include "../common/counter.v"

module top(
    output RGB0, RGB1, RGB2, ICE_SS, ICE_SCK, ICE_MOSI, input SW0, SW1, SW2, ICE_MISO
);

    wire clk;
    reg [23:0] osc_reg;
    reg [7:0] bits_cnt;
    wire clk_slow;

    SB_HFOSC inthosc (
        .CLKHFPU(1'b1),
        .CLKHFEN(1'b1),
        .CLKHF(clk)
    );

    wire outv;
    wire en1, en2;
    shift one_shift(clk_slow, 0, en1 && ~en2, outv, 'hAA, outv);
    counter one_counter(clk_slow, 'h00ff, 0, en1);
    counter two_counter(clk_slow, 'h01ff, 0, en2);

    always @(posedge clk)
        begin
            osc_reg <= osc_reg + 1;
        end

    assign clk_slow = osc_reg[19];

    assign RGB0 = ~SW0;
    assign RGB1 = ~SW1;
    assign RGB2 = ~SW2;

    always @(posedge clk_slow)
        begin
            bits_cnt <= bits_cnt + 1;
        end

    assign ICE_MOSI = en1 && ~en2;
    assign ICE_SCK = clk_slow;
    assign ICE_SS = ~en1 || en2;

endmodule
