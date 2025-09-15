/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
All Rights Reserved.
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is not to be shared with or used by any third parties who have not enrolled for our paid training 
courses or received any written authorization from Maven Silicon.
Webpage     :      www.maven-silicon.com
Filename    :	   full_adder.v   
Description :      One bit Full adder Design
Author Name :      Susmita
Version     : 	   1.0
*********************************************************************************************/

module full_adder (
    input  a_in,        // Step1: Port directions
    input  b_in,
    input  c_in,
    output sum_out,
    output carry_out
);

    // Step2: Internal wires
    wire ha1_sum, ha1_carry;
    wire ha2_carry;

    // Step3: Instantiate Half-Adders using name-based port mapping
    half_adder HA1 (
        .a(a_in),
        .b(b_in),
        .sum(ha1_sum),
        .carry(ha1_carry)
    );

    half_adder HA2 (
        .a(ha1_sum),
        .b(c_in),
        .sum(sum_out),
        .carry(ha2_carry)
    );

    // Step4: Instantiate OR gate for carry_out
    or (carry_out, ha1_carry, ha2_carry);

endmodule

// Half Adder module definition (for completeness)
module half_adder (
    input a,
    input b,
    output sum,
    output carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

