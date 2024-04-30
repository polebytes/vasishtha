

.global _start
.extern syscall_exit
_start:
	xor %rdi, %rdi
	call syscall_exit
