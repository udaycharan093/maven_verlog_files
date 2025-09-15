// ripple_carry_adder_4bit.v
module ripple_carry_adder_4bit (
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] sum,
    output       cout
);

    wire c1, c2, c3;

    full_adder FA0 (.a_in(a), .b_in(b), .c_in(cin),  .sum_out(sum), .carry_out(c1));
    full_adder FA1 (.a_in(a[1]), .b_in(b[1]), .c_in(c1),   .sum_out(sum[1]), .carry_out(c2));
    full_adder FA2 (.a_in(a[2]), .b_in(b[2]), .c_in(c2),   .sum_out(sum[2]), .carry_out(c3));
    full_adder FA3 (.a_in(a), .b_in(b), .c_in(c3),   .sum_out(sum), .carry_out(cout));

endmodule

// 1-bit full adder module (reuse from previous assignment)
module full_adder (
    input  a_in,
    input  b_in,
    input  c_in,
    output sum_out,
    output carry_out
);
    assign sum_out   = a_in ^ b_in ^ c_in;
    assign carry_out = (a_in & b_in) | (b_in & c_in) | (a_in & c_in);
endmodule

