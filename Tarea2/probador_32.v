module probador_32(Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);

    output reg CLK, ENB, DIR, S_IN;
    output reg [1:0] MODO;
    output reg [31:0] D;
    input [31:0] Q;
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
			D <= 32'hF;
			//Pone modo de rotacion, como DIR=0 es a la izquierda
			#2 MODO[1:0] <= 2'b0;
      #1 ENB <= 1'b0;
			//Enviar 4 flancos activos en CLK, luego da otros flancos para percibir salida final de S_OUT
			#8 ;

		//Prueba #2 rotacion a la derecha
		    //Establece modo de Carga en Paralelo
      #1 ENB <= 1'b1;
		  #2 MODO[1:0] <= 2'b10;
			DIR <= 1'b1;
			S_IN <= 1'b1;
			D <= 32'hF;
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
			D <= 32'hF0F0;
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
			D <= 32'h0F0F;
			//Pone modo de rotacion, como DIR=1 es a la derecha
			#2 MODO[1:0] <= 2'b01;
      #1 ENB <= 1'b0;
			//Enviando flancos activos en CLK
			#8 ;

        //Prueba #5 rotacion circular a la derecha
		    //Establece modo de Carga en Paralelo
    /*  #1 ENB <= 1'b1;
  		#1 MODO[1:0] <= 2'b10;
			DIR <= 1'b1;
			S_IN <= 1'b1;
			//D[3:0] <= 4'b0000; //Ya se probo en las pruebas anteriores
			D[3:0] <= 4'b0001;
			#2D[3:0] <= 4'b0010; //Cambiando Valor
      #2D[3:0] <= 4'b0011; //Cambiando Valor
			#2D[3:0] <= 4'b0100; //Cambiando Valor
			#2D[3:0] <= 4'b0101; //Cambiando Valor
			#2D[3:0] <= 4'b0111; //Cambiando Valor
			#2D[3:0] <= 4'b1000; //Cambiando Valor
			#2D[3:0] <= 4'b1001; //Cambiando Valor
			//D[3:0] <= 4'b1010; //Ya se probo en las pruebas anteriores
			//D[3:0] <= 4'b1011; //Ya se probo en las pruebas anteriores
			#2D[3:0] <= 4'b1100; //Cambiando Valor
			//D[3:0] <= 4'b1101; //Ya se probo en las pruebas anteriores
			#2D[3:0] <= 4'b1110; //Cambiando Valor
			#2D[3:0] <= 4'b1111; //Cambiando Valor
			//Ciclo extra para ver ultimo cambio
*/
		    #10 $finish;
		end
endmodule
