section .text
    global _ft_strcmp
_ft_strcmp:
    mov rcx, 0
_loop_start:
    cmp byte [rdi + rcx], 0
    je _loop_end
    mov dl, [rdi + rcx]
    cmp [rsi + rcx], dl
    jne _loop_end
    inc rcx
    jmp _loop_start
_loop_end:
    mov al, [rdi + rcx]
    sub al, [rsi + rcx]
    movsx rax, al
    ret