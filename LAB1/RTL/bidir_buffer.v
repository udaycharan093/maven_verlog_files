// bidir_buffer.v
module bidir_buffer (
    input data_in,
    input enable,
    inout data_io
);
    // If enable is high, drive data_in onto data_io, else high impedance (Z)
    assign data_io = enable ? data_in : 1'bz;
endmodule

