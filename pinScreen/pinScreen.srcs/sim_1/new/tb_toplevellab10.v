module tb_TLM();
    reg clk;
    wire [9:0] v_count;
    wire [9:0] h_count;
    toplevelmodulelab10 trex(.clk(clk),.h_count(h_count), .v_count(v_count));    
    initial 
        clk = 1'b0;
    always 
        #5 clk = ~clk;
endmodule