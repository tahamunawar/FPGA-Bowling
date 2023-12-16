`timescale 1ns / 1ps
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TopLevelBowling(
  input wire [5:0] ir_signal,   // Input from the IR sensor
  input wire  clock,       // Clock signal
  input wire  reset,       // Reset signal
  output wire [5:0] detection   // Output to indicate 
    );
    
    ir_sensor i1(ir_signal[0], clock, reset, detection[0]); 
    ir_sensor i2(ir_signal[1], clock, reset, detection[1]); 
    ir_sensor i3(ir_signal[2], clock, reset, detection[2]) ;
    ir_sensor i4(ir_signal[3], clock, reset, detection[3]) ;
    ir_sensor i5(ir_signal[4], clock, reset, detection[4]) ;
    ir_sensor i6(ir_signal[5], clock, reset, detection[5]) ;
                               
    
   
endmodule
