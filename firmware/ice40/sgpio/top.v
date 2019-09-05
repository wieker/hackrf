module top(
    output RGB0, RGB1, RGB2, IOB_0A, input SW0, SW1, SW2, IOB_6A, IOB_3B, IOB_2A
);

    wire clk;
    reg [7:0] r_reg;
    wire [7:0] r_next;

    SB_HFOSC inthosc (
        .CLKHFPU(1'b1),
        .CLKHFEN(1'b1),
        .CLKHF(clk)
    );

    assign RGB0 = ~SW0;
    assign RGB1 = ~SW1;
    assign RGB2 = ~IOB_6A;

    always @(posedge IOB_3B)
        begin
            if (~IOB_2A)
                r_reg <= r_next;
            else
                r_reg <= r_reg;
        end

    assign r_next = {IOB_6A, r_reg[7:1]};
    assign IOB_0A = r_reg[0];

endmodule
