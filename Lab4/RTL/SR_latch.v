// Assignment 1 asks to write the RTL (Register Transfer Level) code and Testbench for an SR latch using gate-level modeling. 
module SR_latch (input  S,R 
                output  Q , Qbar );

// Gate-level modeling using NOR gates

nor (Q , R , Qbar) //Q=~(R + Qbar)

nor (Q , S , Qbar) // Q= ~(S + Q)

end module
