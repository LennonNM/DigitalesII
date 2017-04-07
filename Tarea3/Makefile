# Definición de las instrucciones (C = compile, R = run, S = show)
  C = iverilog
  R = vvp
  S = gtkwave

# Definición de los archivos a usar
  TARGET = libreria

  default: all

  all:
	$(C) -o $(TARGET).o -Ttyp test_bench.v
	$(R) $(TARGET).o
	$(S) $(TARGET).vcd

  clean:
	rm -rf *.o *.out *.vcd
