section .text
global _ft_strcpy

_ft_strcpy:
    mov rcx, 0

loop_start:
    cmp byte [rsi + rcx], 0
    je loop_end

    mov al, [rsi + rcx]
    mov [rdi + rcx], al
    inc rcx
    jmp loop_start

loop_end:
    mov byte [rdi + rcx], 0
    mov rax, rdi
    ret