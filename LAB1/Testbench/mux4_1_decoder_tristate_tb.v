// mux4_1_decoder_tristate_tb.v
module mux4_1_decoder_tristate_tb;

    reg [3:0] d;
    reg [1:0] sel;
    wire y;
    integer i;

    mux4_1_decoder_tristate DUT (.d(d), .sel(sel), .y(y));

    initial begin
        $monitor("At time %t: d = %b, sel = %b -> y = %b", $time, d, sel, y);
        for (i = 0; i < 32; i = i + 1) begin
            {d, sel} = i;
            #10;
        end
        $finish;
    end

endmodule

