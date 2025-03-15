`timescale 1ns / 1ps


module mux_4_to_1(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input [1:0] sel,
    output reg [3:0] out
    );
    
    always@(A or B or C or D or sel)begin
        case(sel)
            2'b00: out=A;
             2'b01: out=B;
               2'b10: out=C;
                2'b11: out=D;
           
        endcase
    
    end
endmodule
