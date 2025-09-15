// decoder_2x4.v
module decoder_2x4 (
    input [1:0] a,
    output [3:0] y
);

    // Dataflow abstraction for 2x4 decoder
    assign y = 1 << a;

endmodule

