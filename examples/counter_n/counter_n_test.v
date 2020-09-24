`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2020 03:02:17 PM
// Design Name: 
// Module Name: counter_n_test
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


module counter_n_test();

    localparam T = 20;
    localparam BITS = 3;
    
    reg clk, rst;
    wire [BITS - 1:0] q;
    wire tick;
    
    counter_n #(.BITS(BITS)) uut(.clk(clk), .rst(rst), .q(q), .tick(tick));
    
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

        repeat(2 ** BITS) @(negedge clk);
                
        $stop; 
    end
endmodule
