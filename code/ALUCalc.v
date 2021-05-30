`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//sel
//0->27: setting the eleIn and eleOut to values 
//  0->8: E = eleIn 
//  9->17: F = eleIn 
//  18->26: eleOut = G
//  40    : c = eleIn
//      27: eleOut = det   
//      28: G = E' 
//      29: G = A+B
//      30: G = A-B
//      31: G = A*B
//      32: G = c*A 
//      33: G = det(A) 
//////////////////////////////////////////////////////////////////////////////////


module ALUCalc(clk, reset, eleSel, sel, eleIn, eleOut, LED);
input clk, reset; 
input [4:0] eleSel; 
input [5:0] sel; 
input [31:0] eleIn; 
output reg [31:0] eleOut;
output reg [15:0] LED;  
reg [31:0] E00, E01, E02, 
           E10, E11, E12,     
           E20, E21, E22, 
           F00, F01, F02, 
           F10, F11, F12,
           F20, F21, F22,
           G00, G01, G02, 
           G10, G11, G12,
           G20, G21, G22, 
           det, c;    

always @(posedge clk, posedge reset) begin 
        if (reset) begin 
            E00 <= 32'h0; 
            E01 <= 32'h0;
            E02 <= 32'h0;
            E10 <= 32'h0;
            E11 <= 32'h0; 
            E12 <= 32'h0;
            E20 <= 32'h0;
            E21 <= 32'h0;
            E22 <= 32'h0;      
            F00 <= 32'h0; 
            F01 <= 32'h0;
            F02 <= 32'h0;
            F10 <= 32'h0;
            F11 <= 32'h0; 
            F12 <= 32'h0;
            F20 <= 32'h0;
            F21 <= 32'h0;
            F22 <= 32'h0;  
            G00 <= 32'h0; 
            G01 <= 32'h0;
            G02 <= 32'h0;
            G10 <= 32'h0;
            G11 <= 32'h0; 
            G12 <= 32'h0;
            G20 <= 32'h0;
            G21 <= 32'h0;
            G22 <= 32'h0;      
        end 
        
        else begin 
            if(sel == 28)begin //Transpose matrix E
                G00 <= E00; 
                G01 <= E10; 
                G02 <= E20; 
                G10 <= E01; 
                G11 <= E11; 
                G12 <= E21; 
                G20 <= E02; 
                G21 <= E12;
                G22 <= E22;  
            end 
            
            else if (sel == 29)begin 
                G00 <= E00+F00; 
                G01 <= E01+F01; 
                G02 <= E02+F02; 
                G10 <= E10+F10; 
                G11 <= E11+F11; 
                G12 <= E12+F12; 
                G20 <= E20+F20; 
                G21 <= E21+F21;
                G22 <= E22+F22;  
            end 
            
            else if (sel == 30)begin 
                G00 <= E00-F00; 
                G01 <= E01-F01; 
                G02 <= E02-F02; 
                G10 <= E10-F10; 
                G11 <= E11-F11; 
                G12 <= E12-F12; 
                G20 <= E20-F20; 
                G21 <= E21-F21;
                G22 <= E22-F22;  
            end 
            
            else if (sel == 31) begin 
                G00 <= (E00*F00)+(E01*F10)+(E02*F20); 
                G01 <= (E00*F01)+(E01*F11)+(E02*F21); 
                G02 <= (E00*F02)+(E01*F12)+(E02*F22);  
                G10 <= (E10*F00)+(E11*F10)+(E12*F20); 
                G11 <= (E10*F01)+(E11*F11)+(E12*F21);  
                G12 <= (E10*F02)+(E11*F12)+(E12*F22); 
                G20 <= (E20*F00)+(E21*F10)+(E22*F20); 
                G21 <= (E20*F01)+(E21*F11)+(E22*F21);
                G22 <= (E20*F02)+(E21*F12)+(E22*F22);  
            end 
            
            else if (sel == 32) begin 
                G00 <= c*E00; 
                G01 <= c*E01; 
                G02 <= c*E02; 
                G10 <= c*E10; 
                G11 <= c*E11; 
                G12 <= c*E12; 
                G20 <= c*E20; 
                G21 <= c*E21;
                G22 <= c*E22; 
            end 
            
            else if (sel == 33) begin 
                det <= E00*(E11*E22 - E21*E12)-
                       E01*(E10*E22 - E20*E12)+
                       E02*(E10*E21 - E20*E11);
            end 
            
        
        
        end 
    
    end
    
    always @(*) begin 
        case(sel)
            0: E00 = eleIn; 
            1: E01 = eleIn; 
            2: E02 = eleIn; 
            3: E10 = eleIn; 
            4: E11 = eleIn; 
            5: E12 = eleIn; 
            6: E20 = eleIn; 
            7: E21 = eleIn; 
            8: E22 = eleIn;
            9: F00 = eleIn; 
           10: F01 = eleIn; 
           11: F02 = eleIn; 
           12: F10 = eleIn; 
           13: F11 = eleIn; 
           14: F12 = eleIn; 
           15: F20 = eleIn; 
           16: F21 = eleIn; 
           17: F22 = eleIn;
           18: eleOut = G00; 
           19: eleOut = G01; 
           20: eleOut = G02; 
           21: eleOut = G10; 
           22: eleOut = G11; 
           23: eleOut = G12; 
           24: eleOut = G20; 
           25: eleOut = G21; 
           26: eleOut = G22;
           27: eleOut = det; 
           40: c = eleIn; 
          default: eleOut = det; 
        endcase
        case(eleSel)
            0: LED = E00; 
            1: LED = E01; 
            2: LED = E02; 
            3: LED = E10; 
            4: LED = E11; 
            5: LED = E12; 
            6: LED = E20; 
            7: LED = E21; 
            8: LED = E22;
            9: LED = F00; 
           10: LED = F01; 
           11: LED = F02; 
           12: LED = F10; 
           13: LED = F11; 
           14: LED = F12; 
           15: LED = F20; 
           16: LED = F21; 
           17: LED = F22;
           18: LED = G00; 
           19: LED = G01; 
           20: LED = G02; 
           21: LED = G10; 
           22: LED = G11; 
           23: LED = G12; 
           24: LED = G20; 
           25: LED = G21; 
           26: LED = G22;
           27: LED = sel; 
           28: LED = eleIn; 
           29: LED = eleOut; 
          default: LED = 16'hFFFF; 
        endcase
    end  
endmodule
