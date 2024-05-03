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
	mov	%rdi, %r8
	mov	%rdi, %rbx

.strlen_loop:
	inc	%rdi
	
.strlen_loop_cmp:
	movb	(%rdi), %al
	cmp	$0, %al
	jnz	.strlen_loop
	sub	%rbx, %rdi
	mov	%rdi, %rax
	mov	%r8, %rdi
	ret

/*
	string_cmp -> compares the the both string
	@rdi: char* first_string
	@rsi: char* second_string
	@returns: 1 if they are not some, 0 when both the strings are same
*/
.global is_string_same
is_string_same:
	jmp	._string_cmp

.string_cmp_loop:
	inc	%rdi
	inc	%rsi

._string_cmp:
	movb	(%rdi), %al
	movb	(%rsi), %bl
	cmp	$0, %al
	je	.string_cmp_checkpoint_b
	cmp	$0, %bl
	je	.string_cmp_checkpoint_a
	cmp	%al, %bl
	je	.string_cmp_loop
	jmp	.strlen_return_failure

.string_cmp_checkpoint_a:
	cmp	$0, %al
	jne	.strlen_return_failure
	jmp	.string_cmp_done

.string_cmp_checkpoint_b:
	cmp	$0, %bl
	jne	.strlen_return_failure
	jmp	.string_cmp_done

.string_cmp_done:
	xor	%rax, %rax
	ret

.strlen_return_failure:
	mov	$1, %rax
	ret

/*
	print -> display char
	@rdi: char* string
*/
.global print
print:
	call	strlen
	mov	%rax, %rdx	#length of the string
	mov	%rdi, %rsi	#address of the string
	mov	$1, %rdi	#fd
	mov	$1, %rax	#write_syscall
	syscall
	ret





