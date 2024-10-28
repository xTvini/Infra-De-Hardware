.data
    aprovado_msg: .asciiz "Aprovado\n"    # Mensagem para aprovado
    reprovado_msg: .asciiz "Reprovado\n"  # Mensagem para reprovado
    a: .word 7        # Limite de média para aprovação
    b: .word 75       # Limite de faltas para aprovação

.text

    li $v0, 5         # Código do syscall para ler um inteiro
    syscall
    move $s0, $v0     # Armazena a primeira nota em $s0

    li $v0, 5
    syscall
    move $s1, $v0     # Armazena a segunda nota em $s1

    # Calcula a média das notas
    add $t0, $s0, $s1 # Soma as notas e armazena em $t0
    li $t1, 2         # Valor 2 para fazer a média
    div $t0, $t1      # Divide $t0 por 2 para obter a média
    mflo $t0          # Armazena o resultado da divisão em $t0 (media)

    # Leitura do número de faltas
    li $v0, 5
    syscall
    move $s2, $v0     # Armazena o número de faltas em $s2

    # Verificar se a média é >= 7 e faltas >= 75
    li $t1, 7         # Limite de média para aprovação
    li $t2, 75        # Limite de faltas para aprovação

    bge $t0, $t1, check_faltas   # Se media >= 7, verificar faltas
    j reprovado                  # Se media < 7, ir para reprovado

check_faltas:
    bge $s2, $t2, aprovado       # Se faltas >= 75, aprovado
    j reprovado                  # Se faltas < 75, reprovado

aprovado:
    li $v0, 4                    # Código do syscall para imprimir string
    la $a0, aprovado_msg         # Carrega a mensagem "Aprovado"
    syscall
    j fim                        # Salta para o fim do programa

reprovado:
    li $v0, 4                    # Código do syscall para imprimir string
    la $a0, reprovado_msg        # Carrega a mensagem "Reprovado"
    syscall

fim:
    li $v0, 10                   # Código do syscall para terminar o programa
    syscall
