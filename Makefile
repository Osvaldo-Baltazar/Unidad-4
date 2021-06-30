#Makefile
all: numeros
numeros: numeros.o
  ld -o $@ $+
numeros.o: numeros.s
  as -g -mfpu=vfpv2 -o  $@ $+
clean:
  rm -vf numeros *.o

