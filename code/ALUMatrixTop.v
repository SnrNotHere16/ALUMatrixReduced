`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//3*3 Matrix 
//////////////////////////////////////////////////////////////////////////////////


module ALUMatrixTop(clk, reset, sel, eleIn, eleOut);

input clk, reset; 
input  [5:0] sel; 
input  [31:0] eleIn; 
output [31:0] eleOut; 

     ALUCalc zero(.clk(clk), .reset(reset), .sel(sel), 
                 .eleIn(eleIn), .eleOut(eleOut)); 
    
endmodule
