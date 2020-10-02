`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2020 04:07:20 PM
// Design Name: 
// Module Name: sseg_top
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

module sseg_top(
    input clk,
    input [3:0] sw,
    output [6:0] seg,
    output [3:0] an
    );
    
    // an is active low, turn on an[0], others off
    assign an = 4'b1110;
    
    // connect our input to the display
    sseg_display  display(.hex(sw), .seg(seg));
    
endmodule
