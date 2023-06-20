section .text
    global _ft_list_size
_ft_list_size:
    mov rax, 1;                 ; 반환 사이즈 1으로 설정
_loop_start:
    cmp qword [rdi + 8], 0      ; 다음 원소가 비었는지 검사
    je _loop_end                ; 비었으면 그대로 종료
    mov rdi, [rdi + 8]          ; rdi에 다음 원소를 저장
    inc rax                     ; 반환 사이즈 증가
    jmp _loop_start             ; 다시 루프
_loop_end:
    ret