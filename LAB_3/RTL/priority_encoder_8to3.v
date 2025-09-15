module priority_encoder_8to3 (
  input [7:0] i,        // 8 inputs
  output reg [2:0] y    // 3-bit output
);
  always @(*) begin
    if (i[7])      y = 3'b111;
    else if (i[6]) y = 3'b110;
    else if (i[5]) y = 3'b101;
    else if (i[4]) y = 3'b100;
    else if (i[3]) y = 3'b011;
    else if (i[2]) y = 3'b010;
    else if (i[1]) y = 3'b001;
    else if (i[0]) y = 3'b000;
    else           y = 3'b000;  // Default when no input is high
  end
endmodule

