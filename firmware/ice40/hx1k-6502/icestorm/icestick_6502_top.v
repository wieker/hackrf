`include "../../common/ring.v"

// icestick_6502_top.v - top level for tst_6502 on an icestick
// 03-02-19 E. Brombaugh

module icestick_6502_top(
	input  RX,
	output TX,
	output LED1
);
	// reset generator waits > 10us
	reg [7:0] reset_cnt;
	reg reset;
    wire clk;
	initial
        reset_cnt <= 8'h00;

    ringoscillator #(.DELAY_LUTS(200)) rng(clk);
    
	always @(posedge clk)
	begin
		if(reset_cnt != 8'hff)
        begin
            reset_cnt <= reset_cnt + 8'h01;
            reset <= 1'b1;
        end
        else
            reset <= 1'b0;
	end
    
	// test unit
	wire [7:0] gpio_o, gpio_i;
	assign gpio_i = 8'h00;
	tst_6502 uut(
		.clk(clk),
		.reset(reset),
		
		.gpio_o(gpio_o),
		.gpio_i(gpio_i),
		
		.RX(RX),
		.TX(TX)
	);
    
	// drive LEDs from GPIO
	assign {LED1} = gpio_o[7:7];
endmodule
