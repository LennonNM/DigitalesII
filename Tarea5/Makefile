# Definición de las instrucciones (C = compile, R = run, S = show)
C = iverilog
R = vvp
S = gtkwave

# Definición de los archivos a usar
TARGET1 = registro
TARGET2 = registro4
.PHONY: gen
.PHONY: cmos
.PHONY: retardo
.PHONY: estructural

default: gen

gen:
	$(C) -o $(TARGET1).o test_bench_con.v
	$(R) $(TARGET1).o
	$(S) $(TARGET1).vcd

cmos:
	$(C) -o $(TARGET1).o -Ttyp test_bench_cmos.v
	$(R) $(TARGET1).o
	$(S) $(TARGET1).vcd

retardo:
	$(C) -o $(TARGET1).o test_bench_ret.v
	$(R) $(TARGET1).o
	$(S) $(TARGET1).vcd

estructural:
	$(C) -o $(TARGET1).o -Ttyp test_bench_est.v
	$(R) $(TARGET1).o
	$(S) $(TARGET2).vcd

clean:
	rm -rf *.o *.out *.vcd
