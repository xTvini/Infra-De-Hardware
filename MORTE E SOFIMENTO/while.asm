.data
    msg_result: .asciiz "Resultado da soma: "

.text
main:
    li $t0, 0              
    li $t1, 1               

while_loop:
    beq $t1, 0, print_sum   

    li $v0, 5
    syscall
    move $t1, $v0          

    add $t0, $t0, $t1

    j while_loop            

print_sum:
    li $v0, 4
    la $a0, msg_result
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall
