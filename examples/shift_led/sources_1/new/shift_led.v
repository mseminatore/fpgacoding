`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 03:35:31 PM
// Design Name: 
// Module Name: shift_led
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


module shift_led
    #(parameter COUNTER_BITS = 21, LED_BITS = 16)
    (
    input clk,
    input btnC,
    output [LED_BITS - 1:0] led
    );
    
    wire [LED_BITS - 1 : 0] wLed;
    wire wShiftClk;
    reg rLedState = 1;
    
    // create a counter to generate new clock for shift reg 
    counter_n #(.BITS(COUNTER_BITS)) counter(.clk(clk), .rst(btnC), .tick(wShiftClk));
    
    // create a shift register that runs every 2 ^ COUNTER_BITS clock cycles
    shift_reg #(.BITS(LED_BITS)) shifter(.clk(wShiftClk), .rst(btnC), .d(rLedState), .q(wLed));
    
    always @(posedge wShiftClk, posedge btnC)
        if (btnC)
            rLedState = 1'b1;
        else if (wLed[LED_BITS - 1] == 1'b1)
            rLedState <= 1'b0;
        else
            rLedState <= 1'b1;
             
    assign led = wLed;
    
endmodule

