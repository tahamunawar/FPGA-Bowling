`timescale 1ns/1ps
//Three bit full adder or Ripple Carry Adder
module ThreebitFA(
    input [2:0] A,
    input [2:0] B,
    output [2:0] S,
    output Cout
    );
    wire Cout1,Cout2;
    myFULLADDER FA1 (A[0],B[0],0,S[0],Cout1);
    myFULLADDER FA2 (A[1],B[1],Cout1,S[1],Cout2);
    myFULLADDER FA3 (A[2],B[2],Cout2,S[2],Cout);
endmodule
