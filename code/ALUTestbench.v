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
       #50 reset  = 0;    
       dummy = select(18,30);
       #20 dummy = select (0,0);  
       #20 dummy = select (1,1);  
       #20 dummy = select (2,2);
       #20 dummy = select (3,3);  
       #20 dummy = select (4,4);  
       #20 dummy = select (5,5);
       #20 dummy = select (6,6);  
       #20 dummy = select (7,7);  
       #20 dummy = select (8,8);
       #20 dummy = select (9,0);  
       #20 dummy = select (10,1);  
       #20 dummy = select (11,2);
       #20 dummy = select (12,3);  
       #20 dummy = select (13,4);  
       #20 dummy = select (14,5);
       #20 dummy = select (15,6);  
       #20 dummy = select (16,7);  
       #20 dummy = select (17,8);
     end 
endmodule
