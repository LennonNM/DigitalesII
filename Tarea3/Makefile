# Definición de las instrucciones (C = compile, R = run, S = show)
  C = iverilog
  R = vvp
  S = gtkwave

# Definición de los archivos a usar
  TARGET = NAND.o

  default: all

  all:
	$(C) -o $(TARGET) NAND.v
	$(R) $(TARGET)
	#$(S) .vcd

  clean:
	rm -rf *.o *.out *.vcd
