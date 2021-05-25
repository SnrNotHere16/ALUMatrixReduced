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
 
 function printMatOut; 
    input a; 
    begin 
       dummy = select (18,2); 
       $write("%d ", eleOut);
       dummy = select (19,2); 
       $write("%d ", eleOut);
       dummy = select (20,2); 
       $write("%d\n", eleOut);
       dummy = select (21,2); 
       $write("%d ", eleOut);
       dummy = select (22,2); 
       $write("%d ", eleOut);
       dummy = select (23,2); 
       $write("%d\n", eleOut);
       dummy = select (24,2); 
       $write("%d ", eleOut);
       dummy = select (25,2); 
       $write("%d ", eleOut);
       dummy = select (26,2); 
       $write("%d\n", eleOut);
    end 
  endfunction 
always #5 clk = ~clk;
    initial begin 
       clk  = 0;
       reset  = 1;
       #50 reset  = 0;    
       dummy = select(18,30);
       //Initialize the values of matrices A and B
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
       //******************************
       #20 dummy = select (28,2); //transpose
       //Print out 
       #20 dummy = select(28,2); 
       $write("A' =\n");
       #21 dummy = select(18,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(19,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(20,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
       #20 dummy = select(21,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(22,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(23,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
        #20 dummy = select(24,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(25,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(26,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
 //******************************
        #20 dummy = select (29,2); //A+B
       //Print out 
       #20 dummy = select(29,2); 
       $write("A+B =\n");
       #21 dummy = select(18,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(19,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(20,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
       #20 dummy = select(21,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(22,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(23,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
        #20 dummy = select(24,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(25,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(26,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
       
  //******************************
        #20 dummy = select (30,2); //A-B
       //Print out 
       #20 dummy = select(30,2); 
       $write("A-B =\n");
       #21 dummy = select(18,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(19,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(20,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
       #20 dummy = select(21,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(22,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(23,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
        #20 dummy = select(24,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(25,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(26,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
  //******************************
        #20 dummy = select (31,2); //A-B
       //Print out 
       #20 dummy = select(31,2); 
       $write("A*B =\n");
       #21 dummy = select(18,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(19,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(20,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
       #20 dummy = select(21,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(22,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(23,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
        #20 dummy = select(24,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(25,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(26,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
  //******************************
        #20 dummy = select(40,2);
        #20 dummy = select (32,2); //2*A
       //Print out 
       #20 dummy = select(32,2); 
       $write("2*A =\n");
       #21 dummy = select(18,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(19,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(20,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
       #20 dummy = select(21,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(22,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(23,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
        #20 dummy = select(24,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
       #20 dummy = select(25,2);
       #1 dummy = 5;
       $write("%d ", eleOut);
       #20 dummy = select(26,2);
       #1 dummy = 5;
       $write("%d\n", eleOut);
//******************************
        #20 dummy = select (33,2); //det(A)
       //Print out 
       #20 dummy = select(33,2); 
       $write("det(A) =\n");
       #21 dummy = select(27,2);
       #1 dummy = 5; 
       $write("%d ",eleOut);
     end 
endmodule
