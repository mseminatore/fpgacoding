`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2020 04:05:31 PM
// Design Name: 
// Module Name: sseg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// seven-segment digit display driver
module sseg_display (
    input [3:0] hex,
    output reg [6:0] seg
    );
    
    // activate on any input change
    always @*
    begin
        case(hex)
            4'h0: seg[6:0] = 7'b1000000;    // digit 0
            4'h1: seg[6:0] = 7'b1111001;    // digit 1
            4'h2: seg[6:0] = 7'b0100100;    // digit 2
            4'h3: seg[6:0] = 7'b0110000;    // digit 3
            4'h4: seg[6:0] = 7'b0011001;    // digit 4
            4'h5: seg[6:0] = 7'b0010010;    // digit 5
            4'h6: seg[6:0] = 7'b0000010;    // digit 6
            4'h7: seg[6:0] = 7'b1111000;    // digit 7
            4'h8: seg[6:0] = 7'b0000000;    // digit 8
            4'h9: seg[6:0] = 7'b0010000;    // digit 9
            4'ha: seg[6:0] = 7'b0001000;    // digit A
            4'hb: seg[6:0] = 7'b0000011;    // digit B
            4'hc: seg[6:0] = 7'b1000110;    // digit C
            4'hd: seg[6:0] = 7'b0100001;    // digit D
            4'he: seg[6:0] = 7'b0000110;    // digit E
            default: seg[6:0] = 7'b0001110; // digit F
        endcase
    end
endmodule
