section .text
    extern _malloc
    global _ft_list_push_front
_ft_list_push_front:
    push rcx
    push rdi
    push rsi
    mov rdi, 16
    call _malloc
    pop rsi
    pop rdi
    pop rcx
    cmp rax, 0
    je _end
    mov [rax], rsi
    mov rcx, [rdi]
    mov [rax + 8], rcx
    mov [rdi], rax
_end:
    ret