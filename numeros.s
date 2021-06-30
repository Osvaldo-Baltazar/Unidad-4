@ num_in.s
@ preparar la entrada del usuario para hacer matemáticas

@ registros
@ r1 - puntero al búfer
@ r2 - usado para cargar dígitos
@ r3 - cuenta dígitos
@ r4 - multiplicador
@ r6 - contador
@ r0 - valor de retorno

.sección 	.bss
.comm búfer, 48 	@ reserva búfer de 48 bytes

.section 	.data
msg:
	.ascii 	"Introduzca un número:"
msgLen = . - msg

.sección 	.texto
.globl 	_start
_comienzo:

mov r0, $ 1 		@ mensaje de apertura del programa de impresión	
ldr r1, = mensaje
ldr r2, = msgLen
mov r7, $ 4
svc $ 0

                        @ obtener entrada 
mov r7, $ 3 		@ 3 es la llamada al sistema de "lectura" 
mov r0, $ 1		
ldr r1, = búfer
mov r2, $ 0x30
svc $ 0

                        @ prepararse para convertir ascii a número 
ldrb r2, [r1] @ cargar el primer carácter 
mov r3, $ 0 		@ inicializa r3 como contador

pushDigits:
stmfd sp !, {r2} @ empujar el dígito en la pila
agregar 	r3, r3, $ 1 	@ contador de incremento
ldrb r2, [r1, # 1]! @ cargar el siguiente dígito (usar escritura diferida)
cmp 	r2, $ 0xA 	@ comprobar el código ascii 10
beq convDigits @ saltar a la sección de conversión
bne pushDigits @ o siga empujando

convDigits:
mov r4, $ 1 		@ inicializa el multiplicador a 1
mov r0, $ 0  		@ inicializar número
mov r6, $ 0 		@ inicializar contador

Saltar atrás:
ldmfd sp !, {r2} @ estallar un dígito
cmp  	r2, $ 0x30 	@ ¿es un dígito?
error blt
cmp 	r2, $ 0x39        @ ¿seguro?
error bgt
sub 	r2, r2, $ 0x30 	@ quitar 48 , para obtener el valor del dígito
mul 	r2, r4, r2 @ multiplicarlo por r4
agregar 	r0, r0, r2 @ agregar a r0
agregar 	r6, r6, $ 1 	@ contador de incremento		
cmp 	r6, r3 @ comprobar para ver si está hecho
beq salir
mov      r5, r4, lsl  $ 3         @ multiplicar por diez usando sumas y desplazamientos
sumar      r4, r5, r4, lsl  $ 1     @ x * 8 + x * 2 = x * 10
salto de bal

@ Byte menos significativo disponible a través de "echo $?"

error:
mov r0, $ -1
salida bal

Salida:
mov r7, $ 1 	@ salir de syscall
svc $ 0 		@ wake kernel
.final
