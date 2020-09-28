`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/10/2020 02:43:09 PM
// Design Name: 
// Module Name: shift_test
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


module shift_test();

    localparam T=20;
    localparam BITS = 8;
    
    reg clk, rst;
    reg data_in;
    wire [BITS - 1 : 0] data_out;
    
    shift_reg #(.BITS(BITS)) uut(.clk(clk), .rst(rst), .d(data_in), .q(data_out));

    // generate the clock signal    
    always
    begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end

    // reset the device at start
    initial
    begin
        rst = 1'b1;
        #(T/2);
        rst = 1'b0;
    end
    
    initial
    begin
        data_in = 1'b0;
        @(negedge rst);
        
        // set input to 1
        data_in = 1'b1;
        
        // shift in the input BITS times
        repeat(BITS) @(negedge clk);

        // set the input to 0
        data_in = 1'b0;

        repeat(2) @(negedge clk);
        
        // end simulation                
        $stop; 
    end
        
endmodule
