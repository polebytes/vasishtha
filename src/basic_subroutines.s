/*
	_start -> entry point of the program
	according to SysV abi manual
	%rsp		-> argument counter
	%rsp+8		-> argument pointers
	%rsp+argc*8+8+8	-> environment pointers
	then the transfer is given to main subroutine
*/
.global _start
_start:
	pop	%rdi
	mov	%rsp, %rsi
	lea	8(%rsp,%rdi,8), %rdx
	call	main
	mov	%rax, %rdi
	call	_sys_exit
