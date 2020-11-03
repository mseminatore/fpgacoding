`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2020 04:32:17 PM
// Design Name: 
// Module Name: xor_test
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


module xor_test();

    localparam T=20;

    reg clk, a, b;
    wire d;
    integer i;
    reg [1:0] test_data [3:0];
            
    xor_gate uut(.a(a), .b(b), .d(d));

    // generate clock signal    
    always
    begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end

    initial
    begin
        $readmemb("test_vectors.txt", test_data);
        
        for (i = 0; i < 4; i = i + 1)
        begin
            {a, b} = test_data[i];
            #(T/2);
        end
        $stop; 
    end
endmodule

