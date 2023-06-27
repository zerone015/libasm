section .text
    global _ft_atoi_base
_ft_atoi_base:
    mov rcx, -1
find_radix:
    inc rcx
    mov al, [rsi + rcx]                 ; base의 문자를 레지스터로 적재
    cmp al, 0                           ; 널문자 검사
    je find_radix_end                   ; 널문자면 점프
    cmp al, 43                          ; 문자가 +인지 검사
    je ft_atoi_base_err                 ; +이면 에러로 점프
    cmp al, 45                          ; 문자가 -인지 검사    
    je ft_atoi_base_err                 ; -이면 에러로 점프
    cmp al, 32                          ; 문자가 스페이스인지 검사
    je ft_atoi_base_err                 ; 스페이스이면 에러로 점프
    cmp al, 9                           ; 문자가 화이트 스페이스인지 검사
    jl base_duplication_check           ; 화이트 스페이스가 아니면 중복 체크로 점프
    cmp al, 13                          ; 문자가 화이트 스페이스인지 검사
    jg base_duplication_check           ; 화이트 스페이스가 아니면 중복 체크로 점프
    jmp ft_atoi_base_err                ; 문자가 화이트 스페이스이면 에러로 점프된다.
base_duplication_check:
    mov r11, rcx                        ; 현재 base 문자의 오프셋을 r11에 복사 
    inc r11                             ; 현재 base 문자의 다음 문자부터 중복 검사를 해야하므로 오프셋 값 1 증가
base_duplication_check_loop:
    cmp byte [rsi + r11], 0             ; 더 이상 중복 검사할 문자가 없는지 확인
    je find_radix                       ; 현재 base 문자의 중복 검사가 끝났으면 다음 base 문자를 검사하기 위해 점프
    cmp al, [rsi + r11]                 ; 현재 base 문자와 다음 문자가 일치하는지 확인
    je ft_atoi_base_err                 ; 중복이면 에러로 점프
    inc r11                             ; 다음 문자를 검사하기 위해 오프셋 증가
    jmp base_duplication_check_loop     ; 다시 중복 검사 루프
find_radix_end:
    cmp rcx, 2                          ; 구한 기수가 2보다 작은지 확인
    jl ft_atoi_base_err                 ; 2보다 작은 기수는 없으므로 에러로 점프
    xor r11d, r11d                      ; str의 오프셋 값으로 사용하기 위해 0으로 초기화
    mov r8b, 1                           ; 반환할 정수를 양수로 초기화
skip_whitespace:
    mov al, [rdi + r11]                 ; str의 문자를 레지스터로 적재
    cmp al, 32                          ; 문자가 스페이스인지 확인
    je inc_skip_whitespace              ; 스페이스이면 오프셋 증가하고 다시 루프
    cmp al, 9                           ; 문자가 화이트 스페이스인지 확인
    jl find_sign                        ; 화이트 스페이스가 아니면 부호를 구하기 위해 점프
    cmp al, 13                          ; 문자가 화이트 스페이스인지 확인
    jg find_sign                        ; 화이트 스페이스가 아니면 부호를 구하기 위해 점프
    jmp inc_skip_whitespace             ; 화이트 스페이스이면 오프셋 증가하고 다시 루프
inc_skip_whitespace:
    inc r11                             ; str의 오프셋 증가
    jmp skip_whitespace                 ; 다시 화이트 스페이스 검사 루프로 점프
find_sign:
    mov al, [rdi + r11]                 ; str의 문자를 레지스터로 적재
    cmp al, 45                          ; 문자가 -인지 검사
    je negate                           ; -이면 음수로 설정하고 다시 루프
    cmp al, 43                          ; 문자가 +인지 검사
    je inc_find_sign                    ; +이면 양수로 설정하고 다시 루프
    jmp ft_atoi                         ; 부호 문자가 아니면 ft_atoi로 점프
negate:
    neg r8b                             ; 부호 반전
inc_find_sign:
    inc r11                             ; str의 오프셋 증가
    jmp find_sign                       ; 다시 부호 검사 루프로 점프
ft_atoi:
    xor eax, eax                        ; 정수 값 0으로 초기화
ft_atoi_loop_start:
    mov r9b, [rdi + r11]                ; str의 현재 문자를 적재
    cmp r9b, 0                          ; 널문자 확인
    je ft_atoi_end                      ; 정수 값을 다 구했으면 end로 점프
    xor r10d, r10d                      ; 베이스 값을 구하기 위해 오프셋을 0으로 초기화
find_base:
    cmp byte [rsi + r10], 0             ; 널문자 확인
    je ft_atoi_end                      ; 널문자라는건 base에 포함되지 않은 문자가 str에 포함된것이므로 atoi 종료
    cmp [rsi + r10], r9b                ; str의 현재 문자와 base의 현재 문자를 비교
    je cal_number                       ; 같으면 base값을 찾았으므로 정수로 계산
    inc r10                             ; 같지 않으면 base값을 계속 찾기 위해 base의 오프셋을 증가
    jmp find_base                       ; 다시 루프
cal_number:
    imul ecx                            ; 자릿수를 증가시키기 위해 곱한다.
    add eax, r10d                       ; str의 현재 문자의 베이스 값을 더한다.
    inc r11                             ; str의 오프셋 증가
    jmp ft_atoi_loop_start              ; 다시 루프
ft_atoi_end:
    cmp r8b, -1                         ; 음수인지 확인
    je ft_atoi_neg_end                  ; 음수이면 음수로 반환하기 위해 점프
    ret     
ft_atoi_neg_end:
    neg eax                             ; 부호를 바꾼다.
    ret                                 
ft_atoi_base_err:
    xor eax, eax
    ret