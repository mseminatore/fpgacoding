`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2020 03:35:07 PM
// Design Name: 
// Module Name: pmod_keypad
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

// circuit for interfacing with Pmod keypad
module pmod_keypad(
    input clk,
    input [3:0] row,
    output reg [3:0] col,
    output reg [3:0] key
    );

    // counter bits
    localparam BITS = 20;
    
    // number of clk ticks for 1ms: 100Mhz / 1000
    localparam ONE_MS_TICKS = 100000000 / 1000;
    
    // settle time of 1 us = 100Mhz / 1000000
    localparam SETTLE_TIME = 100000000 / 1000000;
    
    wire [BITS - 1 : 0] key_counter;
    reg rst = 1'b0;
    
    // instantiate a 20-bit counter circuit
    counter_n #(.BITS(BITS)) counter(
        .clk(clk),
        .rst(rst),
        .q(key_counter)
    );
    
    // check on each clock
    always @ (posedge clk)
    begin
        case (key_counter)
            0:
                rst <= 1'b0;
                
            ONE_MS_TICKS:
                col <= 4'b0111;

            ONE_MS_TICKS + SETTLE_TIME:
            begin
                case (row)
                    4'b0111:
                        key <= 4'b0001; // 1
                    4'b1011:
                        key <= 4'b0100; // 4
                    4'b1101:
                        key <= 4'b0111; // 7
                    4'b1110:
                        key <= 4'b0000; // 0
                endcase
            end
            
            2 * ONE_MS_TICKS:
                col <= 4'b1011;
            
            2 * ONE_MS_TICKS + SETTLE_TIME:
            begin
                case (row)
                    4'b0111:
                        key <= 4'b0010; // 2
                    4'b1011:
                        key <= 4'b0101; // 5
                    4'b1101:
                        key <= 4'b1000; // 8
                    4'b1110:
                        key <= 4'b1111; // F
                endcase
            end

            // 3ms
            3 * ONE_MS_TICKS:
                col <= 4'b1101;

            3 * ONE_MS_TICKS + SETTLE_TIME:
            begin
                case (row)
                    4'b0111:
                        key <= 4'b0011; // 3
                    4'b1011:
                        key <= 4'b0110; // 6
                    4'b1101:
                        key <= 4'b1001; // 9
                    4'b1110:
                        key <= 4'b1110; // E
                endcase
            end
            
            // 4ms
            4 * ONE_MS_TICKS:
                col <= 4'b1110;
            
            4 * ONE_MS_TICKS + SETTLE_TIME:
            begin
                case (row)
                    4'b0111:
                        key <= 4'b1010; // A
                    4'b1011:
                        key <= 4'b1011; // B
                    4'b1101:
                        key <= 4'b1100; // C
                    4'b1110:
                        key <= 4'b1101; // D
                endcase

                // reset the counter                
                rst <= 1'b1;
            end     
        endcase
    end
    
endmodule
