# Definición de las instrucciones (C = compile, R = run, S = show)
  C = iverilog
  R = vvp
  S = gtkwave

# Definición de los archivos a usar
  TARGET1 = registro4

  default: reg4

  reg4:
	$(C) -o $(TARGET1).o -Ttyp test_bench.v
	$(R) $(TARGET1).o
	$(S) $(TARGET1).vcd

  clean:
	rm -rf *.o *.out *.vcd
