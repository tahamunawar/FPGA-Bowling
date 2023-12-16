module _FULLADDER(

    );
    
    reg[2:0]mySW;
    wire SUM;
    wire COUT;
    myFULLADDER module_u_test69 (mySW[2],mySW[1],mySW[0],SUM,COUT);
    initial
    begin
    #100 mySW = 3'b000;
    #100 mySW = 3'b001;
    #100 mySW = 3'b010;
    #100 mySW = 3'b011;
    #100 mySW = 3'b100;
    #100 mySW = 3'b101;
    #100 mySW = 3'b110;
    #100 mySW = 3'b111;
     end
endmodule