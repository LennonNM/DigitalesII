module  mux_con(din_0, din_1 , d, out);

    input din_0, din_1, d;
    output reg out;

    always @ ( * ) begin
      out <= (d) ? din_1 : din_0;
    end

endmodule
