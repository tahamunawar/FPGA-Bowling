module demuxTest();
    reg [1:0] S;
    reg En;
    wire EnA;
    wire EnB;
    wire EnC;
    wire EnD;

    demux_1_4 DM1(S,En,EnA,EnB,EnC,EnD);
    initial
    begin
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