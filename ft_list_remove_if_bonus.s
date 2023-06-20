section .text
    global _ft_list_remove_if
_ft_list_remove_if:
    sub rsp, 40
    mov [rsp], r12                  ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov [rsp + 8], r13              ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov [rsp + 16], rbx             ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov [rsp + 24], rbp             ; 비휘발성 레지스터의 기존 값 스택에 보존
    mov r12, rdi                    ; 비휘발성 레지스터에 전달인자 값 저장 (t_list **begin_list)
    mov r13, rsi                    ; 비휘발성 레지스터에 전달인자 값 저장 (void *data_ref)
    mov rbx, rdx                    ; 비휘발성 레지스터에 전달인자 값 저장 (int (*cmp)())
    mov rbp, rcx                    ; 비휘발성 레지스터에 전달인자 값 저장 (void (*free_fct)(void *))
_loop1_start:
    cmp qword [r12], 0              ; 현재 원소 null check
    je _end                         ; 더 이상 삭제할 원소가 없으면 종료
    mov rdi, [r12]                  ; 현재 원소를 rdi에 저장
    mov rdi, [rdi]                  ; 현재 원소의 값을 rdi에 저장
    mov rsi, r13                    ; 비교 값을 rsi에 저장
    call rbx                        ; 삭제 대상인지 검사
    cmp rax, 0                      ; 결과 값 확인
    jne _loop2_prepare              ; 맨 앞 원소가 삭제 대상이 아니면 _loop2_prepare으로 점프
    mov rdi, [r12]                  ; 삭제 대상을 rdi에 저장
    mov rax, [rdi + 8]              ; 삭제될 원소의 다음 원소를 메모리에서 레지스터로 적재
    mov [r12], rax                  ; 삭제될 원소의 다음 원소를 리스트의 맨 앞 원소로 이동
    call rbp                        ; 원소 삭제
    jmp _loop1_start                ; 다시 루프
_loop2_prepare:
    mov r12, [r12]                  ; r12에 맨 앞 원소 저장
_loop2_start:
    cmp qword r12, 0                ; 현재 원소 null check
    je _end                         
    mov rdi, [r12 + 8]              ; rdi에 현재 원소의 다음 원소 저장
    cmp qword rdi, 0                ; 다음 원소 null check
    je _end                         
    mov rdi, [rdi]                  ; rdi에 다음 원소 데이터 저장
    mov rsi, r13                    ; rsi에 비교 데이터 저장
    call rbx                        ; 삭제 대상인지 검사
    cmp rax, 0                      ; 결과 값 확인
    jne _loop2_inc                  ; 삭제 대상이 아니면 다음 원소를 현재 원소로 설정하는 _loop2_inc으로 점프
    mov rdi, [r12 + 8]              ; rdi에 삭제 원소를 저장
    mov rax, [rdi + 8]              ; 삭제할 원소의 다음 원소를 메모리에서 레지스터로 적재
    mov [r12 + 8], rax              ; 삭제할 원소의 다음 원소를 삭제할 원소의 이전 원소와 이어준다.
    call rbp                        ; 원소 삭제
    jmp _loop2_start                ; 다시 루프
_loop2_inc:
    mov r12, [r12 + 8]              ; r12에 다음 원소 설정
    jmp _loop2_start                ; 다시 루프
_end:
    mov r12, [rsp]
    mov r13, [rsp + 8]
    mov rbx, [rsp + 16]
    mov rbp, [rsp + 24]
    add rsp, 40
    ret    