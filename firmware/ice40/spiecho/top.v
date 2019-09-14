module top(
    output IOB_2A, input IOB_6A, IOB_0A, IOB_3B
);

    reg [7:0] r_reg;
    wire [7:0] r_next;

    always @(posedge IOB_0A)
        begin
            if (~IOB_6A)
                r_reg <= r_next;
            else
                r_reg <= r_reg;
        end

    assign r_next = {IOB_3B, r_reg[7:1]};
    assign IOB_2A = r_reg[0];

endmodule
