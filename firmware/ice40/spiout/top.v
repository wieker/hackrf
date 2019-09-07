module top(
    output RGB0, RGB1, RGB2, IOB_0A, IOB_6A, IOB_3B, input SW0, SW1, SW2, IOB_2A
);

    wire clk;
    reg [7:0] r_reg;
    wire [7:0] r_next;
    reg [23:0] osc_reg;
    wire clk_slow;
    reg [2:0] counter8;
    reg [7:0] stage;

    SB_HFOSC inthosc (
        .CLKHFPU(1'b1),
        .CLKHFEN(1'b1),
        .CLKHF(clk)
    );

    always @(posedge clk)
        begin
            osc_reg <= osc_reg + 1;
        end

    assign clk_slow = osc_reg[23];

    assign RGB0 = ~SW0;
    assign RGB1 = ~SW1;
    assign RGB2 = ~SW2;

    always @(posedge clk_slow)
        begin
            if (IOB_2A)
                r_reg <= stage;
            else
                r_reg <= r_next;
        end

    always @(posedge clk_slow)
        begin
            counter8 <= counter8 + 1;
        end

    always @(posedge clk_slow)
        begin
            stage <= stage + (counter8 == 'b111);
        end

    assign r_next = {r_reg[6:0], r_reg[7]};
    assign IOB_6A = r_reg[7];
    assign IOB_0A = clk_slow;
    assign IOB_3B = 0;

endmodule
