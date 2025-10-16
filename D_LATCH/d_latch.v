`timescale 1ns/1ns

module d_latch_df(q,d,en);
  input d,en;
  output q;
  assign q=en?d:q;
  
endmodule


module d_latch_bh(q,d,en);
  input d,en;
  output reg q;
  always@(d,en) 
    if (en) q=d;
  	else q=q;
  
endmodule