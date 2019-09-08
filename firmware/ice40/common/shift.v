module shift(input wire clk, input wire reset, input wire enable, input wire in, input wire[7:0] initial_value,
                output wire out);

    reg[7:0] shift_reg;
    wire[7:0] next_value;

    initial
    begin
        shift_reg <= 'hAA;
    end

    always @(posedge clk)
    begin
        shift_reg <= next_value;
    end

    assign next_value = {in, shift_reg[7:1]};
    assign out = shift_reg[0];

endmodule