// priority_encoder_8x3.v
module priority_encoder_8x3 (
    input  [7:0] in,
    output reg [2:0] out
);

    // Structural/behavioral abstraction using case statement
    always @(*) begin
        casex (in)
            8'b1xxxxxxx: out = 3'd7;
            8'b01xxxxxx: out = 3'd6;
            8'b001xxxxx: out = 3'd5;
            8'b0001xxxx: out = 3'd4;
            8'b00001xxx: out = 3'd3;
            8'b000001xx: out = 3'd2;
            8'b0000001x: out = 3'd1;
            8'b00000001: out = 3'd0;
            default:     out = 3'd0; // no input is high
        endcase
    end

endmodule

