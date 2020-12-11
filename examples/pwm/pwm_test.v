`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2020 01:32:39 PM
// Design Name: 
// Module Name: pwm_test
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


module pwm_test();

    localparam T = 20;
    localparam BITS = 3;
    
    reg clk, rst;
    reg [7:0] dty;
    wire pwm;
        
    pwm #(.BITS(BITS)) uut(
        .clk(clk),
        .rst(rst),
        .dty(dty),
        .pwm(pwm)
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
        // set the duty cycle to 50% (4 is half of 2 ^ 3)
        dty = 4;
        
        // wait for reset to end
        @(negedge rst);

        repeat (3000) @(negedge clk);
                        
        $stop; 
    end    
    
endmodule
