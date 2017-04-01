module  mux(din_0, din_1 , d, out);

    input din_0, din_1, d;
    output wire out;

    assign out = (d) ? din_1 : din_0;

endmodule
