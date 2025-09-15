// mux4_1_decoder_tristate.v

// 2-to-4 decoder
module decoder_2x4 (
    input  [1:0] sel,
    output [3:0] dec
);
    assign dec = 1 << sel;
endmodule

// 4:1 mux using decoder and tri-state buffers
module mux4_1_decoder_tristate (
    input  [3:0] d,
    input  [1:0] sel,
    output       y
);
    wire [3:0] dec;
    wire [3:0] y_int;

    decoder_2x4 DEC (.sel(sel), .dec(dec));

    assign y_int = dec ? d : 1'bz;
    assign y_int[1] = dec[1] ? d[1] : 1'bz;
    assign y_int[2] = dec[2] ? d[2] : 1'bz;
    assign y_int = dec ? d : 1'bz;

    assign y = y_int | y_int[1] | y_int[2] | y_int;
endmodule

