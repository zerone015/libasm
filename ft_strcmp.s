section .text
    global _ft_strcmp
_ft_strcmp:
    mov rcx, 0                      ; rcx 0으로 초기화
_loop_start:
    cmp byte [rdi + rcx], 0         ; 문자열 끝 체크
    je _loop_end                    ; 문자열 끝이면 종료  
    mov dl, [rdi + rcx]             ; 문자를 메모리에서 rdx 레지스터 하위 8비트에 적재
    cmp [rsi + rcx], dl             ; 문자 값이 같은지 비교
    jne _loop_end                   ; 같지 않으면 종료
    inc rcx                         ; rcx 값 증가
    jmp _loop_start                 ; 다시 루프
_loop_end:
    mov al, [rdi + rcx]             ; rax 레지스터 하위 8비트에 s1 아스키 코드 값 저장
    sub al, [rsi + rcx]             ; s1 아스키 코드 값에서 s2 아스키 코드 값을 뺌
    movsx rax, al                   ; 하위 8비트를 제외한 나머지 비트 부호확장
    ret