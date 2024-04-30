/*
	_start -> entry point of the program
	according to SysV abi manual
	%rsp		-> argument counter
	%rsp+8		-> argument pointers
	%rsp+argc*8+8+8	-> environment pointers
	this subroutine parse this data then gives control to main subroutine
*/
.global _start
_start:
	pop	%rdi
	mov	%rsp, %rsi
	lea	8(%rsp,%rdi,8), %rdx
	call	main
	mov	%rax, %rdi
	call	_sys_exit


/*
	strlen -> gives the length of the string
	@rdi: char* string
	@returns: length
*/
.global strlen
strlen:
	mov	%rdi, %rbx

.strlen_loop:
	inc	%rdi
	
.strlen_loop_cmp:
	movb	(%rdi), %al
	cmp	$0, %al
	jnz	.strlen_loop
	sub	%rbx, %rdi
	mov	%rdi, %rax


