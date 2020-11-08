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

// configurable timer module
module timer
    #(parameter BITS = 8)
(
    input clk,  // clock input
    input rst,  // async reset
    input en,   // timer enable
    input [BITS - 1 : 0] d_in,  // timer start value
    output [BITS - 1 : 0] q,    // timer current value
    output tick                 // tick event raised when timer reaches zero
);
    
    // register for countdown timer
    reg [BITS - 1 : 0] rCounter;

    // holds the next value of internal counter
    wire [BITS - 1 : 0] rNext;
        
    // update or reset the timer on the clock tick
    always @(posedge clk, posedge rst)
    begin
        if (rst)
            rCounter <= d_in;
        else
            // only update counter when it is enabled
            if (en) begin
                rCounter <= rNext;
            end             
    end

    // reset timer when it reaches zero, otherwise     
    assign rNext = (rCounter == 0) ? d_in : rCounter - 1;

    // raise tick when counter reaches 0
    assign tick = (rCounter == 0) ? 1'b1 : 1'b0;
    
    // make current count available on q
    assign q = rCounter;
      
endmodule
