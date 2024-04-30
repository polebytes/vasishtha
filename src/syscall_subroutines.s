._syscall:
	mov %rcx, %r10
	syscall
	ret

/*
	exit -> exit from the program
	@rdi - status_code of the return value
*/
.global _sys_exit
_sys_exit:
	mov $60, %rax
	jmp ._syscall

/*
	write -> outputs something on the screen
	@rdi: fd;
	@rdi: void address; address to a null-termination string
	@rdx: count; amount of bytes to write on the screen
	@returns: -1 on error, number of bytes written on the screen when success
*/
.global _sys_write
_sys_write:
	mov $1, %rax
	jmp ._syscall




