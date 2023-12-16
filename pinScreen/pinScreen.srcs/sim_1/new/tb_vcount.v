module tb_VCOUNT();
    reg clk;
    reg enable_v;
    wire [9:0] v_count;
    v_counter v1(.clk(clk),.enable_v(enable_v),.v_count(v_count));
    initial 
    begin
        clk = 1'b0;
        enable_v = 1'b0;
        #100
        enable_v = 1'b1;
    end
    always 
        #5 clk = ~clk;
endmodule