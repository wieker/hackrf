module top(
    output RGB0, RGB1, RGB2, IOB_0A, input SW0, SW1, SW2, IOB_6A, IOB_3B, IOB_2A
);

    wire clk;
    reg [7:0] r_reg;

    SB_HFOSC inthosc (
        .CLKHFPU(1'b1),
        .CLKHFEN(1'b1),
        .CLKHF(clk)
    );

    always @(posedge clk)
        begin
                r_reg <= r_reg + 1;
        end

    assign IOB_0A = r_reg[7];

endmodule
