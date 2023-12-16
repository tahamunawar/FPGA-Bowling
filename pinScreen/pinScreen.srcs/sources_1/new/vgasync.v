//`timescale 1ns /1ps
//module vga_sync (
//input [9:0] h_count,
//input [9:0] v_count,
//output  h_sync,
//output  v_sync,
//output  video_on, // active area
//output [9:0] x_loc, // current pixel x- location 
//output [9:0] y_loc // current pixel y-location

//);

//// horizontal 
//    localparam HD = 640; // Horizontal  Display Area
//    localparam HF = 16; // Horizontal (Front Porch) Right Border 
//    localparam HB = 48;// Horizontal (Back Porch) Left Border
//    localparam HR = 96;// Horizontal Retrace
//// vertical
//    localparam VD = 480;// Vertical Display Area
//    localparam VF = 10;// Vertical (Front Porch) Bottom Border 
//    localparam VB = 33; // Vertical (Back Porch) Top Border
//    localparam VR = 2;// Vertical Retrace
    
//    assign v_sync = (v_count < (VD+VF)) | (v_count >= (VD+VF+VR));
//    assign h_sync = (h_count < (HD+HF)) | (v_count >= (HD+HF+HR));
//    assign video_on = (h_count < HD) & (v_count < VD);
//    assign x_loc = h_count;
//    assign y_loc = v_count;
    
//endmodule // vga_sync

////hsync low when counter >=656 and <=751
////lsync low whe n  when line count ==490 or ==491.
////video on area =

`timescale 1ns / 1ps

module vga_sync(
    input [9:0]h_count,
    input [9:0]v_count,
    output h_sync,
    output v_sync,
    output video_on,
    output [9:0]x_loc,
    output [9:0]y_loc
    );
    
    //horizontal
    localparam HD = 640;
    localparam HF = 16;
    localparam HR = 96;
    localparam HB = 48;
    
    //vertical
    localparam VD = 480;
    localparam VF = 10;
    localparam VR = 2;
    localparam VB = 33;
    
//    reg video_on;
//    reg h_sync;
//    reg v_sync;
//    reg [9:0]x_loc;
//    reg [9:0]y_loc;
    
//    always begin
//    video_on <= h_count < HD ? (v_count <VD ? 1:0):0;
//    h_sync <= (h_count < (HD+HF)) ? 1: (h_count >= (HD+HF+HR)) ? 1:0;
//    v_sync <= (v_count < (VD+VF)) ? 1: (v_count >= (VD+VF+VR)) ? 1:0;
//    x_loc <= h_count;
//    y_loc <= v_count; 
//    end

    assign v_sync = (v_count < (VD+VF)) | (v_count >= (VD+VF+VR)); 
    assign h_sync = (h_count < (HD+HF)) | (h_count >= (HD+HF+HR));
    assign video_on = (h_count < HD) & (v_count<VD);
    
    assign x_loc = h_count;
    assign y_loc = v_count;
    
  
endmodule
