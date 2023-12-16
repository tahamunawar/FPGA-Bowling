module demux_1_4(
    input [1:0] S,
    input En,
    output EnA,
    output EnB,
    output EnC,
    output EnD
    );
    assign EnA = {S[1],S[0],En} == 3'b000 ? 1'b0:1'b1;
    assign EnB = {S[1],S[0],En} == 3'b010 ? 1'b0:1'b1;
    assign EnC = {S[1],S[0],En} == 3'b100 ? 1'b0:1'b1;
    assign EnD = {S[1],S[0],En} == 3'b110 ? 1'b0:1'b1;
    
    
endmodule