`timescale 1ns / 1ps

module ALUTestbench();
reg clk, reset; 
reg [5:0] sel; 
reg [31:0] eleIn; 
wire [31:0] eleOut; 
ALUMatrixTop DUT
      (
        .clk(clk), 
        .reset(reset), 
        .sel(sel), 
        .eleIn(eleIn), 
        .eleOut(eleOut)
       );
       
always #5 clk = ~clk;
    initial begin 
       clk  = 0;
       reset  = 1;
       sel = 18; 
       #50 reset  = 0;
     end
    
endmodule
