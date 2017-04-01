# Definición de las instrucciones (C = compile, R = run, S = show)
  C = iverilog
  R = vvp
  S = gtkwave
 
# Definición de los archivos a usar 
  TARGET4 = registro4
  TARGET32 = registro32
  
  default: reg4

  reg4: $(TARGET4)
	$(C) -o $(TARGET4) reg_desp.v probador.v test_bench.v
	$(R) $(TARGET4)
	$(S) registro4.vcd

  reg32: $(TARGET32)
	$(C) -o $(TARGET32) reg_desp_32.v probador_32.v test_bench_32.v
	$(R) $(TARGET32)
	$(S) registro32.vcd
