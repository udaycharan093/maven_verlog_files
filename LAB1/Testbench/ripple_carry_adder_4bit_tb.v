// ripple_carry_adder_4bit_tb.v
module ripple_carry_adder_4bit_tb;

    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;
    integer i;

    ripple_carry_adder_4bit DUT (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        $monitor("At time %t: a = %b, b = %b, cin = %b -> sum = %b, cout = %b", $time, a, b, cin, sum, cout);
        for (i=0; i<32; i=i+1) begin
            {a, b, cin} = i;
            #10;
        end
        $finish;
    end

endmodule

