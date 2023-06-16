section .text
    global _ft_strcmp

_ft_strcmp:
    mov rcx, 0

loop_start:
    cmp byte [rdi + rcx], 0
    je loop_end
    mov dl, [rdi + rcx]
    cmp [rsi + rcx], dl
    jne loop_end

    inc rcx
    jmp loop_start

loop_end:
    mov al, [rdi + rcx]
    sub al, [rsi + rcx]
    movsx eax, al
    ret