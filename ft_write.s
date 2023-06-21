section .text
    global _ft_write
    extern ___error
_ft_write:
    mov rax, 0x2000004              ; 시스템 콜 번호 저장
    syscall                         ; write 호출      
    jc _err                         ; 캐리 비트가 설정되었으면 _err으로 점프
    ret
_err:
	push rax                        ; errno 스택에 보존
	call ___error                   ; errno 설정할 메모리 주소 가져옴
	pop rdx                         ; 스택에 보존했던 errno를 rdx에 적재
	mov [rax], rdx                  ; errno 설정할 메모리에 errno 저장
	mov rax, -1                     ; 반환 값 -1 설정
	ret