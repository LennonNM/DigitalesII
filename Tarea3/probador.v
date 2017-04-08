module probador(A, B, S, I1, I2, NCLR, CLK, D);

    output reg A, B, S, I1, I2, NCLR, CLK, D, CLK2;
    // Configuracion del reloj normal
		initial begin
				CLK = 0;
		end

		always begin
				#1 CLK = ~CLK;
		end
    //Configuracion reloj para el FF
    initial begin
				CLK2 = 0;
		end

		always begin
				#20 CLK = ~CLK;
		end

    initial begin
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
      #10 S <= 1'b1;

    //FF
    #5;
      D <= 1'b1;
      NCLR <= 1'b1;
      #50 D <= 1'b0;
      #50 D <= 1'b1;
      NCLR <= 1'b0;

      #15 $finish;
    end

endmodule
