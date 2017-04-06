# Definición de las instrucciones (C = compile, R = run, S = show)
  C = iverilog
  R = vvp
  S = gtkwave

# Definición de los archivos a usar
  TARGET = libreria.o

  default: all

  all:
	$(C) -o $(TARGET) test_bench.v probador.v
	$(R) $(TARGET)
	#$(S) $(TARGET).vcd

  clean:
	rm -rf *.o *.out *.vcd
