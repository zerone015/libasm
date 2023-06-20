section .text
    global _ft_list_remove_if
_ft_list_remove_if:
    mov r12, rdi                    ; 비휘발성 레지스터에 전달인자 값 저장 (t_list **begin_list)
    mov r13, rsi                    ; 비휘발성 레지스터에 전달인자 값 저장 (void *data_ref)
    mov rbx, rdx                    ; 비휘발성 레지스터에 전달인자 값 저장 (int (*cmp)())
    mov rbp, rcx                    ; 비휘발성 레지스터에 전달인자 값 저장 (void (*free_fct)(void *))
_loop1_start:
    cmp qword [r12], 0              ; *begin_list null check
    je _check_begin_list            ; true 이면 jmp _check_begin_list
    mov rdi, [r12]                  ; *begin_list를 rdi에 저장
    mov rdi, [rdi]                  ; (*begin_list)->data를 rdi에 저장
    mov rsi, r13                    ; data_ref를 rsi에 저장
    sub rsp, 8                      ; 스택 정렬 제약을 맞추기 위해 rsp 8 감소
    call rbx                        ; (*cmp)(rdi, rsi) 호출
    add rsp, 8                      ; 스택 정렬 제약 맞추기 위해 감소시켰던 rsp 복구
    cmp rax, 0                      ; rdi, rsi가 일치하는지 검사 
    jne _check_begin_list           ; 일치하지 않으면 리스트의 맨 앞 원소가 존재하는지 검사하는 _check_begin_list으로 점프 
    mov rdi, [r12]                  ; *begin_list를 rdi에 저장
    mov rax, [rdi + 8]              ; 삭제될 원소의 다음 원소를 메모리에서 레지스터로 적재
    mov [r12], rax                  ; 삭제될 원소의 다음 원소를 리스트의 첫 번째 원소로 이동
    sub rsp, 8                      ; 스택 정렬 제약을 맞추기 위해 rsp 8 감소
    call rbp                        ; (*free_fct)(rdi) 호출 (맨 앞 원소 삭제)
    add rsp, 8                      ; 스택 정렬 제약 맞추기 위해 감소시켰던 rsp 복구    
    jmp _loop1_start                ; 다시 루프
_check_begin_list:
    cmp qword [r12], 0              ; *begin_list null check
    je _end                         ; null이면 더 이상 삭제할 데이터가 없으므로 종료
_loop2_start:
    mov rdi, [r12]                  ; rdi에 *begin_list 저장
    mov rdi, [rdi + 8]              ; rdi에 (*begin_list)->next 저장
    cmp qword rdi, 0                ; (*begin_list)->next null check
    je _end                         ; 원소가 없으면 종료
    mov rdi, [rdi]                  ; rdi에 (*begin_list)->next->data 저장
    mov rsi, r13                    ; rsi에 data_ref를 저장
    sub rsp, 8                      ; 스택 정렬 제약을 맞추기 위해 rsp 8 감소
    call rbx                        ; int (*cmp)(rdi, rsi) 호출
    add rsp, 8                      ; 스택 정렬 제약 맞추기 위해 감소시켰던 rsp 복구    
    cmp rax, 0                      ; rdi, rsi가 일치하는지 검사
    jne _loop2_start                ; 일치하지 않으면 다시 루프 조건 검사로 점프
    mov r8, [r12]                   ; r8에 *begin_list 저장
    mov rdi, [r8 + 8]               ; rdi에 (*begin_list)->next를 삭제하기위해 저장
    mov rax, [rdi + 8]              ; 삭제할 원소의 다음 원소를 메모리에서 레지스터로 적재
    mov [r8 + 8], rax               ; 삭제할 원소의 다음 원소를 삭제할 원소의 이전 원소와 이어준다.
    sub rsp, 8                      ; 스택 정렬 제약을 맞추기 위해 rsp 8 감소
    call rbp                        ; free_fct(rdi) 호출
    add rsp, 8                      ; 스택 정렬 제약 맞추기 위해 감소시켰던 rsp 복구   
    jmp _loop2_start                ; 다시 루프
_end:
    ret    