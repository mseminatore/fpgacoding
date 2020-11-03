`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 04:22:11 PM
// Design Name: 
// Module Name: xor_udp
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

primitive xor_gate(output d, input a, input b);
    table
        // a b : d
        0 0 : 0;
        1 0 : 1;
        0 1 : 1;
        1 1 : 0;
    endtable

endprimitive


