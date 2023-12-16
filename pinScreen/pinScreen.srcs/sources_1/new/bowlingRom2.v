//----------------------------------------------
// BowlingRom.v Module
// Single Port ROM              
// Digilent Basys 3             
// Bee Invaders Tutorial_2
// Onboard clock 100MHz
// VGA Resolution: 640x480 @ 60Hz
// Pixel Clock 25.2MHz
//----------------------------------------------
`timescale 1ns / 1ps

// Setup BowlingRom module
module bowling_Rom2(
    input wire [16:0] address,
    input wire clk_pix,
    output reg [7:0] dataout 
    );

    (*ROM_STYLE="block"*) reg [7:0] memory_array [0:118901]; 

    initial 
    begin
        $readmemh("finalblackBG.mem", memory_array);
    end

    always@(posedge clk_pix)
            dataout <= memory_array[address];     
endmodule
