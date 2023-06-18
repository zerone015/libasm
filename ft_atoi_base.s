section .text
    global _ft_atoi_base
_ft_atoi_base:
    mov rcx, 0
_find_radix:
    cmp rsi[rcx], 0
    je _find_radix_end
    cmp rsi[rcx], 43
    je _ft_atoi_base_err
    cmp rsi[rcx], 45
    je _ft_atoi_base_err
    cmp rsi[rcx], 32
    je _ft_atoi_base_err
    cmp rsi[rcx], 9
    jl _base_duplication_check
    cmp rsi[rcx], 13
    jg _base_duplication_check
    jmp _ft_atoi_base_err
_base_duplication_check:
    inc rcx
    mov rdx, rcx
_base_duplication_check_loop:
    cmp rsi[rdx], 0
    je _find_radix
    cmp byte rsi[rcx], byte rsi[rdx]
    je _ft_atoi_base_err
    inc rdx
    jmp _base_duplication_check_loop

_find_radix_end:
    cmp rcx, 2
    jl _ft_atoi_base_err


_ft_atoi_base_err:
    mov rax, 0
    ret