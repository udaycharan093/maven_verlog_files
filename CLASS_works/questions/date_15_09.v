//start
module test();

reg a=1;
reg b=0;

task t1;
  begin
    forever
     
      begin
        #10 b<=a; // non blocking element but it is intra delay element so it will dilay 
        #10 a<=b; // next try with b<=#2a; b<=#3a;
      end
    end
endtask

    initial
      begin
        fork
          begin:B1
            t1;
              end
          begin
              #100 disable B1;
// ... more code
            end
          join 

endmodule
       /* "Verilog Lab Agenda
Day 1
D flip flop RTL +
T flip flop using D flip flop +
4 bit synchronous loadable up counter
Day 2
JK flip flop RTL using parameter +
SR latch using gate level modelling +
RTL for a 4-bit MOD12 loadable binary up counter
Day 3
RTL for a loadable binary synchronous up down counter
RTL for a 4-bit SISO"*/

lodabale upcounter 
  4bit lodabale synchrouse up counter //3. RTL Description and Test Bench for a 4-bit Synchronous Loadable Up Counter

        inputs clk rstn-active low , data 4bits , load - depending on this start 

        logic - always@ (posedge clk ) - beheveral model so 
        begin 
          if(rstn) // if reset n is low the count has to be updated that zero
            count=4'd0
            else if (load)
              count = <=data;
        else count<= count + ib1


          // now another question Write to design 4 bit MOD!@ loadable binaryyh up counter 
Alyays@ posedge
          begin 
            y(rst)
            count<=4'd0;
            else y(lode)
              count<=data;
            else y(count == 4'd11)
              count<=0
              else
                count<=count+1'b1
//7th question
7. Design and Verification of a 4-bit Loadable Binary Synchronous Up-Down Counter
 
