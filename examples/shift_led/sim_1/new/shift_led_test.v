`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 10:20:23 PM
// Design Name: 
// Module Name: shift_led_test
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


module shift_led_test();

    localparam T = 20;
    localparam LED_BITS = 16;
    
    reg test_clk, rst;
    wire [LED_BITS - 1:0] test_led;

    shift_led #(.DELAY_BITS(3)) shifter(.clk(test_clk), .rst(rst), .led(test_led));

    // generate clock signal    
    always
    begin
        test_clk = 1'b1;
        #(T/2);
        test_clk = 1'b0;
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

        repeat(2 ** LED_BITS) @(negedge test_clk);
                        
        $stop; 
    end    
endmodule
