.data
    nine: .float 9.0       # Constante 9.0
    five: .float 5.0       # Constante 5.0
    thirty_two: .float 32.0  # Constante 32.0

.text
    # Lê a entrada do usuário (float)
    li $v0, 6          # Código de serviço para ler float
    syscall
    mov.s $f0, $f0     # Temperatura em Celsius

    # Carrega valores constantes para os cálculos
    l.s $f1, nine      # Carrega 9.0 para $f1
    l.s $f2, five      # Carrega 5.0 para $f2
    div.s $f1, $f1, $f2 # Divide 9.0 / 5.0
    mul.s $f0, $f0, $f1 # Multiplica Celsius por 9/5
    l.s $f1, thirty_two # Carrega 32.0 para $f1
    add.s $f0, $f0, $f1 # Adiciona 32 ao resultado

    # Imprime o valor da temperatura convertida
    li $v0, 2          # Código de serviço para imprimir float
    mov.s $f12, $f0    # Passa o resultado para $f12
    syscall

    # Finaliza o programa
    li $v0, 10         # Código de serviço para sair
    syscall
