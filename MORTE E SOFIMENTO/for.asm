.data
    newline:    .asciiz "\n"

.text
main:
    li $t0, 0             

for_loop:
    ble $t0, 10, print_i   
    j end_for               

print_i:
    li $v0, 1             
    move $a0, $t0           

    # Imprime nova linha
    li $v0, 4
    la $a0, newline
    syscall

    addi $t0, $t0, 1      
    j for_loop

end_for:
    li $v0, 10             
    syscall
