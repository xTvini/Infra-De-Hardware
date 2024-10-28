.data
    aprovado_msg: .asciiz "Aprovado\n"    # Mensagem para aprovado
    reprovado_msg: .asciiz "Reprovado\n"  # Mensagem para reprovado
    a: .word 7        # Limite de m�dia para aprova��o
    b: .word 75       # Limite de faltas para aprova��o

.text

    li $v0, 5         # C�digo do syscall para ler um inteiro
    syscall
    move $s0, $v0     # Armazena a primeira nota em $s0

    li $v0, 5
    syscall
    move $s1, $v0     # Armazena a segunda nota em $s1

    # Calcula a m�dia das notas
    add $t0, $s0, $s1 # Soma as notas e armazena em $t0
    li $t1, 2         # Valor 2 para fazer a m�dia
    div $t0, $t1      # Divide $t0 por 2 para obter a m�dia
    mflo $t0          # Armazena o resultado da divis�o em $t0 (media)

    # Leitura do n�mero de faltas
    li $v0, 5
    syscall
    move $s2, $v0     # Armazena o n�mero de faltas em $s2

    # Verificar se a m�dia � >= 7 e faltas >= 75
    li $t1, 7         # Limite de m�dia para aprova��o
    li $t2, 75        # Limite de faltas para aprova��o

    bge $t0, $t1, check_faltas   # Se media >= 7, verificar faltas
    j reprovado                  # Se media < 7, ir para reprovado

check_faltas:
    bge $s2, $t2, aprovado       # Se faltas >= 75, aprovado
    j reprovado                  # Se faltas < 75, reprovado

aprovado:
    li $v0, 4                    # C�digo do syscall para imprimir string
    la $a0, aprovado_msg         # Carrega a mensagem "Aprovado"
    syscall
    j fim                        # Salta para o fim do programa

reprovado:
    li $v0, 4                    # C�digo do syscall para imprimir string
    la $a0, reprovado_msg        # Carrega a mensagem "Reprovado"
    syscall

fim:
    li $v0, 10                   # C�digo do syscall para terminar o programa
    syscall
