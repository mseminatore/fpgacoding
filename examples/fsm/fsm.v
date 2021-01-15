`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2020 02:36:04 PM
// Design Name: 
// Module Name: fsm
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


module fsm(
    input clk,
    input rst,
    input btnC,
    output led
    );
    
    // state decls
    localparam state_off = 0; 
    localparam state_on = 1; 
    
    // state variables
    reg rState;
    reg rNextState;
    
    // sequential logic to update the state register
    always @(posedge clk, posedge rst)
    begin
        if (rst) 
            rState <= state_off;
        else
            rState <= rNextState;
    end

    // Combinational logic to calculate the next state
    always @*
    begin
        rNextState = rState;
        
        if (btnC) begin
            case (rState)
                state_off:
                    rNextState = state_on;
                        
                default:
                    rNextState = state_off;            
            endcase
        end        
    end
    
    // output assignment
    assign led = rState;
    
endmodule
