section .text
    extern _malloc
    global _ft_list_push_front
_ft_list_push_front:
    sub rsp, 24                 
    mov [rsp + 16], rdi             ; 휘발성 레지스터에 저장된 전달인자 스택에 보존
    mov [rsp + 8], rsi              ; 휘발성 레지스터에 저장된 전달인자 스택에 보존
    mov rdi, 16                     ; rdi에 구조체 크기인 16 저장
    call _malloc                    ; malloc 호출
    mov rdi, [rsp + 16]             ; 스택에 보존되어있던 전달인자 복구
    mov rsi, [rsp + 8]              ; 스택에 보존되어있던 전달인자 복구
    cmp rax, 0                      ; malloc 반환 값 검사
    je end                          ; null 반환되었으면 그대로 종료
    mov [rax], rsi                  ; 새로 생성된 원소의 data 저장
    mov rcx, [rdi]                  ; 기존 첫 번째 원소를 메모리에서 레지스터로 적재
    mov [rax + 8], rcx              ; 기존 첫 번째 원소를 새로 생성된 원소에 연결
    mov [rdi], rax                  ; 새로 생성된 원소를 리스트의 첫 번째 원소로 설정
end:
    add rsp, 24
    ret