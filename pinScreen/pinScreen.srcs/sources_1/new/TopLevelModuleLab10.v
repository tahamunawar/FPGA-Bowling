module toplevelmodulelab10(clk, h_count, v_count);
    input clk;
    output [9:0] h_count;
    output [9:0] v_count;
    wire clk_d;
    wire trig_v;
    clk_div cd1(clk, clk_d);
    h_counter hhh(clk_d, h_count, trig_v);
    v_counter vvv(clk_d, trig_v, v_count);
endmodule