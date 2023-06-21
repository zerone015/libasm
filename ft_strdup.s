section .text
    global _ft_strdup
    extern _ft_strlen
    extern _malloc
    extern _ft_strcpy
_ft_strdup:
    push rdi                ; 복사할 문자열 스택에 보존
    call _ft_strlen         ; 문자열 길이를 잰다.
    inc rax                 ; 널 문자를 추가해야하므로 1 증가
    mov rdi, rax            ; 할당할 사이즈를 전달인자로 넘기기 위해 저장
    call _malloc            ; malloc 호출
    pop rdi                 ; 복사할 문자열을 다시 rdi 레지스터에 적재
    cmp rax, 0              ; malloc 반환 값이 null이면 그대로 종료
    je _end
    mov rsi, rdi            ; 복사할 문자열 주소 저장
    mov rdi, rax            ; 새로 할당한 문자열 주소 저장
    call _ft_strcpy         ; 새로 할당한 문자열에 복사할 문자열 복사
_end: 
    ret