;ROCK PAPER SCISORS
org 0x7E00
jmp 0x0000:main
start db "Start",0
instruct db "Instructions",0
marker db ">",0
choice dw 0

;batata times 9000 db 0

getchar:
	mov ah, 0x0
	int 16h
	ret
scanf:
	pusha
	scan_loop:
		call getchar
		

		cmp al, 13
		je scan_end
		
		mov ah, 0xe
		int 10h	
		mov ah, 0	
		
		cmp al, 8
		je backspace
		inc dx

		stosb
		jmp scan_loop

	backspace:
		cmp dx, 0
		je scan_loop
		add dx, -1
		mov byte[di], 0
		add di, -1
		mov ah, 0xe
		mov al, 0
		int 10h
		mov al, 8
		int 10h
		mov ah, 0
		xor ax, ax
		jmp scan_loop
		

	scan_end:
		mov ah, 0xe
		call endl
		xor ax, ax
		stosb
		popa
	ret

putchar:
	mov ah, 0xe
	int 10h
	ret


endl:
	pusha
	mov ah,0xe
	mov al, 10
	int 10h
	mov al, 13
	int 10h
	popa
ret

printf:
	pusha
	xor dx, dx
	print_loop:
		lodsb
		cmp al,0
		je end_print
		inc dx
		call putchar
		jmp print_loop
	end_print:
		call endl
		popa
	ret
video:
	xor ax, ax
	mov bx, ax
	mov cx, ax
	mov dx, ax
	
	
	
	mov ah, 0
	mov al, 13h
	int 10h
	
	mov ah, 0xb
	mov bh, 0
	mov bl, 4
	int 10h

	mov ah, 0xe
	mov al, 8
	mov bh, 0
	mov bl, 0xf
	mov cx, 01h
	int 10h

	ret

reset_registers:
	xor ax, ax
	mov bx, ax
	mov cx, ax
	mov dx, ax
	mov si, ax
	mov di, ax
ret

main:

	call reset_registers
	call video


	finite_state_machine:

		reset:
		

		menu:
			call video
			;mov cx, [choice]
			call getchar
			
			cmp al, 'W'
			je up_one_choice
			cmp al, 'S'
			je down_one_choice
			
			
			up_one_choice:
				cmp al,2
				;jlt up_one
				up_one:
				jmp menu
					
			down_one_choice:
			
		
			choice_menu:
			
			choice_game:


			
		

		jmp menu
		instructions:
		
		game:
		

	end_finite_state_machine:
	
	
 



end:
	jmp $
times 510-($-$$) db 0
dw 0xaa55
