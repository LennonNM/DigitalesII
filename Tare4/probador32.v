module probador32 (Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);

    output reg CLK, ENB, DIR, S_IN;
    output reg [1:0] MODO;
    output reg [31:0] D;
    input [31:0] Q;
    input S_OUT;

		initial begin
				CLK = 0;
		end

		always begin
				#80 CLK = ~CLK;
		end

	initial begin
  /*Prueba #1 Carga en Paralelo: Se toma como suficiente que cargue el valor de
    D en cada una de las pruebas siguientes*/
		//Prueba #2 rotacion a la izquierda
		    //Habilita lectura del modo
			ENB <= 1'b1;
		    //Establece modo de Carga en Paralelo
		  MODO[1:0] <= 2'b10;
			DIR <= 1'b0;
		  S_IN <= 1'b0;
			D <= 32'h0F00000F;
			//Pone modo de rotacion, como DIR=1 es a la izquierda
			#200 MODO[1:0] <= 2'b0;
			//6 flancos positivos de CLK
			#640;

		//Prueba #3 rotacion a la derecha
		    //Establece modo de Carga en Paralelo
		  MODO[1:0] <= 2'b10;
			DIR <= 1'b1;
			S_IN <= 1'b1;
			D <= 32'hF00000F0;
			//Pone modo de rotacion, como DIR=0 es a la derecha
			#100 MODO[1:0] <= 2'b0;
      //6 flancos positivos de CLK
			#700;

		//Prueba #4 rotacion circular a la izquierda
		    //Establece modo de Carga en Paralelo
      MODO[1:0] <= 2'b10;
			DIR <= 1'b0;
			S_IN <= 1'b1;
			D <= 32'hF0F0F0F0;
			//Pone modo de rotacion, como DIR=1 es a la izquierda
			#155 MODO[1:0] <= 2'b01;
			//Enviando flancos activos en CLK
			#635;

    //Prueba #5 rotacion circular a la derecha
		    //Establece modo de Carga en Paralelo
  		MODO[1:0] <= 2'b10;
			DIR <= 1'b0;
			S_IN <= 1'b1;
			D <= 32'hF0F0F0F0;
			//Pone modo de rotacion, como DIR=0 es a la derecha
			#100 MODO[1:0] <= 2'b01;
			//Enviando flancos activos en CLK
			#710 ;
      
		   #90 $finish;
		end
endmodule
