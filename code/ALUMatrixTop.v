`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//3*3 Matrix 
//////////////////////////////////////////////////////////////////////////////////


module ALUMatrixTop(clk, reset, eleSel, sel, eleIn, eleOut, LED);

input clk, reset;
input [4:0] eleSel;  
input  [5:0] sel;
input  [31:0] eleIn; 
output [31:0] eleOut;
output [15:0] LED;  

     ALUCalc zero(.clk(clk), .reset(reset), .eleSel(eleSel),.sel(sel), 
                 .eleIn(eleIn), .eleOut(eleOut), .LED(LED)); 
    
endmodule
