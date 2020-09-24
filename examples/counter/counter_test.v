`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2020 09:52:29 AM
// Design Name: 
// Module Name: counter_test
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


module counter_test();

    localparam T = 20;

    reg clk, rst;
    wire [3:0] q;
    
    counter uut(.clk(clk), .rst(rst), .q(q));
    
    // generate clock signal    
    always
    begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end

    // reset the circuit for first half clock cycle
    initial
    begin
        rst = 1'b1;
        #(T/2);
        rst = 1'b0;
    end
    
    initial
    begin
        // wait for reset to end
        @(negedge rst);

        repeat(3) @(negedge clk);

        // wait for next clock
        @(negedge clk);
        rst = 1'b1;
        #(T/2);
        rst = 1'b0;

        repeat(16) @(negedge clk);
                
        $stop; 
    end    
endmodule
