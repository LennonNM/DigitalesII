module reg_desp(Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);
    //Declaracion de entradas y salidas
    input CLK, ENB, DIR, S_IN;
    input [1:0] MODO;
    input [3:0] D;
    output reg [3:0] Q;
    output reg S_OUT;

    //registro temporarl para el modo
	  reg [1:0] MODO_TEMP;

  initial begin
    Q[3:0] <= 0;
  end
//Verificacion de habilitacion de lectura del modo
always @(MODO) begin
        if (ENB == 1'b1) begin
			        MODO_TEMP <= MODO;
          end
		    else begin
			        MODO_TEMP <= MODO_TEMP;
        end
  end

  always @(posedge CLK) begin
      case (MODO_TEMP)
        2'b0: //Desp Izquierda
             if (DIR == 1'b0) begin
                  Q <= {Q[2:0],S_IN};
                  S_OUT <= Q[3];
              end
              else begin //Desp derecha
                  Q <= {S_IN,Q[3:1]};
                  S_OUT <= Q[0];
              end
        2'b1: //Rotacion izq
             if (DIR == 1'b0) begin
			            Q <= {Q[2:0],Q[3]};
              end
	    	    	else begin //Rotacion derecha
                  Q <= {Q[0],Q[3:1]};
              end
        2'b10: //Carga en paralelo
             Q[3:0] <= D[3:0];
      endcase
	end

endmodule
