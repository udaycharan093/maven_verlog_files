// bidir_buffer_tb.v
module bidir_buffer_tb;

    reg data_in;
    reg enable;
    wire data_io;
    integer i;

    // Instantiate bidirectional buffer
    bidir_buffer DUT (.data_in(data_in), .enable(enable), .data_io(data_io));

    initial begin
        $monitor("At time %t: data_in = %b, enable = %b, data_io = %b", $time, data_in, enable, data_io);
        // Sweep all combinations of data_in and enable
        for (i=0; i<4; i=i+1) begin
            {data_in, enable} = i;
            #10;
        end
        $finish;
    end

endmodule

