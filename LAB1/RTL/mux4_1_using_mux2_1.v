// mux4_1_using_mux2_1.v
module mux2_1 (
    input a,
    input b,
    input sel,
    output y
);
    assign y = sel ? b : a;
endmodule

module mux4_1_using_mux2_1 (
    input [3:0] d,
    input [1:0] sel,
    output y
);
    wire y0, y1;

    // First stage: two 2:1 muxes
    mux2_1 M0 (.a(d), .b(d[1]), .sel(sel), .y(y0));
    mux2_1 M1 (.a(d[2]), .b(d), .sel(sel), .y(y1));
    // Second stage: one 2:1 mux
    mux2_1 M2 (.a(y0), .b(y1), .sel(sel[1]), .y(y));
endmodule

