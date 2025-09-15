module tb_priority_encoder;
  reg [7:0] i;
  wire [2:0] y;

  priority_encoder_8to3 dut (.i(i), .y(y));

  initial begin
    $monitor("Input = %b, Output = %b", i, y);

    // Test each single one-hot input
    i = 8'b00000001; #10;
    i = 8'b00000010; #10;
    i = 8'b00000100; #10;
    i = 8'b00001000; #10;
    i = 8'b00010000; #10;
    i = 8'b00100000; #10;
    i = 8'b01000000; #10;
    i = 8'b10000000; #10;

    // Multiple bits high, highest priority only
    i = 8'b10001001; #10;
    i = 8'b00110000; #10;
    i = 8'b00000000; #10;

    $finish;
  end
endmodule

