module muxTest();
    reg [1:0] S;
    reg [3:0] A;
    reg [3:0] B;
    reg [3:0] C;
    reg [3:0] D;
    wire [3:0] O;
    mux_4_1 M1(S,A,B,C,D,O);
    initial
    begin
    A = 4'b0000;
    B = 4'b0001;
    C = 4'b0011;
    D = 4'b0111;
    #10
    S = 2'b00;
    #10
    S = 2'b01;
    #10
    S = 2'b10;
    #10
    S = 2'b11;
    end
endmodule
