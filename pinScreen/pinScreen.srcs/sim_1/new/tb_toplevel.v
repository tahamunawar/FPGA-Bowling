module topLevelTest();
    reg [1:0] S;
    reg [3:0] A;
    reg [3:0] B;
    reg [3:0] C;
    reg [3:0] D;
    reg En;
    wire EnA;
    wire EnB;
    wire EnC;
    wire EnD;
    wire [6:0] Y;
    topLevelModule TLM1(A,B,C,D,S,En,Y,EnA,EnB,EnC,EnD);
    initial
    begin
    A = 4'b0000;
    B = 4'b0001;
    C = 4'b0011;
    D = 4'b0111;
    #10
    S = 2'b00;
    En = 1'b0;
    #10
    S = 2'b01;
    En = 1'b0;
    #10
    S = 2'b10;
    En = 1'b0;
    #10
    S = 2'b11;
    En = 1'b0;
    #10
    En = 1'b1;
    end
endmodule