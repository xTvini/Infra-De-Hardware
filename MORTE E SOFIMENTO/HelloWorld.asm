.data
    hello:      .asciiz "hello world\n"   # Declara a string a ser exibida

.text
    main:
        # Syscall para imprimir uma string
        li $v0, 4               # C�digo da syscall para imprimir string
        la $a0, hello           # Carrega o endere�o da string
        syscall                 # Faz a chamada de sistema

        # Syscall para sair do programa
        li $v0, 10              # C�digo da syscall para sair
        syscall                 # Faz a chamada de sistema
