`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2020 03:15:56 PM
// Design Name: 
// Module Name: keypad_top
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

// top-level module
module keypad_top(
    input clk,
    inout [7:0] JA,
    output [6:0] seg,
    output [3:0] an
    );

    // interconnect wiring
    wire [3:0] key;
    
    // only using 1 digit of sseg display
    assign an = 4'b1110;
        
    // instantiate the keypad circuit
    pmod_keypad keypad(
        .clk(clk), 
        .col(JA[3:0]), 
        .row(JA[7:4]), 
        .key(key)
    );

    // instantiate the display circuit     
    sseg_display(
        .hex(key),
        .seg(seg)
    );
    
endmodule
