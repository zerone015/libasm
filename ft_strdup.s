section .text
    global _ft_strdup
    extern _ft_strlen
    extern _malloc
    extern _ft_strcpy
    
_ft_strdup:
    push rdi
    call _ft_strlen
    inc rax
    mov rdi, rax
    call _malloc
    pop rdi
    cmp rax, 0
    je end
    mov rsi, rdi
    mov rdi, rax
    call _ft_strcpy
    mov rdi, rsi

end: 
    ret