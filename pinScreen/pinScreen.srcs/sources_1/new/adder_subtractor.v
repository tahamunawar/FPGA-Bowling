`timescale 1ns/1ps
//Three bit full adder or Ripple Carry Adder
module addSubtract (
    input O,
    input [2:0] A,
    input [2:0] B,
    output [6:0] S,
    output [3:0] X,
    output Cout
    );
    wire [2:0] C;
    wire carry_U;
    wire [2:0] Sum; 
    wire [3:0] D;
    
    complement C1 (O,B,C);
    ThreebitFA TFA1 (A,C,Sum,carry_U);
    complement C2 (~(~O | carry_U),Sum,D[2:0]);
    assign D[3] = (~O&carry_U);
    assign Cout = (~O | carry_U);
    segmentDecoder SD1(D,S);
    assign X[3] = 0;
    assign X[2] = 1;
    assign X[1] = 1;
    assign X[0] = 1;
    
    
endmodule
