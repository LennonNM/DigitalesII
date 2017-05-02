# Definición de las instrucciones (C = compile, R = run, S = show)
  C = iverilog
  R = vvp
  S = gtkwave

# Definición de los archivos a usar
  TARGET1 = registro4

  default: comp

reg4:
	$(C) -o $(TARGET1).o -Ttyp test_bench_reg4.v
	$(R) $(TARGET1).o
	$(S) $(TARGET1).vcd

reg32:
	$(C) -o $(TARGET1).o -Ttyp test_bench_reg32.v
	$(R) $(TARGET1).o
	$(S) $(TARGET1).vcd

comp:
	$(C) -o $(TARGET1).o -Ttyp test_bench_comp.v
	$(R) $(TARGET1).o
	$(S) $(TARGET1).vcd

pot:
	$(C) -o $(TARGET1).o -Ttyp test_bench_pot.v
	$(R) $(TARGET1).o
	$(S) $(TARGET1).vcd

clean:
	rm -rf *.o *.out *.vcd
