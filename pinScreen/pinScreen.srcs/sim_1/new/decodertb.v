module segmentDecoderTest();
    reg [3:0] dD;
    wire [6:0] dS;
    
    segmentDecoder I1(dD,dS);
    
    initial 
        begin
            dD = 4'h0;
            #10 dD = 4'h1; // h represents hexadecimal
            #10 dD = 4'h2;
            #10 dD = 4'h3;
            #10 dD = 4'h4;
            #10 dD = 4'h5;
            #10 dD = 4'h6;
            #10 dD = 4'h7;
            #10 dD = 4'h8;
            #10 dD = 4'h9;
            #10 dD = 4'hA;
            #10 dD = 4'hB;
            #10 dD = 4'hC;
            #10 dD = 4'hD;
            #10 dD = 4'hE;
            #10 dD = 4'hF;
            
            $monitor("Time=%0d, D=%4b. S=%7b\n", $time, dD, dS );
        end
endmodule

