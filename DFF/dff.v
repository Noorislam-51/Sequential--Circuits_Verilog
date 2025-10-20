
// ----------------------------------------------
// DFF POSEDGE ASYNCHRONOUS
// ----------------------------------------------
module dff_Pe_As(q,d,clk,rst);
  input clk,rst,d;
  output reg q;
  
  always@ (posedge clk or posedge rst)
    if(rst)
      q=1'b0;
  	else
      q<=d;
  
endmodule


// ----------------------------------------------
// DFF NEGEDGE ASYNCHRONOUS
// ----------------------------------------------
module dff_Ne_As(q,d,clk,rst);
  input clk,rst,d;
  output reg q;
  
  always@ (negedge clk or posedge rst)
    if(rst)
      q=1'b0;
  	else
      q<=d;
  
endmodule

