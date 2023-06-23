section .text
    global _ft_strlen
_ft_strlen:
    mov rax, 0                  ; 반환 값 0으로 초기화
loop_start:
    cmp byte [rdi + rax], 0     ; 문자열의 끝인지 검사
    je end                
    inc rax                     ; 반환 값 증가
    jmp loop_start              ; 다시 루프
end:
    ret