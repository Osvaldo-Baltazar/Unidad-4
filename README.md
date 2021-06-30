# Unidad-4
Son los trabajos que no hice de la unidad

Lo primero que se hizo fue  descargar la  aplicacion de git bash 

para sincronizar el git primero hay que clonar la capeta fprog 	que el profe nos dejo
git clone https://github.com/Tectijuana/fprog

creas una carpeta con tu nombre:
cd OsvaldoB

Ingresas a la carpeta fprog
cd fprog

Haces el comando dir y luego el comando ls
dir
ls

Agregar el directorio de tu git
git add OsvaldoB/.

Le escribes un comentario por que todo debe de estar comentado

git commit -n "Mi primer trabajo de git"

Le das en git pull para que se prepare  para subirse
git pull

y luego escribes git push para que se suba
git push

Despues hacemos esto que es para descargar los archivos de numeros



cd
git clone https://github.com/Osvaldo-Baltazar/Unidad-4 (CAMBIAR A SU REPOSITORIO DE ESTUDIANTE)

cd Unidad-4                                      (CAMBIAR A SU REPOSITORIO DE ESTUDIANTE

wget https://github.com/tectijuana/interfaz/raw/master/arm32/codigo/numeros.s

git config --global user.email "osvaldo.batazar19@tectijuana.edu.mx

git config --global user.name "Profe pongame 100 para pasar esta unidad"

nano Makefile

Dentro del Makefile escribimos esto

#Makefile
numeros: numeros.o
  ld -o $@ $+
numeros.o: numeros.s
  as -g -mfpu=vfpv2 -o  $@ $+
clean:
  rm -vf numeros *.o

Y ya como penultimo paso y para que se sincronize escribimos todo esto

git add .      (Si un punto al final, es *.*  es todo lo que esta en ese directorio)
git status
git commit -m "/////PONER MENSAJE DE APORTACION si pude hacerlo profe////"


y por ultimo git push y listo todo se sube a nuestro git

git push


Si aparece esto es que el contenido ya se puede visualizar en github

Username for 'https://github.com': XXXXXX@tectijuana.edu.mx
Password for 'https://XXXXXXXX@tectijuana.edu.mx@github.com': 
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 1.24 KiB | 74.00 KiB/s, done.
Total 5 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/tectijuana/li20b3ej-2-Armenta99
   d0c468d..9ec1dc1  main -> main
