section .text
    global _ft_strlen
_ft_strlen:
    mov rax, 0
_loop_start:
    cmp byte [rdi + rax], 0
    je _loop_end
    inc rax
    jmp _loop_start
_loop_end:
    ret