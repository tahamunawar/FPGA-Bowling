`timescale 1ns / 1ps

module myFULLADDER(
    input Cin,
    input A,
    input B,
    output Sum,
    output Cout
    );
    wire xor_1;
    wire and_1;
    wire and_2;
    
    myXOR g1(A, B, xor_1);
    myAND g2(A, B, and_1);
    myXOR g3(xor_1, Cin, Sum);
    myAND g4(Cin, xor_1, and_2);
    myOR g5(and_1, and_2, Cout);
endmodule
