/*
	exit - exit from the program
	@rdi - status_code of the return value
*/
.global syscall_exit
syscall_exit:
	mov $60, %rax
	jmp ._syscall

._syscall:
	mov %rcx, %r10
	syscall
	ret


