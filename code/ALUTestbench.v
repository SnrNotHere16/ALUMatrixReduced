`timescale 1ns / 1ps

module ALUTestbench();
reg clk, reset; 
reg [5:0] sel; 
reg [31:0] eleIn; 
reg dummy; 
wire [31:0] eleOut; 
ALUMatrixTop DUT
      (
        .clk(clk), 
        .reset(reset), 
        .sel(sel), 
        .eleIn(eleIn), 
        .eleOut(eleOut)
       );

function select;
    input [5:0] a; 
    input [31:0] eI; 
    begin 
        sel = a; 
        eleIn = eI; 
    end 
 endfunction 
 
always #5 clk = ~clk;
    initial begin 
       clk  = 0;
       reset  = 1;
       dummy = select(18,30); 
       #50 reset  = 0;    
     end 
endmodule
