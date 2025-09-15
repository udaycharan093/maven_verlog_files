// priority_encoder_8x3_tb.v
module priority_encoder_8x3_tb;

    reg [7:0] in;
    wire [2:0] out;
    integer i;

    priority_encoder_8x3 DUT (.in(in), .out(out));

    initial begin
        $monitor("At time %t: in = %b, out = %d", $time, in, out);
        for (i = 1; i < 256; i = i << 1) begin
            in = i;
            #10;
        end
        
        // Test some multiple-high cases
        in = 8'b01001100; #10;
        in = 8'b00010011; #10;
        in = 8'b10000001; #10;

        $finish;
    end

endmodule

