`timescale 1ns/1ps

module probador(CLK, S_IN, ENB, DIR, MODO, D);

    output reg CLK, IN, ENB, DIR, S_IN;
    output reg [1:0] MODO;
    output reg [3:0] D;
    // Configuracion del reloj
		initial begin
				CLK = 0;
		end

		always begin
				#40 CLK = ~CLK; //80 ns entre los flancos positivos del reloj > 71 ns
		end

    initial begin
    //Prueba #1 Carga en Paralelo
      ENB <= 1'b1;
  		MODO[1:0] <= 2'b10;
			DIR <= 1'b1;
			S_IN <= 1'b1;
			#20 D[3:0] <= 4'b0000;
			#85 D[3:0] <= 4'b0001;
			#85 D[3:0] <= 4'b0010;
      #85 D[3:0] <= 4'b0011;
			#85 D[3:0] <= 4'b0100;
			#85 D[3:0] <= 4'b0101;
			#85 D[3:0] <= 4'b0111;
			#85 D[3:0] <= 4'b1000;
			#85 D[3:0] <= 4'b1001;
			#85 D[3:0] <= 4'b1010;
			#85 D[3:0] <= 4'b1011;
			#85 D[3:0] <= 4'b1100;
			#85 D[3:0] <= 4'b1101;
			#85 D[3:0] <= 4'b1110;
			#85 D[3:0] <= 4'b1111;
      #85; //Separador de pruebas en un ciclo

    //Prueba #2 rotacion a la izquierda
      //Preparando condiciones de la prueba
		  #85 DIR <= 1'b1;
		  S_IN <= 1'b1;
			D[3:0] <= 4'b0;
			//Pone modo de rotacion,
			#85 MODO[1:0] <= 2'b0;
      #304 //Envia 4 flancos activos en CLK para resultado final

    //Prueba #3 rotacion a la derecha
      //Preparando condiciones de la prueba
		  #85 DIR <= 1'b0;
		  S_IN <= 1'b0;
			//Pone modo de rotacion,
			#85 MODO[1:0] <= 2'b0;
      #304 //Envia 4 flancos activos en CLK

    //Prueba #4 rotacion circular a la izquierda
      //Preparando condiciones de la prueba
  	  #85 DIR <= 1'b1;
      MODO[1:0] <= 2'b10; //Modo carga para poner valor
  	  S_IN <= 1'b0;
      D[3:0] <= 4'b1001;
  		//Pone modo de rotacion,
  		#85 MODO[1:0] <= 2'b01;
      #304 //Envia 4 flancos activos en CLK

    //Prueba #5 rotacion circular a la derecha
      //Preparando condiciones de la prueba
      #85 DIR <= 1'b0;
      MODO[1:0] <= 2'b10; //Modo carga para poner valor
      S_IN <= 1'b1;
      D[3:0] <= 4'b1001;
    	//Pone modo de rotacion,
    	#85 MODO[1:0] <= 2'b01;
      #304 //Envia 4 flancos activos en CLK

    #200 $finish;
    end

endmodule
