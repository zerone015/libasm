section .text
    global _ft_list_size
_ft_list_size:
    mov rax, 0                  ; 0으로 초기화
loop_start:
    cmp qword rdi, 0            ; null check
    je end                      ; 종료
    mov rdi, [rdi + 8]          ; rdi에 다음 원소를 저장
    inc rax                     ; 반환 사이즈 증가
    jmp loop_start              ; 다시 루프
end:
    ret