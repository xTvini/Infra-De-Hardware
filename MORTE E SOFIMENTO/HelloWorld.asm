.data
    hello:      .asciiz "hello world\n"   # Declara a string a ser exibida

.text
    main:
        # Syscall para imprimir uma string
        li $v0, 4               # Código da syscall para imprimir string
        la $a0, hello           # Carrega o endereço da string
        syscall                 # Faz a chamada de sistema

        # Syscall para sair do programa
        li $v0, 10              # Código da syscall para sair
        syscall                 # Faz a chamada de sistema
