`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2020 03:19:25 PM
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


module sseg_display(
    input [3:0] hex,
    output reg [6:0] seg
    );
    
    always @*
    begin
        case(hex)
            4'h0: seg[6:0] = 7'b1000000;
            4'h1: seg[6:0] = 7'b1111001;
            4'h2: seg[6:0] = 7'b0100100;
            4'h3: seg[6:0] = 7'b0110000;
            4'h4: seg[6:0] = 7'b0011001;
            4'h5: seg[6:0] = 7'b0010010;
            4'h6: seg[6:0] = 7'b0000010;
            4'h7: seg[6:0] = 7'b1111000;
            4'h8: seg[6:0] = 7'b0000000;
            4'h9: seg[6:0] = 7'b0010000;
            4'ha: seg[6:0] = 7'b0001000;
            4'hb: seg[6:0] = 7'b0000011;
            4'hc: seg[6:0] = 7'b1000110;
            4'hd: seg[6:0] = 7'b0100001;
            4'he: seg[6:0] = 7'b0000110;
            default: seg[6:0] = 7'b0001110;
        endcase
    end
endmodule
