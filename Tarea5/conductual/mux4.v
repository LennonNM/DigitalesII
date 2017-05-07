module  mux4_con(din_0, din_1, din_2, din_3, d, m, out);

    input din_0, din_1, din_2, din_3, d;
    input [1:0] m;
    output wire out;

    assign out = (m[0]) ? (d) ? din_3 : din_2 : (d) ? din_1 : din_0;

endmodule
