section .text
    global _ft_atoi_base
_ft_atoi_base:
    mov rcx, -1
_find_radix:
    inc rcx
    mov al, [rsi + rcx]
    cmp al, 0
    je _find_radix_end
    cmp al, 43
    je _ft_atoi_base_err
    cmp al, 45
    je _ft_atoi_base_err
    cmp al, 32
    je _ft_atoi_base_err
    cmp al, 9
    jl _base_duplication_check
    cmp al, 13
    jg _base_duplication_check
    jmp _ft_atoi_base_err
_base_duplication_check:
    mov r11, rcx
    inc r11
_base_duplication_check_loop:
    cmp byte [rsi + r11], 0
    je _find_radix
    cmp al, [rsi + r11]
    je _ft_atoi_base_err
    inc r11
    jmp _base_duplication_check_loop
_find_radix_end:
    cmp rcx, 2
    jl _ft_atoi_base_err
    mov r11, 0
    mov r8, 1
_skip_whitespace:
    mov al, [rdi + r11]
    cmp al, 32
    je _inc_skip_whitespace
    cmp al, 9
    jl _find_sign
    cmp al, 13
    jg _find_sign
    jmp _inc_skip_whitespace
_inc_skip_whitespace:
    inc r11
    jmp _skip_whitespace
_find_sign:
    mov al, [rdi + r11]
    cmp al, 45
    je _set_negative
    cmp al, 43
    je _set_positive
    jmp _ft_atoi
_set_negative:
    mov r8, -1
    inc r11
    jmp _find_sign
_set_positive:
    mov r8, 1
    inc r11
    jmp _find_sign
_ft_atoi:
    mov eax, 0
_ft_atoi_loop_start:
    mov r9b, [rdi + r11]
    cmp r9b, 0
    je _ft_atoi_end
    mov r10, 0
_find_base:
    cmp byte [rsi + r10], 0
    je _ft_atoi_end
    cmp [rsi + r10], r9b
    je _cal_number
    inc r10
    jmp _find_base
_cal_number:
    imul ecx
    add eax, r10d
    inc r11
    jmp _ft_atoi_loop_start
_ft_atoi_end:
    cmp r8, -1
    je _ft_atoi_neg_end
    ret
_ft_atoi_neg_end:
    neg eax
    ret
_ft_atoi_base_err:
    mov eax, 0
    ret