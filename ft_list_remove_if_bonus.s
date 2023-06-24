section .text
    global _ft_list_remove_if
_ft_list_remove_if:
    cmp qword [rdi], 0
    je end
    sub rsp, 40
    mov [rsp], r12                      ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov [rsp + 8], r13                  ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov [rsp + 16], rbx                 ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov [rsp + 24], rbp                 ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov [rsp + 32], r14                 ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov r12, rdi                        ; 비휘발성 레지스터에 전달인자 값 저장 (t_list **begin_list)
    mov r13, rsi                        ; 비휘발성 레지스터에 전달인자 값 저장 (void *data_ref)
    mov rbx, rdx                        ; 비휘발성 레지스터에 전달인자 값 저장 (int (*cmp)())
    mov rbp, rcx                        ; 비휘발성 레지스터에 전달인자 값 저장 (void (*free_fct)(void *))
    mov r14, [r12]                      ; 첫 번째 노드 저장
loop_start:
    cmp qword [r14 + 8], 0              ; 다음 노드 null check
    je check_first_node                 ; 첫 번째 노드가 삭제 대상인지 검사하기 위해 점프
    mov rdi, [r14 + 8]                  ; 다음 노드를 저장
    mov rdi, [rdi]                      ; cmp를 호출하기 전에 다음 노드의 data를 첫 번째 파라미터로 저장
    mov rsi, r13                        ; cmp를 호출하기 전에 data_ref를 두 번째 파라미터에 저장
    call rbx                            ; cmp 호출
    cmp rax, 0                          ; 삭제 대상인지 확인
    je remove_node                      ; 노드를 삭제하기 위해 점프
    mov r14, [r14 + 8]                  ; 현재 노드를 다음 노드로 설정
    jmp loop_start                      ; 다시 루프
remove_node:
    mov rdi, [r14 + 8]                  ; free_fct를 호출하기 전에 삭제할 노드를 첫 번째 파라미터에 저장
    mov rdx, [rdi + 8]                  ; 레지스터에 삭제할 노드의 다음 노드 주소를 저장
    mov [r14 + 8], rdx                  ; 현재 노드의 다음 노드가 삭제할 노드의 다음 노드가 되도록 설정
    call rbp                            ; free_fct 호출
    jmp loop_start                      ; 다시 루프
check_first_node:
    mov r14, [r12]                      ; 첫 번째 노드를 저장
    mov rdi, [r14]                      ; cmp를 호출하기 전에 첫 번째 노드의 data를 첫 번째 파라미터로 저장
    mov rsi, r13                        ; cmp를 호출하기 전에 data_ref를 두 번째 파라미터로 저장
    call rbx                            ; cmp를 호출
    cmp rax, 0                          ; 삭제 대상인지 확인
    jne clean_up                        ; 삭제 대상이 아니면 종료
remove_first_node:
    mov rdi, r14                        ; free_fct를 호출하기 전에 첫 번째 노드를 첫 번째 파라미터에 저장
    mov rdx, [rdi + 8]                  ; 첫 번째 노드의 다음 노드를 저장
    mov [r12], rdx                      ; 첫 번째 노드의 다음 노드를 첫 번째 노드로 설정
    call rbp                            ; free_fct 호출
clean_up:
    mov r12, [rsp]
    mov r13, [rsp + 8]
    mov rbx, [rsp + 16]
    mov rbp, [rsp + 24]
    mov r14, [rsp + 32]
    add rsp, 40
end:
    ret