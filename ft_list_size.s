section .text
    global _ft_list_size
_ft_list_size:
    mov rax, 1;
_loop_start:
    cmp qword [rdi + 8], 0
    je _loop_end
    add rdi, 8
    inc rax
    jmp _loop_start
_loop_end:
    ret