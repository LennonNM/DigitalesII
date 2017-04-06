module probador(A, B, S, I1, I2, NCLR, CLK, D, Y, Q);

    output reg A, B, S, I1, I2, NCLR, CLK, D;
    input Y, Q;
    // Configuracion del reloj
		initial begin
				CLK = 0;
		end

		always begin
				#1 CLK = ~CLK;
		end

endmodule
