// tst_6502.v - test 6502 core
// 02-11-19 E. Brombaugh

module tst_6502(
    input clk,              // 4..0MHz CPU clock
    input reset,            // Low-true reset
    
	output reg [7:0] gpio_o,
	input [7:0] gpio_i,
	
	input RX,				// serial RX
	output TX,				// serial TX

	output sram_oe,
    input [7:0] sram_din,
    output [7:0] sram_dout,
    output [15:0] addr,
);
    // The 6502
    wire [15:0] CPU_AB;
    reg [7:0] CPU_DI;
    wire [7:0] CPU_DO;
    wire CPU_WE, CPU_IRQ;
    core ucpu(
        .clk(clk),
        .reset(reset),
        .AB(CPU_AB),
        .DI(CPU_DI),
        .DO(CPU_DO),
        .WE(CPU_WE),
        .IRQ(CPU_IRQ),
        .NMI(1'b0),
        .RDY(1'b1)
    );
    
	// address decode - not fully decoded for 512-byte memories
	wire p0 = (CPU_AB[15:12] == 4'h0) ? 1 : 0;
	wire p1 = (CPU_AB[15:12] == 4'h1) ? 1 : 0;
	wire p2 = (CPU_AB[15:12] == 4'h2) ? 1 : 0;
	wire pf = (CPU_AB[15:12] == 4'hf) ? 1 : 0;

	assign sram_oe = (CPU_WE == 1'b1) && (p0 == 1'b1);
	assign addr = CPU_AB;
	assign sram_dout = CPU_DO;

	// GPIO @ page 10-1f
	reg [7:0] gpio_do;
	always @(posedge clk)
		if((CPU_WE == 1'b1) && (p1 == 1'b1))
			gpio_o <= CPU_DO;
	    else
		    gpio_o <= {p0, pf, p1, CPU_DO[4:0]};

	// ROM @ pages f0,f1...
    reg [7:0] rom_mem[4095:0];
	reg [7:0] rom_do;
	initial
        $readmemh("rom.hex",rom_mem);
	always @(posedge clk)
		rom_do <= rom_mem[CPU_AB[11:0]];

	// data mux
	reg [3:0] mux_sel;
	always @(posedge clk)
		mux_sel <= CPU_AB[15:12];
	always @(*)
		casez(mux_sel)
			4'h0: CPU_DI = sram_din;
			default: CPU_DI = rom_do;
		endcase
endmodule
