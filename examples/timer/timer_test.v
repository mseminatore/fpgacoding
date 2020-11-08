`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 10:50:37 AM
// Design Name: 
// Module Name: timer_test
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

// timer test bench
module timer_test();

    localparam T=20;

    reg clk, rst, en;
    reg [7:0] d_in;
    wire tick;
    wire [7:0] q;
    
    timer t0(
        .clk(clk), 
        .rst(rst), 
        .en(en),
        .d_in(d_in),
        .q(q),
        .tick(tick)
    );
 

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
        d_in = 4;
        en = 1;
        
        // wait for reset to end
        @(negedge rst);
    
        repeat (10) @(negedge clk);
        
        en = 0;

        repeat (3) @(negedge clk);

        rst = 1'b1;
        #(T/2);
        rst = 1'b0;
        
        en = 1;
        d_in = 2;

        repeat (10) @(negedge clk);
                        
        $stop; 
    end    
    
endmodule
