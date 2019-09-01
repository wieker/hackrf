module top(
    output RGB0, RGB1, RGB2, input SW0, SW1, SW2, IOB_6A
);

    wire clk;

    SB_HFOSC inthosc (
        .CLKHFPU(1'b1),
        .CLKHFEN(1'b1),
        .CLKHF(clk)
    );

    assign RGB0 = ~SW0;
    assign RGB1 = ~SW1;
    assign RGB2 = ~IOB_6A;

endmodule
