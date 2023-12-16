module _AND(
    
    );
    reg[1:0]mySW;
    wire myLED;
    myAND module_u_test (mySW[1], mySW[0], myLED);
    initial
    begin
    #100 mySW = 2'b00;
    #100 mySW = 2'b01;
    #100 mySW = 2'b10;
    #100 mySW = 2'b11;
    end
endmodule
