section .text
    global _ft_strcpy
_ft_strcpy:
    mov rcx, 0
_loop_start:
    cmp byte [rsi + rcx], 0
    je _loop_end
    mov al, [rsi + rcx]
    mov [rdi + rcx], al
    inc rcx
    jmp _loop_start
_loop_end:
    mov byte [rdi + rcx], 0
    mov rax, rdi
    ret