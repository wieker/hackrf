`include "../common/shift.v"
`include "../common/counter.v"

module top(
    inout  sram_io, output sram_cs, sram_oe, sram_we
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

    wire sram_oe, sram_in, sram_out;

    shift one_shift(clk_slow, 0, en1 && ~en2, 0, 'hAA, outv);
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

    assign ICE_MOSI = outv;
    assign ICE_SCK = clk_slow;
    assign ICE_SS = ~en1 || en2;

    SB_IO #(
        .PIN_TYPE(6'b 1010_01),
        .PULLUP(1'b 0)
    ) sram_io (
        .PACKAGE_PIN({sram_io}),
        .OUTPUT_ENABLE({sram_oe}),
        .D_OUT_0({sram_out}),
        .D_IN_0({sram_in})
    );

endmodule
