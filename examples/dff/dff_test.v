`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2020 04:51:48 PM
// Design Name: 
// Module Name: dff_test
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


module dff_test();

    localparam T=20;

    reg clk, d; 
    wire q;
    
    dff uut(.clk(clk), .d(d), .q(q));

    // generate clock signal    
    always
    begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end

    // generate test inputs
    initial
    begin
        @(negedge clk);
        d = 1'b0;
        #(T);
        
        @(negedge clk);
        d = 1'b1;
        #(T);

        @(negedge clk);
        d = 1'b0;
        
        @(negedge clk);
        d = 1'b1;
        #(T);

        @(negedge clk);
        d = 1'b0;
        
        @(negedge clk);
        d = 1'b1;
        #(T);

        @(negedge clk);
        d = 1'b0;
                
        #(10*T);
        $stop; 
    end    
endmodule
