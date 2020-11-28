`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2020 10:50:09 AM
// Design Name: 
// Module Name: timer
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

// configurable timer module with pre-scaler
module timer_scaled
    #(
        parameter TIMER_BITS = 8,
        SCALER_BITS = 2
    )
(
    input clk,  // clock input
    input rst,  // async reset
    input en,   // timer enable
    input [TIMER_BITS - 1 : 0] d_in,  // timer start value,
    input [SCALER_BITS - 1 : 0] ps,   // pre-scale factor
    output [TIMER_BITS - 1 : 0] q,    // timer current value
    output tick                       // tick event raised when timer reaches zero
);

    // register for countdown timer
    reg [TIMER_BITS - 1 : 0] rCounter;

    // register for scaler
    reg [2 ** SCALER_BITS - 1: 0] rScaler;
    
    // holds the next value of internal counter
    wire [TIMER_BITS - 1 : 0] counterNext;

    // holds the next value of the scaler
    wire [2 ** SCALER_BITS -1 : 0] scalerNext;
         
    // update or reset the timer on the clock tick
    always @(posedge clk, posedge rst)
    begin
        if (rst) begin
            rCounter <= d_in;
            rScaler <= 0;
        end else
            // only update counter when it is enabled
            if (en) begin
                rCounter <= counterNext;
                rScaler <= scalerNext;
            end             
    end

    // compute the next scaler value
    assign scalerNext = (rScaler == 2 ** ps - 1) ? 0 : (rCounter == 0) ? 0 : rScaler + 1; 
    
    // compute the next counter value 
    assign counterNext = (rCounter == 0) ? d_in : (scalerNext == 0) ? rCounter - 1 : rCounter;

    // raise tick when counter reaches 0
    assign tick = (rCounter == 0) ? 1'b1 : 1'b0;
    
    // make current count available on q
    assign q = rCounter;
      
endmodule
