`include "../common/shift.v"
`include "../common/counter.v"
`include "../common/ring.v"

module top(

    inout BTN1, BTN2, BTN3, BTN4,
    output led1, led2, led3, led4, led5, led6, led7, led8, led9
);

    wire clk;
    reg [20:0] counter;
    wire [21:0] next = counter + 1;

    wire capsense_oe;
    wire [3:0] capsense_in;

    reg sense;

    ringoscillator #(.DELAY_LUTS(20)) rng(clk);

    always @(posedge clk)
        begin
            counter <= next;
            if (counter == 24'h 80000) sense <= 0;
            if (counter == 24'h 80010) sense <= capsense_in[0];
        end

    assign led1 = 0;
    assign led2 = capsense_in[0];
    assign led3 = sense;
    assign led7 = 0;
    assign led9 = counter[20];

    assign capsense_oe = counter == 24'h 80000;

  SB_IO #(
      .PIN_TYPE(6'b1010_01),
      .PULLUP(1'b0)
  ) buts [3:0] (
      .PACKAGE_PIN({BTN1,BTN2,BTN3,BTN4}),
      .OUTPUT_ENABLE({capsense_oe, capsense_oe, capsense_oe, capsense_oe}),
      .D_OUT_0(4'b0),
      .D_IN_0(capsense_in)
);

endmodule

module CapSense #(
  parameter N=4  // How many buttons
) (
  input          clk_i,      // System clock
  input          rst_i,      // System reset
  input          ena_i,      // Frequency used to sample the buttons
  input          start_i,    // Start a sampling sequence
  input  [N-1:0] buttons_i,  // Buttons inputs
  output         buttons_oe, // Buttons OE
  output [N-1:0] sampled_o,  // Last sample result
  output [N-1:0] debug_o);   // Used to measure the button timing

// FSM states
localparam IDLE=0, SAMPLING=1, DO_SAMPLE=2;
// Some constants
localparam ALL_1={N{1'b1}};
reg [1:0]   state=IDLE;
reg [N-1:0] btns_r;

// Keep the capacitors discharged while we are idle
assign buttons_oe=state==IDLE ? 1 : 0;
// Used to measure the buttons timing
assign debug_o=state==IDLE ? ALL_1 : buttons_i;

always @(posedge clk_i)
begin : do_fsm
  if (rst_i)
     begin
     state=IDLE;
     btns_r=0;
     end
  else
     begin
     case (state)
          IDLE:
             if (start_i)
                state=SAMPLING;
          SAMPLING:
             // Sample the capacitors at the ena_i rate
             // If any of the capacitors is charged stop waiting
             if (ena_i && buttons_i)
                state=DO_SAMPLE;
          default: // DO_SAMPLE
              // We wait 1 more cycle to mask small differences between
              // buttons. Pressed buttons have big differeneces.
              if (ena_i) // For debug: && buttons_i==ALL_1
                 begin
                 // The "pressed" buttons are the ones that stay charging
                 btns_r=~buttons_i;
                 state=IDLE;
                 end
     endcase
     end
  end
endmodule

module CapSense_Sys #(
  parameter DIRECT=1,     // Direct status, else: toggle
  parameter FREQUENCY=24, // Clock in MHz
  parameter N=4           // How many buttons
) (
  input          clk_i,       // System clock
  input          rst_i,       // System reset
  input  [N-1:0] capsense_i,  // Buttons inputs
  output         capsense_oe, // Buttons OE
  output [N-1:0] buttons_o,   // Last sample result
  output [N-1:0] debug_o      // Used to measure the button timing
);

localparam integer MOD_SAMP=FREQUENCY/1.5;
localparam integer MOD_BITS=$clog2(MOD_SAMP);

// CapSense sampling rate
wire clkSamp;
reg [MOD_BITS-1:0] cntSamp=0;
// CapSese polling rate
wire clkPoll;
reg [16:0] cntPoll=0;
// Buttons
wire [N-1:0] cur_btns;
reg  [N-1:0] prev_btn_r=0;
reg  [N-1:0] cur_btn_r=0;

// 1.5 MHz capacitors sample
always @(posedge clk_i)
  if (cntSamp==MOD_SAMP-1)
     cntSamp=0;
  else
     cntSamp=cntSamp+1;
assign clkSamp=!cntSamp ? 1 : 0;

// aprox. 87 ms
always @(posedge clk_i)
  if (clkSamp)
     cntPoll=cntPoll+1;
assign clkPoll=!cntPoll ? 1 : 0;

CapSense #(.N(N)) TheCS
  (.clk_i(clk_i), .rst_i(rst_i),
   .ena_i(clkSamp),
   .start_i(clkPoll),
   .buttons_i(capsense_i),
   .buttons_oe(capsense_oe),
   .sampled_o(cur_btns),
   .debug_o(debug_o));

integer i;
always @(posedge clk_i)
begin
  for (i=0; i<4; i=i+1)
      if (!prev_btn_r[i] && cur_btns[i]) // pressed?
         cur_btn_r[i]=~cur_btn_r[i]; // toggle
  prev_btn_r=cur_btns;
end

assign buttons_o=DIRECT ? cur_btns : cur_btn_r;

endmodule
