module tb();
    reg [2:0] A;
    reg [2:0] B;
    wire [2:0] S;
    wire Cout;
    ThreebitFA
tesetmodule(A,B,S,Cout)
;
    initial
    begin
    A=3'b000;
    B=3'b000;
    #10
    A=3'b111;
    B=3'b101;
    #10
    A=3'b110;
    B=3'b011;
    #10
    A=3'b010;
    B=3'b001;
    #10
    A=3'b111;
    B=3'b111;
    end
endmodule