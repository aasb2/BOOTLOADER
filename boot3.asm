;ROCK PAPER SCISORS
org 0x7E00
jmp 0x0000:main
start db "Start",0
instruct db "Instructions",0
marker db ">",0
choice db 0
choice_player_one db 0
choice_player_two db 0
cards_player_one times 3 db 3
cards_player_two times 3 db 3
batata times 3 db 0

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


start_game:
	pusha
		
		begin:
			player_one:
				call getchar
				cmp al, 'a'
				je player_one_chooses_rock
				cmp al, 's'
				je player_one_chooses_paper
				cmp al, 'd'
				je player_one_chooses_scisors
				jmp player_one

				player_one_chooses_rock:
					mov si, cards_player_one
					lodsb
					cmp byte[si], 0
					;add al, 48
					;call putchar
					jne player_one_can_choose_rock
					je player_one
					jmp player_one
					player_one_can_choose_rock:
						mov si, cards_player_one
						mov di, cards_player_one
						lodsb
						dec byte[di]
						stosb
						mov di, choice_player_one
						mov al, 'R'
						call putchar
						stosb
						jmp end_player_one
				player_one_chooses_paper:
					mov si, cards_player_one
					mov di, cards_player_one
					inc si
					inc di
					lodsb
					cmp al, 0
					add al, 48
					call putchar
					jne player_one_can_choose_paper
					jmp player_one
					player_one_can_choose_paper:
						mov si, cards_player_one
						mov di, cards_player_one
						inc si
						inc di
						lodsb
						dec al
						stosb
						mov di, choice_player_one
						mov al, 'P' 
						call putchar
						stosb
						jmp end_player_one
							
				player_one_chooses_scisors:
						mov si, cards_player_one
						mov di, cards_player_one
						add si, 2
						add di, 2
						lodsb
						cmp al, 0
						jne player_one_can_choose_scisors
						
						player_one_can_choose_scisors
						
			end_player_one:
				

			player_two:
			end_player_two:
			decision:
			end_decision:
			jmp begin
		end:
	
end_game:
	popa
ret





main:

	call reset_registers
	call video


	finite_state_machine:

		reset:
			xor cx, cx
			jmp menu
		menu:
			
			call getchar
			;call putchar
			cmp al, 's'
			je up_one_choice
			cmp al, 'w'
			je down_one_choice
			cmp al, 13
			je choose
			jmp menu
			
			
			up_one_choice:
				cmp cl,2
				jl up_one
				jmp menu
				up_one:
					inc cx
					jmp menu
						
			down_one_choice:
				cmp cl, 1
				jg down_one
				jmp menu
				down_one:
					dec cx
					jmp menu 
			

			choose:
				cmp cl, 2
				je choice_instructions
				jmp choice_game
			choice_instructions:
				mov si, instruct
				mov di , instruct
				call printf
				jmp instructions
			choice_game:
				mov si, start
				mov di , start
				call printf
				call start_game
				jmp game
			
		

		jmp menu
		instructions:
			call getchar
			cmp al, 13
			je game
			jmp instructions
		game:
			call getchar
			call putchar
			jmp start_game

	end_finite_state_machine:
	
	
 



end_program:
	jmp $
times 10000-($-$$) db 0
dw 0xaa55
