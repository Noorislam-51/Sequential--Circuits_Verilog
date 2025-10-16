module d_latch_reset_bh(q,d,en,reset);
  input d,en,reset;
  output reg q;
  always@(d,en,reset) 
    if(reset) q=1'b0;
    else if (en) q=d;
  	else q=q;
  
endmodule