module top(
    output ICE_SS, ICE_SCK, ICE_MOSI, IOB_2A, input IOB_6A, IOB_0A, IOB_3B, ICE_MISO
);

    assign ICE_SS = IOB_6A;
    assign ICE_SCK = IOB_0A;
    assign ICE_MOSI = IOB_3B;
    assign IOB_2A = ICE_MISO;

endmodule
