section .text
    global _ft_strlen

_ft_strlen:
    mov rax, 0

loop_start:
    cmp byte [rdi + rax], 0
    je loop_end

    inc rax
    jmp loop_start

loop_end:
    ret
