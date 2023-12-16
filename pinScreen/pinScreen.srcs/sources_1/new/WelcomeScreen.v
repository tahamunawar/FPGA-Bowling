`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 11:31:24 AM
// Design Name: 
// Module Name: WelcomeScreen
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


module WelcomeScreen(
 input clk_d,
    input [9:0] pixel_x,
    input [9:0] pixel_y,
    input video_on,
    output reg [3:0] red,
    output reg [3:0] green,
    output reg [3:0] blue
//    output left_out,
//    output middle_out,
//    output right_out
);
    // setup character positions and sizes
    reg [9:0] BowlingX = 120; 
    reg [8:0] BowlingY = 70; 
    localparam BowlingWidth = 399; 
    localparam BowlingHeight = 298;
    wire [7:0] dout;  
    reg [16:0] address; // 2^15 or 32768, need 114 x 159 = 18126
    bowling_Rom2 br (
        .address(address[16:0]),
        .clk_pix(clk_d),
        .dataout(dout)
    );
    // input module call so that I can change car location.
    // input wires.
//    wire left_in;
//    wire middle_in;
//    wire right_out;
//    //output wires.
//    reg left_out;
//    reg middle_out;    
    
    reg [7:0] palette [0:191];              // 8 bit values from the 192 hex entries in the colour palette
    reg [7:0] COL = 0;                      // background colour palette value
    initial begin
        $readmemh("pal24bit.mem", palette); // load 192 hex values into "palette"
    end  
    
    
    always @(posedge clk_d) begin
        if ((pixel_x == 0) || (pixel_x == 639) || (pixel_y == 0) || (pixel_y == 479)) begin
            red <= 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
        end
        else 
        begin
                if ((pixel_x >= BowlingX) && (pixel_x < BowlingX + BowlingWidth) && (pixel_y >= BowlingY) && (pixel_y < BowlingY + BowlingHeight))
                    begin
                        address <= (pixel_x - BowlingX) + ((pixel_y - BowlingY) * BowlingWidth);
                        red = (palette[(dout*3)])>>4;    // RED bits(7:4) from colour palette
                        green = (palette[(dout*3)+1])>>4;  // GREEN bits(7:4) from colour palette
                        blue = (palette[(dout*3)+2])>>4;  // BLUE bits(7:4) from colour palette
                    end
                    else
                    begin
                    // the three lines are working properly i am commenting them out for experimentation
                        red <= (palette[(COL*3)])>>4;     // RED bits(7:4) from colour palette
                        green <= (palette[(COL*3)+1])>>4;   // GREEN bits(7:4) from colour palette
                        blue <= (palette[(COL*3)+2])>>4;   // BLUE bits(7:4) from colour palette
                    end
            end
                
        end
endmodule
