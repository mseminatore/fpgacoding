`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2020 04:35:12 PM
// Design Name: 
// Module Name: buffer_test
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


module buffer_test();

    localparam T=20;
    
    reg clk;
    wire d;

    buffer uut(.clk(clk), .d(d));
    
    // generate clock signal    
    always
    begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end

    initial
    begin
        #(10*T);
        $stop; 
    end    
endmodule
