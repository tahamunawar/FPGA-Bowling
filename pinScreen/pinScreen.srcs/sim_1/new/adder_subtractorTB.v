module adderSubtractorTest();
    reg O;
    reg [2:0] A;
    reg [2:0] B;
    wire [6:0] S;
    wire Cout;
    addSubtract A69(O,A,B,S,Cout);
    initial
    begin
    O=0;
    A=3'b011;
    B=3'b100;
    #10
    O=1;
    A=3'b011;
    B=3'b100;
    #10
    O=0;
    A=3'b111;
    B=3'b111;
    #10
    O=1;
    A=3'b010;
    B=3'b110;
    end
endmodule