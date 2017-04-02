module probador8(Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);

    output reg CLK, ENB, DIR, S_IN;
    output reg [1:0] MODO;
    output reg [7:0] D;
    input [7:0] Q;
    input S_OUT;

		initial begin
				CLK = 0;
		end

		always begin
				#1 CLK = ~CLK;
		end

	initial begin
		//Prueba #1 rotacion a la izquierda
		    //Habilita lectura del modo
			ENB <= 1'b1;
		    //Establece modo de Carga en Paralelo
		  #1 MODO[1:0] <= 2'b10;
			DIR <= 1'b0;
		  S_IN <= 1'b0;
			D <= 8'hF;
			//Pone modo de rotacion, como DIR=0 es a la izquierda
			#2 MODO[1:0] <= 2'b0;
      #1 ENB <= 1'b0;
			//Enviar 4 flancos activos en CLK, luego da otros flancos para percibir salida final de S_OUT
			#7 ;

		//Prueba #2 rotacion a la derecha
		    //Establece modo de Carga en Paralelo
      ENB <= 1'b1;
		  #2 MODO[1:0] <= 2'b10;
			DIR <= 1'b1;
			S_IN <= 1'b1;
			D <= 8'hF;
			//Pone modo de rotacion, como DIR=1 es a la derecha
			#2 MODO[1:0] <= 2'b0;
      #1 ENB <= 1'b0;
			//Enviando flancos activos en CLK
			#8 ;

		//Prueba #3 rotacion circular a la izquierda
		    //Establece modo de Carga en Paralelo
      #1 ENB <= 1'b1;
      #2 MODO[1:0] <= 2'b10;
			DIR <= 1'b0;
			S_IN <= 1'b1;
			D <= 8'hF0;
			//Pone modo de rotacion, como DIR=0 es a la izquierda
			#2 MODO[1:0] <= 2'b01;
      #1 ENB <= 1'b0;
			//Enviando flancos activos en CLK
			#8 ;

        //Prueba #4 rotacion circular a la derecha
		    //Establece modo de Carga en Paralelo
      #1 ENB <= 1'b1;
  		#2 MODO[1:0] <= 2'b10;
			DIR <= 1'b1;
			S_IN <= 1'b1;
			D <= 8'h0F;
			//Pone modo de rotacion, como DIR=1 es a la derecha
			#2 MODO[1:0] <= 2'b01;
      #1 ENB <= 1'b0;
			//Enviando flancos activos en CLK
			#8 ;


		    #15 $finish;
		end
endmodule
