`timescale 1ns / 1ps

// Setup BowlingRom module
module threeRom(
    input wire [12:0] address,
    input wire clk_pix,
    output reg [7:0] dataout 
    );

    (*ROM_STYLE="block"*) reg [7:0] memory_array [0:6815]; 

    initial 
    begin
        $readmemh("three.mem", memory_array);
    end

    always@(posedge clk_pix)
            dataout <= memory_array[address];     
endmodule