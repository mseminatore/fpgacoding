//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2020 02:05:37 PM
// Design Name: 
// Module Name: shift_reg
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


module shift_reg
    #(parameter BITS = 8)
    (
    input clk,
    input rst,
    input d,
    output [BITS - 1 : 0] q
    );
    
    // internal signals
    reg [BITS - 1 : 0] rShiftReg;
    wire [BITS -1 : 0] output_next;
    
    // circuit is activated on clk or rst
    always @(posedge clk, posedge rst)
        if (rst)
            rShiftReg <= 0;
        else
            rShiftReg <= output_next;
            
    // update the shift register contents
    assign output_next = { rShiftReg[BITS - 2 : 0], d };
    
    // update our output 
    assign q = rShiftReg;
                          
endmodule
