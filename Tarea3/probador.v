module probador(A, B, S, I1, I2, NCLR, CLK, D);

    output reg A, B, S, I1, I2, NCLR, CLK, D;
    // Configuracion del reloj normal
		initial begin
				CLK = 0;
		end

		always begin
				#40 CLK = ~CLK;
		end

    initial begin
    //FF
      D <= 1'b1;
      NCLR <= 1'b0;
      #75 D <= 1'b0;
      #50 NCLR <= 1'b1;
      #55 D <= 1'b1;

    //Compuertas Logicas
      A <= 1'b1;
      B <= 1'b0;
      #15 A <= 1'b1;
      B <= 1'b1;
      #15 A <= 1'b0;
      B <= 1'b1;
      #15 A <= 1'b0;
      B <= 1'b0;

    //Mux
    #15;
      I1 <= 1'b1;
      I2 <= 1'b0;
      S <= 1'b0;
      #15 S <= 1'b1;

      #100 $finish;
    end

endmodule
