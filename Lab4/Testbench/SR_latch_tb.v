//TEST BENCH 

module SR_latch_tb ( reg S , R
                    wire Q , Qbar );

  // instantiate Design under test DUT 

  Sr_latch uut(.S(S),
               .R(R),
               .Q(Q),
               .Qbar(Qbar),
              );

  initial begin 
    $monitor ("Time=0%t: S=%b , R=%b | Q=%b , Qbar=%b", $time , S , R, Q, Qbar );
    S=0 ; R=0 #10;
    S=1 ; R=0 #10;
    S=0 ; R=0 #10;
    S=0 ; R=1 #10;
    S=0 ; R=0 #10;
    S=1 ; R=1 #10;
    S=0 ; R=0 #10;

    $finish;

  end
endmodule
