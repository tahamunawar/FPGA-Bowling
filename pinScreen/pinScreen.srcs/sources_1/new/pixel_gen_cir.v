`timescale 1ns / 1ps

module GameScreen(
    input clk_d,
    input [9:0] pixel_x,
    input [9:0] pixel_y,
    input video_on,
    input reset,       // Reset signal
    input wire [5:0] ir_signal,   // Input from the IR sensor
    output reg [3:0] red = 0,
    output reg [3:0] green = 0,
    output reg [3:0] blue = 0  
);
    reg [9:0] PinX_1 = 40; 
    reg [8:0] PinY_1 = 100;
    reg [9:0] PinX_2 = 290; 
    reg [8:0] PinY_2 = 100; 
    reg [9:0] PinX_3 = 540; 
    reg [8:0] PinY_3 = 100;
    reg [9:0] PinX_4 = 160; 
    reg [8:0] PinY_4 = 180;
    reg [9:0] PinX_5 = 420; 
    reg [8:0] PinY_5 = 180;
    reg [9:0] PinX_6 = 290; 
    reg [8:0] PinY_6 = 290;
    reg [9:0] ScoreX = 50;
    reg [8:0] ScoreY = 1;
    reg [9:0] OneX = 110;
    reg [8:0] OneY = 1;
    reg [9:0] ZeroX = 10;
    reg [8:0] ZeroY = 1;
    reg [9:0] TwoX = 210;
    reg [8:0] TwoY = 1;
    reg [9:0] ThreeX = 310;
    reg [8:0] ThreeY = 1;
    reg [9:0] FourX = 10;
    reg [8:0] FourY = 1;
    reg [9:0] FiveX = 110;
    reg [8:0] FiveY = 1;
    reg [9:0] SixX = 210;
    reg [8:0] SixY = 1;   

    localparam PinWidth = 64; 
    localparam PinHeight = 180;
    wire [7:0] dout;  
    reg [13:0] address; // 2^15 or 32768, need 114 x 159 = 18126
    pinRom pr (
        .address(address[13:0]),
        .clk_pix(clk_d),
        .dataout(dout)
    );   
    reg [7:0] palette [0:23];              // 8 bit values from the 192 hex entries in the colour palette
    reg [7:0] COL = 0;                      // background colour palette value
    initial begin
        $readmemh("finalPinPal.mem", palette); // load 192 hex values into "palette"
    end  
    
        // this is for the score mem
    
//    localparam ScoreWidth = 425; 
//    localparam ScoreHeight = 91;
//    wire [7:0] dout2;  
//    reg [15:0] address2; 
//    scoreRom sr (
//        .address(address2[15:0]),
//        .clk_pix(clk_d),
//        .dataout(dout2)
//    );   
//    reg [7:0] palette2 [0:5];              // 8 bit values from the 192 hex entries in the colour palette
//    reg [7:0] COL2 = 0;                      // background colour palette value
//    initial begin
//        $readmemh("scorePicPal.mem", palette2); // load 192 hex values into "palette"
//    end  
    
    // this if for one mem
    localparam OneWidth = 83; 
    localparam OneHeight = 90;
    wire [7:0] dout_one;  
    reg [12:0] address_one; 
    oneRom ONEROM (
        .address(address_one[12:0]),
        .clk_pix(clk_d),
        .dataout(dout_one)
    );   
    
    // this if for zero mem
    localparam ZeroWidth = 71; 
    localparam ZeroHeight = 94;
    wire [7:0] dout_zero;  
    reg [12:0] address_zero; 
    zeroRom ZeroROM (
        .address(address_zero[12:0]),
        .clk_pix(clk_d),
        .dataout(dout_zero)
    ); 
    
    // this is for two mem
    localparam TwoWidth = 70; 
    localparam TwoHeight = 94;
    wire [7:0] dout_two;  
    reg [12:0] address_two; 
    twoRom TwoROM (
        .address(address_two[12:0]),
        .clk_pix(clk_d),
        .dataout(dout_two)
    );
    
    // this is for three mem
    localparam ThreeWidth = 71; 
    localparam ThreeHeight = 96;
    wire [7:0] dout_three;  
    reg [12:0] address_three; 
    threeRom ThreeROM (
        .address(address_three[12:0]),
        .clk_pix(clk_d),
        .dataout(dout_three)
    );
    
    // this if for four mem
    localparam FourWidth = 73; 
    localparam FourHeight = 95;
    wire [7:0] dout_four;  
    reg [12:0] address_four; 
    fourRom FourROM (
        .address(address_four[12:0]),
        .clk_pix(clk_d),
        .dataout(dout_four)
    );
    
    // this if for five mem
    localparam FiveWidth = 73; 
    localparam FiveHeight = 96;
    wire [7:0] dout_five;  
    reg [12:0] address_five; 
    fiveRom FiveROM (
        .address(address_five[12:0]),
        .clk_pix(clk_d),
        .dataout(dout_five)
    );    
    
    // this is for six mem
    localparam SixWidth = 74; 
    localparam SixHeight = 95;
    wire [7:0] dout_six;  
    reg [12:0] address_six; 
    sixRom SixROM (
        .address(address_six[12:0]),
        .clk_pix(clk_d),
        .dataout(dout_six)
    );    
    
    // masterpal same for all nums so will only do this once
    reg [7:0] master_pal [0:5];              // 8 bit values from the 192 hex entries in the colour palette
    reg [7:0] master_col = 0;                      // background colour palette value
    initial begin
        $readmemh("masterPal.mem", master_pal); // load 192 hex values into "palette"
    end  

    
    
    wire [5:0] data;
    TopLevelBowling t1(ir_signal, clk_d, reset, data);
    
    reg [7:0] score;
    integer i;
    
     always 
     begin 
     score = 0;
        for (i = 0; i < 8; i = i + 1) begin
         score = score + data[i];
      end
      end
    
    always @(posedge clk_d)
        if ((pixel_x == 0) || (pixel_x == 639) || (pixel_y == 0) || (pixel_y == 479)) begin
            red <= 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
        end
        else 
        begin
                if ((pixel_x >= PinX_1) && (pixel_x < PinX_1 + PinWidth) && (pixel_y >= PinY_1) && (pixel_y < PinY_1 + PinHeight) && data[0] == 0)
                    begin
                        address <= (pixel_x - PinX_1) + ((pixel_y - PinY_1) * PinWidth);
                        red = (palette[(dout*3)])>>4;    // RED bits(7:4) from colour palette
                        green = (palette[(dout*3)+1])>>4;  // GREEN bits(7:4) from colour palette
                        blue = (palette[(dout*3)+2])>>4;  // BLUE bits(7:4) from colour palette
                    end
                else if ((pixel_x >= PinX_2) && (pixel_x < PinX_2 + PinWidth) && (pixel_y >= PinY_2) && (pixel_y < PinY_2 + PinHeight) && data[1] == 0)
                    begin
                        address <= (pixel_x - PinX_2) + ((pixel_y - PinY_2) * PinWidth);
                        red = (palette[(dout*3)])>>4;    // RED bits(7:4) from colour palette
                        green = (palette[(dout*3)+1])>>4;  // GREEN bits(7:4) from colour palette
                        blue = (palette[(dout*3)+2])>>4;  // BLUE bits(7:4) from colour palette
                    end
                else if ((pixel_x >= PinX_3) && (pixel_x < PinX_3 + PinWidth) && (pixel_y >= PinY_3) && (pixel_y < PinY_3 + PinHeight) && data[2] == 0)
                    begin
                        address <= (pixel_x - PinX_3) + ((pixel_y - PinY_3) * PinWidth);
                        red = (palette[(dout*3)])>>4;    // RED bits(7:4) from colour palette
                        green = (palette[(dout*3)+1])>>4;  // GREEN bits(7:4) from colour palette
                        blue = (palette[(dout*3)+2])>>4;  // BLUE bits(7:4) from colour palette
                    end
                else if ((pixel_x >= PinX_4) && (pixel_x < PinX_4 + PinWidth) && (pixel_y >= PinY_4) && (pixel_y < PinY_4 + PinHeight) && data[3] == 0)
                    begin
                        address <= (pixel_x - PinX_4) + ((pixel_y - PinY_4) * PinWidth);
                        red = (palette[(dout*3)])>>4;    // RED bits(7:4) from colour palette
                        green = (palette[(dout*3)+1])>>4;  // GREEN bits(7:4) from colour palette
                        blue = (palette[(dout*3)+2])>>4;  // BLUE bits(7:4) from colour palette
                    end
                else if ((pixel_x >= PinX_5) && (pixel_x < PinX_5 + PinWidth) && (pixel_y >= PinY_5) && (pixel_y < PinY_5 + PinHeight) && data[4] == 0)
                    begin
                        address <= (pixel_x - PinX_5) + ((pixel_y - PinY_5) * PinWidth);
                        red = (palette[(dout*3)])>>4;    // RED bits(7:4) from colour palette
                        green = (palette[(dout*3)+1])>>4;  // GREEN bits(7:4) from colour palette
                        blue = (palette[(dout*3)+2])>>4;  // BLUE bits(7:4) from colour palette
                    end
                else if ((pixel_x >= PinX_6) && (pixel_x < PinX_6 + PinWidth) && (pixel_y >= PinY_6) && (pixel_y < PinY_6 + PinHeight) && data[5] == 0)
                    begin
                        address <= (pixel_x - PinX_6) + ((pixel_y - PinY_6) * PinWidth);
                        red = (palette[(dout*3)])>>4;    // RED bits(7:4) from colour palette
                        green = (palette[(dout*3)+1])>>4;  // GREEN bits(7:4) from colour palette
                        blue = (palette[(dout*3)+2])>>4;  // BLUE bits(7:4) from colour palette
                    end 
                 else if ((pixel_x >= OneX) && (pixel_x < OneX + OneWidth) && (pixel_y >= OneY) && (pixel_y < OneY + OneHeight) && score == 1 ) // for generating one
                    begin
                        address_one <= (pixel_x - OneX) + ((pixel_y - OneY) * OneWidth);
                        red = (master_pal[(dout_one*3)])>>4;    
                        green = (master_pal[(dout_one*3)+1])>>4; 
                        blue = (master_pal[(dout_one*3)+2])>>4;  
                    end 
                else if ((pixel_x >= ZeroX) && (pixel_x < ZeroX + ZeroWidth) && (pixel_y >= ZeroY) && (pixel_y < ZeroY + ZeroHeight) && score == 0) // for generation zero
                    begin
                        address_zero <= (pixel_x - ZeroX) + ((pixel_y - ZeroY) * ZeroWidth);
                        red = (master_pal[(dout_zero*3)])>>4;    
                        green = (master_pal[(dout_zero*3)+1])>>4; 
                        blue = (master_pal[(dout_zero*3)+2])>>4;  
                    end       
                 else if ((pixel_x >= TwoX) && (pixel_x < TwoX + TwoWidth) && (pixel_y >= TwoY) && (pixel_y < TwoY + TwoHeight) && score == 2 ) // for generating two
                    begin
                        address_two <= (pixel_x - TwoX) + ((pixel_y - TwoY) * TwoWidth);
                        red = (master_pal[(dout_two*3)])>>4;    
                        green = (master_pal[(dout_two*3)+1])>>4; 
                        blue = (master_pal[(dout_two*3)+2])>>4;  
                    end    
                 else if ((pixel_x >= ThreeX) && (pixel_x < ThreeX + ThreeWidth) && (pixel_y >= ThreeY) && (pixel_y < ThreeY + ThreeHeight) && score == 3 ) // for generating three
                    begin
                        address_three <= (pixel_x - ThreeX) + ((pixel_y - ThreeY) * ThreeWidth);
                        red = (master_pal[(dout_three*3)])>>4;    
                        green = (master_pal[(dout_three*3)+1])>>4; 
                        blue = (master_pal[(dout_three*3)+2])>>4;  
                    end
                 else if ((pixel_x >= FourX) && (pixel_x < FourX + FourWidth) && (pixel_y >= FourY) && (pixel_y < FourY + FourHeight) && score == 4 ) // for generating four
                    begin
                        address_four <= (pixel_x - FourX) + ((pixel_y - FourY) * FourWidth);
                        red = (master_pal[(dout_four*3)])>>4;    
                        green = (master_pal[(dout_four*3)+1])>>4; 
                        blue = (master_pal[(dout_four*3)+2])>>4;  
                    end
                 else if ((pixel_x >= FiveX) && (pixel_x < FiveX + FiveWidth) && (pixel_y >= FiveY) && (pixel_y < FiveY + FiveHeight) && score == 5 ) // for generating five
                    begin
                        address_five <= (pixel_x - FiveX) + ((pixel_y - FiveY) * FiveWidth);
                        red = (master_pal[(dout_five*3)])>>4;    
                        green = (master_pal[(dout_five*3)+1])>>4; 
                        blue = (master_pal[(dout_five*3)+2])>>4;  
                    end
                 else if ((pixel_x >= SixX) && (pixel_x < SixX + SixWidth) && (pixel_y >= SixY) && (pixel_y < SixY + SixHeight) && score == 6 ) // for generating six
                    begin
                        address_six <= (pixel_x - SixX) + ((pixel_y - SixY) * SixWidth);
                        red = (master_pal[(dout_six*3)])>>4;    
                        green = (master_pal[(dout_six*3)+1])>>4; 
                        blue = (master_pal[(dout_six*3)+2])>>4;  
                    end                                                                     
                else                
                    begin
                     //the three lines are working properly i am commenting them out for experimentation
                        red <= (palette[(COL*3)])>>4;     // RED bits(7:4) from colour palette
                        green <= (palette[(COL*3)+1])>>4;   // GREEN bits(7:4) from colour palette
                        blue <= (palette[(COL*3)+2])>>4;   // BLUE bits(7:4) from colour palette
                    end                    
            end
endmodule
