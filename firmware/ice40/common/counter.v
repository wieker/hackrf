module counter(input wire clk, input wire[7:0] value, input restart,
    output wire out);
    reg[7:0] counter_reg;
    reg out_reg;
    reg keep;

    always @(posedge clk)
    begin
        if (counter_reg == value)
            begin
                if (restart)
                    begin
                        counter_reg <= 0;
                        out_reg <= ~out_reg;
                        keep <= 0;
                    end
                else
                    begin
                        if (~keep) begin
                            counter_reg <= counter_reg;
                            out_reg <= ~out_reg;
                            keep <= 1;
                        end else begin
                            counter_reg <= counter_reg;
                            out_reg <= out_reg;
                            keep <= keep;
                        end
                    end
            end
        else
            begin
                counter_reg <= counter_reg + 1;
            end
    end

    assign out = out_reg;

endmodule