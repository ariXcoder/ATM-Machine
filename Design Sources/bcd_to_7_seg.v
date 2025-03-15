/*
     _a__ 
    |   |
    f   b
    |   |
     _g__     7 segment display ( NOTE: this is active low eg: 0-> (ABCDEFG)==(0000001)
    |   |
    e   c 
    |   |
     _d__


*/

`timescale 1ns / 1ps
 
module bcd_to_7_seg(
    input [3:0] bcd, // 4 bit input coming from 4:1 MUX 
    output [6:0] seg // 7-bit output going one at a time in one 7 segment 
                     // out of 3 7 segments
    );

function [6:0] bcd_to7;
    input [3:0] digit;
    case(digit)
        4'b0000: bcd_to7=7'b0000001;
        4'b0001: bcd_to7=7'b100111;
        4'b0010: bcd_to7=7'b0010010;
        4'b0011: bcd_to7=7'b0000110;
        4'b0100: bcd_to7=7'b1001100;
        4'b0101: bcd_to7=7'b0100100;
        4'b0110: bcd_to7=7'b0100000;
        4'b0111: bcd_to7=7'b0001111;
        4'b1000: bcd_to7=7'b0000000;
        4'b1001: bcd_to7=7'b0001100;
        default: bcd_to7=7'b0000000;
    endcase

endfunction    

assign seg=bcd_to7(bcd);

endmodule