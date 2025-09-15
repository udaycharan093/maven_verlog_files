// decoder_2x4_tb.v
module decoder_2x4_tb;

    reg [1:0] a;
    wire [3:0] y;
    integer i;

    decoder_2x4 DUT (.a(a), .y(y));

    initial begin
        $monitor("At time %t: a = %b, y = %b", $time, a, y);
        for (i = 0; i < 4; i = i + 1) begin
            a = i;
            #10;
        end
        $finish;
    end

endmodule

