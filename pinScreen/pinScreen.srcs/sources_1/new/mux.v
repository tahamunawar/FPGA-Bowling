module mux_4_1(
    input [1:0] S,
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    output [3:0] O
    );
    
    assign O = S[1] ? (S[0] ? D :C) : (S[0] ?B :A);
endmodule