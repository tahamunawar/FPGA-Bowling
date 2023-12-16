module selectiveComplementTest();
    reg O;
    reg [2:0] B;
    wire [2:0] C;
    complement A1(O,B,C);
    initial
    begin
    O=0;
    B=3'b000;
    #10
    O=1;
    B=3'b000;
    #10
    O=0;
    B=3'b111;
    #10
    O=1;
    B=3'b111;
    #10
    O=1;
    B=3'b100;
    #10
    O=1;
    B=3'b101;
    end
endmodule