`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2020 05:21:02 PM
// Design Name: 
// Module Name: xor_test
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


module xor_test();

    localparam T=20;

    reg clk, a, b;
    wire d;
    
    xor_gate uut(.a(a), .b(b), .d(d));
    

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
        @(negedge clk);
        a = 1'b0;
        b = 1'b0;
        #(T);
        
        @(negedge clk);
        a = 1'b1;
        b = 1'b0;
        #(T);

        @(negedge clk);
        a = 1'b0;
        b = 1'b1;
        #(T);
        
        @(negedge clk);
        a = 1'b1;
        b = 1'b1;

        #(10*T);
        $stop; 
    end
    
endmodule
