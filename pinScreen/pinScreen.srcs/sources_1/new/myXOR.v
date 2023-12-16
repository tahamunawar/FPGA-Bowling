`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 02:15:54 PM
// Design Name: 
// Module Name: myXOR
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


module myXOR(
    input SW1,
    input SW2,
    output LED
    );
    wire and_1;
    wire and_2;
    myAND g1(SW1, ~SW2, and_1);
    myAND g2(~SW1, SW2, and_2);
    myOR g3(and_1, and_2, LED);
endmodule
