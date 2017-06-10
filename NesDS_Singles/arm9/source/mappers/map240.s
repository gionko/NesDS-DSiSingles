@---------------------------------------------------------------------------------
.section .text,"ax"
@---------------------------------------------------------------------------------
	#include "equates.h"
	#include "6502mac.h"
@---------------------------------------------------------------------------------
	.global mapper240init
	tmp = mapperdata + 0
@---------------------------------------------------------------------------------
mapper240init:
@---------------------------------------------------------------------------------
	.word void, void, void, void

	adr r1,write0
	str_ r1,writemem_tbl+8

	mov pc, lr
	

@----------------------------------------------
write0:
	ldr r1, =0x4020
	cmp addy, r1
	blo IO_W

	str_ r0, tmp
	stmfd sp!, {lr}
	and r0, r0, #0xf0
	mov r0, r0, lsr#4
	bl map89ABCDEF_
	ldr_ r0, tmp
	and r0, r0, #0xF
	ldmfd sp!, {lr}
	b chr01234567_