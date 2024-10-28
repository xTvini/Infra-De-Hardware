.data

.text
li $v0,5
syscall
move $s0,$v0

li $v0,5
syscall
move $s1,$v0

add $t0,$s0,$s1 # adiciona s0 e s2 no valor t0
li $t1,2 #inicia o valor t1 como 2
div $t0,$t0,$t1 #divide a armazena no valor t0

li $v0,5
syscall
move $s0,$v0



li  $v0,1
move $a0,$t0
syscall
