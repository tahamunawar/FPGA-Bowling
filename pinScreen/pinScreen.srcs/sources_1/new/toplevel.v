module topLevelModule(
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [1:0] S,
    input En,
    output [6:0] Y,
    output EnA,
    output EnB,
    output EnC,
    output EnD
    );
    wire [3:0] D;
    wire [3:0] O;
    assign D = 4'b0000;
    mux_4_1 mux1(S,A,B,C,D,O);
    segmentDecoder seg1 (O,Y);
    demux_1_4 demux1(S,En,EnA,EnB,EnC,EnD);
endmodule
