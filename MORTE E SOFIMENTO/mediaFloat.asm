.data
    msg_input:  .asciiz "Digite a nota da AV1: "
    msg_output: .asciiz "Nota necessária na AV2 para passar: "
    newline:    .asciiz "\n"

.text
main:
    li $v0, 4
    la $a0, msg_input
    syscall

    li $v0, 6               
    syscall
    mov.s $f0, $f0          

    li.s $f2, 7.0          
    sub.s $f12, $f2, $f0   

    li $v0, 4
    la $a0, msg_output
    syscall


    li $v0, 2              
    mov.s $f12, $f12       
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall
