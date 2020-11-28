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

    localparam T = 20;
    localparam SCALER = 3;
    
    reg clk, rst, en;
    reg [SCALER - 1 : 0] ps;
    reg [7:0] d_in;
    wire tick;
    wire [7:0] q;
    
    timer_scaled #(.SCALER_BITS(SCALER)) t0(
        .clk(clk), 
        .rst(rst), 
        .en(en),
        .ps(ps),
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
        ps = 4;
        d_in = ~0;
        en = 1;
        
        // wait for reset to end
        @(negedge rst);

        repeat (3000) @(negedge clk);
                        
        $stop; 
    end    
    
endmodule
