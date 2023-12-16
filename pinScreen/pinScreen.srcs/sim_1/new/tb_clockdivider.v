module tb_CD();
    reg clk;
    wire clk_d;
    clk_div CD1(.clk(clk),.clk_d(clk_d));
    initial 
        clk = 1'b0;
    always 
        #5 clk = ~clk;
endmodule