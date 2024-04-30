._syscall:
	mov %rcx, %r10
	syscall
	ret

/*
	exit - exit from the program
	@rdi - status_code of the return value
*/
.global _sys_exit
_sys_exit:
	mov $60, %rax
	jmp ._syscall



