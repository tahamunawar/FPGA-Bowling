module topLevelProject (
    input clk,
    input wire [5:0] ir_signal,   // Input from the IR sensor
    input wire reset,
    input wire switch,
    output [3:0] red,
    output [3:0] green,
    output [3:0] blue,
    output  h_sync,
    output  v_sync
);

wire clk_d;
wire [9:0] h_count;
wire [9:0] v_count;
wire v_trig;
wire video_on;
wire [9:0] x_loc;
wire [9:0] y_loc;
clk_div ball(clk, clk_d);
h_counter b1(clk_d, h_count, v_trig);
v_counter b2(clk_d, v_trig, v_count);
vga_sync b3(h_count, v_count, h_sync, v_sync, video_on, x_loc, y_loc); 
wire [3:0] red1;
wire [3:0] red2;
wire [3:0] blue1;
wire [3:0] blue2;
wire [3:0] green1;
wire [3:0] green2;
GameScreen BALLS(clk_d, x_loc, y_loc, video_on, reset, ir_signal, red1, green1, blue1);
WelcomeScreen BALLS2(clk_d, x_loc, y_loc, video_on, red2, green2, blue2);

assign red   = (switch == 0) ? red1   : red2;
assign green = (switch == 0) ? green1 : green2;
assign blue  = (switch == 0) ? blue1  : blue2;


endmodule
