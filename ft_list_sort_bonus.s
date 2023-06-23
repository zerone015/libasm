section .text
    global _ft_list_sort
_ft_list_sort:
    sub rsp, 40
    mov [rsp], r12                                          ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov [rsp + 8], r13                                      ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov [rsp + 16], r14                                     ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov [rsp + 24], r15                                     ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov [rsp + 32], rbx                                     ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov r12, rdi                                            ; 비휘발성 레지스터에 전달인자 값 저장 (t_list **begin_list)
    mov r13, rsi                                            ; 비휘발성 레지스터에 전달인자 값 저장 (int (*cmp)())
    mov r14, [r12]                                          ; 루프를 시작하기전에 i를 첫 번째 노드로 초기화
loop1_start:
    cmp r14, 0                                              ; null check
    je end                                                  ; 종료
    mov r15, [r12]                                          ; j를 첫 번째 노드로 초기화
loop2_start:
    mov rbx, [r15 + 8]                                      ; j의 다음 노드를 rbp에 저장
    cmp rbx, 0                                              ; null check
    je increse_loop1
    mov rdi, [r15]                                          ; cmp를 호출하기 전에 현재 노드의 data를 첫 번째 파라미터로 설정
    mov rsi, [rbx]                                          ; cmp를 호출하기 전에 다음 노드의 data를 두 번째 파라미터로 설정
    call r13                                                ; cmp 호출
    cmp rax, 0                                              ; 정렬 대상인지 비교
    jng increse_loop2
    mov rdx, [r15]                                          ; j의 data를 레지스터에 저장
    mov rcx, [rbx]                                          ; 다음 노드의 data를 레지스터에 저장
    mov [r15], rcx                                          ; j의 data를 다음 노드의 data로 초기화
    mov [rbx], rdx                                          ; 다음 노드의 data를 j의 data로 초기화
increse_loop2:
    mov r15, rbx                                            ; j를 다음 노드로 초기화
    jmp loop2_start                                         ; 다시 루프
increse_loop1:
    mov r14, [r14 + 8]                                      ; i를 다음 노드로 초기화
    jmp loop1_start                                         ; 다시 루프
end: 
    mov r12, [rsp]
    mov r13, [rsp + 8]
    mov r14, [rsp + 16]
    mov r15, [rsp + 24]
    mov rbx, [rsp + 32]
    add rsp, 40
    ret