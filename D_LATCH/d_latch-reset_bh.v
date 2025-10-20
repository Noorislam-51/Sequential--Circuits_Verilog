`timescale 1ns/1ns

module d_latch_tb;
  reg d,en,reset;
  wire q;
  
  d_latch_reset_bh d_latch_df_1(q,d,en,reset);
  initial begin
    $dumpfile("d_latch_df.vcd");
    $dumpvars(0,d_latch_tb);
    $monitor("time=%d \t reset=%b \t en=%b\t d=%b \t q=%b",$t ime,reset,en,d,q);
    #10 reset = 0; en = 0; d = 0;
    #10 reset = 0; en = 0; d = 1;
    #10 reset = 0; en = 1; d = 0;
    #10 reset = 0; en = 1; d = 1;
    #10 reset = 1; en = 0; d = 0;
    #10 reset = 1; en = 0; d = 1;
    #10 reset = 1; en = 1; d = 0;
    #10 reset = 1; en = 1; d = 1;

    #20 $finish ;
  end
endmodule
    



    