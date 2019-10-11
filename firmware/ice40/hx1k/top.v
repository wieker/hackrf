`include "../common/shift.v"
`include "../common/counter.v"

module top(
    output led3
);

    wire clk;
    reg [23:0] counter;

    rng rng(1, clk);



    always @(posedge clk)
        begin
            counter <= counter + 1;
        end

    assign led3 = counter[8];

endmodule

module rng(start, r_out);
input start /* synthesis keep */;
reg rout /* synthesis keep */;
output r_out;
wire n0 /* synthesis keep */;
wire n1 /* synthesis keep */;
wire n2 /* synthesis keep */;
wire n3 /* synthesis keep */;
wire n4 /* synthesis keep */;
wire n5 /* synthesis keep */;
wire n6 /* synthesis keep */;
and a(n6,r0,start);
mynot x1(n6,n0);
mynot x2(n0,n1);
mynot x3(n1,n2);
mynot x4(n2,n3);
mynot x5(n3,n4);
mynot x6(n4,n5);
mynot x7(n5,r_out);
endmodule

module mynot(
    input x,
    output wire y
    );
    not(y,x);
endmodule
