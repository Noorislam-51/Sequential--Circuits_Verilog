`timescale 1ns/1ns
`include "register.v"


// -----------------------------------------------------------
// PIPO
// -----------------------------------------------------------
module register_pipo_tb;
  reg clk ,reset;
  reg [7:0]d;
  wire[7:0]q;
  integer i;
  
  register_pipo_bh register_pipo1(q,clk,reset,d);
  always #5 clk = ~clk;
  initial begin 
    $dumpfile("register_pipo.vcd");
    $dumpvars(0,register_pipo_tb);
    $monitor("time=%d \t clk=%b\t reset=%b \t d=%b\t q=%b\t" ,$time,clk,reset,d,q);
    clk= 0;
    reset=1;
    d = 8'b0;
   
   
    #10 reset= 0;
    for (i=0;i<10;i++)begin 
      #10 d= $random;
    end 
     #20 $finish; // end simulation         
  end
  endmodule
  
  

  // -----------------------------------------------------------
  // SISO
  // -----------------------------------------------------------
module register_siso_tb;
  reg clk ,reset,serial_in;
  wire serial_out;
  integer i;
  
  register_siso_bh register_siso_bh1(serial_out,clk,reset,serial_in);
  always #5 clk=~clk;
  initial begin 
    $dumpfile("register_siso.vcd");
    $dumpvars(0,register_siso_tb);
    $monitor("time=%d \t clk=%b\t reset=%b \t serial_in=%b\t serial_out=%b\t" ,$time,clk,reset,serial_in,serial_out);
  clk=0;
  reset=1;
  serial_in=0;
  #10 reset =0;
    for(i=0;i<10;i++)begin
    #10 serial_in= $random%2;
    end
  #20 $finish; // End simulation
  end
  endmodule
  
  
// -----------------------------------------------------------
// SIPO
// -----------------------------------------------------------
module register_sipo_tb;
  reg clk ,reset,serial_in;
  wire [3:0]parallel_out;
  integer i;
  
  register_sipo_bh register_sipo_bh1(parallel_out,clk,reset,serial_in);
  always #5 clk=~clk;
  initial begin 
    $dumpfile("register_sipo.vcd");
    $dumpvars(0,register_sipo_tb);
    $monitor("time=%d \t clk=%b\t reset=%b \t serial_in=%b\t parallel_out=%b\t" ,$time,clk,reset,serial_in,parallel_out);
  clk=0;
  reset=1;
  serial_in=0;
  #10 reset =0;
    for(i=0;i<10;i++)begin
    #10 serial_in= $random%2;
    end
  #20 $finish; // End simulation
  end
  endmodule
  
  