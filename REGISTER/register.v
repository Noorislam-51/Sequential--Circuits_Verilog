
module dff(q, clk, reset, d);
  input clk, reset, d;
  output reg q;

  always @(posedge clk) begin
    if (reset)
      q <= 1'b0;
    else
      q <= d;
  end
endmodule

// -----------------------------------------------------------
// PIPO
// -----------------------------------------------------------

module register_pipo_bh(q,clk,reset,d);
  input clk ,reset;
  input [7:0]d;
  output reg[7:0]q;
  
  always@(posedge clk)begin
    if(reset)
      q=1'b0;
  	else
   	  q=d;
  
  end
endmodule

module register_pipo_st(q,clk,reset,d);
  input clk ,reset;
  input [7:0]d;
  output reg[7:0]q;
  
  dff dff0(.q(q[0]), .clk(clk), .reset(reset), .d(d[0]));
  dff dff1(.q(q[1]), .clk(clk), .reset(reset), .d(d[1]));
  dff dff2(.q(q[2]), .clk(clk), .reset(reset), .d(d[2]));
  dff dff3(.q(q[3]), .clk(clk), .reset(reset), .d(d[3]));
  dff dff4(.q(q[4]), .clk(clk), .reset(reset), .d(d[4]));
  dff dff5(.q(q[5]), .clk(clk), .reset(reset), .d(d[5]));
  dff dff6(.q(q[6]), .clk(clk), .reset(reset), .d(d[6]));
  dff dff7(.q(q[7]), .clk(clk), .reset(reset), .d(d[7]));
 
  
  end
endmodule


// -----------------------------------------------------------
// SISO
// -----------------------------------------------------------

module register_siso_st(serial_out,clk,reset,serial_in);
  input clk ,reset;
  input serial_in;
  output serial_out;
  reg[3:0]q;
  
  dff dff0(.q(q[0]), .clk(clk), .reset(reset), .d(q[1]));
  dff dff1(.q(q[1]), .clk(clk), .reset(reset), .d(q[2]));
  dff dff2(.q(q[2]), .clk(clk), .reset(reset), .d(q[3]));
  dff dff3(.q(q[3]), .clk(clk), .reset(reset), .d(serial_in));
  assign serial_out=q[0]; 
endmodule

module register_siso_bh(serial_out,clk,reset,serial_in);
  input clk ,reset;
  input serial_in;
  output serial_out;
  reg [3:0]q;
  assign serial_out=q[0];
always@(posedge clk)begin 
  if(reset)
    q=4'b0000;
  else 
    q = {serial_in, q[3:1]};
  end
endmodule

// -----------------------------------------------------------
// SIPO
// -----------------------------------------------------------

module register_sipo_st(parallel_out,clk,reset,serial_in);
  input clk ,reset;
  input serial_in;
  output [3:0] parallel_out;
  reg[3:0]q;
  
  dff dff0(.q(q[0]), .clk(clk), .reset(reset), .d(q[1]));
  dff dff1(.q(q[1]), .clk(clk), .reset(reset), .d(q[2]));
  dff dff2(.q(q[2]), .clk(clk), .reset(reset), .d(q[3]));
  dff dff3(.q(q[3]), .clk(clk), .reset(reset), .d(serial_in));
  assign parallel_out=q; 
endmodule

module register_sipo_bh(parallel_out,clk,reset,serial_in);
  input clk ,reset;
  input serial_in;
  output [3:0]parallel_out;
  reg [3:0]q;
  assign parallel_out=q;
always@(posedge clk)begin 
  if(reset)
    q=4'b0000;
  else 
    q = {serial_in, q[3:1]};
  end
endmodule