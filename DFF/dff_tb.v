`timescale 1ns/1ns
`include "dff.v"
// ----------------------------------------------
// DFF POSEDGE ASYNCHRONOUS
// ----------------------------------------------

module dff_Pe_As_tb;
  reg clk,rst,d;
  wire q;
  integer i;
  
  dff_Pe_As dff_Ps_As_1(q,d,clk,rst);
  
  initial begin 
    $dumpfile("dff_Pe_As.vcd");
    $dumpvars(0,dff_Pe_As_tb);
    $monitor("time=%d \t rst=%b \t clk=%b\t d=%b \t q=%b",$time,rst,clk,d,q);
    
    for (i=0;i<8;i++) begin 
      {rst,clk,d}=i;
      #10;
    end

// another method for combination---------------
//  rst = 1; d = 0;  #10;  // Reset active
//     rst = 0;         #10;

//     // ✅ More values for d over time
//     for (i = 0; i < 16; i = i + 1) begin
//       d = i % 2;      // alternate 0/1
//       #10;
//     end
// ----------------------------------------
    $finish;
  end
endmodule

// ----------------------------------------------
// DFF NEGEDGE ASYNCHRONOUS
// ----------------------------------------------
module dff_Ne_As_tb;
  reg clk,rst,d;
  wire q;
  integer i;
  
  dff_Ne_As dff_Ns_As_1(q,d,clk,rst);
  
  initial begin 
    $dumpfile("dff_Ne_As.vcd");
    $dumpvars(0,dff_Ne_As_tb);
    $monitor("time=%d \t rst=%b \t clk=%b\t d=%b \t q=%b",$time,rst,clk,d,q);
    
    for (i=0;i<8;i++) begin 
      {rst,clk,d}=i;
      #10;
    end
    $finish;
  end
endmodule

// ==================================================================
