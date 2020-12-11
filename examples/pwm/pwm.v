`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2020 01:32:15 PM
// Design Name: 
// Module Name: pwm
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


module pwm
    #(parameter BITS = 8)
    (
        input clk,
        input rst,
        input [BITS - 1 : 0] dty,
        output pwm
    );

    // state registers
    reg rPwm;
    reg [BITS - 1 : 0] rDuty;

    // next state signals
    wire pwmNext;
    wire [BITS - 1 : 0] dutyNext;
                
    // update our state variables
    always @(posedge clk, posedge rst)
    begin
        if (rst) begin
            rPwm <= 0;
            rDuty <= 0;
        end else begin
            rPwm <= pwmNext;
            rDuty <= dutyNext;
        end
    end
        
    // compute the next state values
    assign dutyNext = rDuty + 1;
    assign pwmNext = rDuty < dty;

    // output logic
    assign pwm = rPwm;
    
endmodule
