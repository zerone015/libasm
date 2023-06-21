section .text
    global _ft_strcpy
_ft_strcpy:
    mov rcx, 0                      ; rcx 0으로 초기화
_loop_start:
    cmp byte [rsi + rcx], 0         ; src 문자열의 끝인지 체크
    je _loop_end
    mov al, [rsi + rcx]             ; 레지스터에 src의 문자 값 저장
    mov [rdi + rcx], al             ; src의 문자 값을 dest에 저장 
    inc rcx                         ; rcx 증가
    jmp _loop_start                 ; 다시 루프
_loop_end:
    mov byte [rdi + rcx], 0         ; dest 문자열의 끝에 \0 저장
    mov rax, rdi                    ; dest의 주소를 반환
    ret