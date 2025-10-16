`timescale 1ns/1ns
`include "d_latch.v"

module d_latch_tb;
  reg d,en;
  wire q;
  
  d_latch_df d_latch_df_1(q,d,en);
  initial begin
    $dumpfile("d_latch_df.vcd");
    $dumpvars(0,d_latch_tb);
    $monitor("time=%d\t en=%b\t d=%b\t q=%b",$time,en,d,q);
  	#10 en =0; d = 1;
  	#10 en =0; d = 0;
  	#10 en =1; d = 1;
  	#10 en =1; d = 0;

    #20 $finish ;
  end
endmodule
    