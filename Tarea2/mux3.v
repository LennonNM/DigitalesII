module  mux3(din_0, din_1, din_2, d, m, out);

    input din_0, din_1, din_2, d;
    input [1:0] m;
    output wire out;

    assign out = (m) ? (d) ? din_1 : din_2 : (d) ? din_1 : din_0;

endmodule
