;ROCK PAPER SCISORS
org 0x7E00
;jmp 0x0000:main
jmp main

start db "Start",0
instruct db "Instructions",0
marker db ">",0
rodada db 0
choice db 0
winner db 0
vencedor db 0
state db 0
choice_player_one db 0
choice_player_two db 0
pontuation_player_one db 0
pontuation_player_two db 0
cards_player_one times 3 db 3
cards_player_two times 3 db 3
old_cards_player_one times 3 db 3
old_cards_player_two times 3 db 3
;batata times 3 db 0

player_one_print db "PLAYER 1",0
player_two_print db "PLAYER 2",0
it_is_the_freaking_end db "IT IS THE FREAKING END!!!!!!!",0
rand db "asfdhhjsdgsghs|",0
it_is_a_draw db "DRAW",0
player1_victory db "PLAYER ONE VICTORY",0
player2_victory db "PLAYER TWO VICTORY",0

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
	;call video
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

printe:
	pusha
	;call video
	xor dx, dx
	printe_loop:
		lodsb
		cmp al,0
		je end_printe
		inc dx
		call putchar
		jmp printe_loop
	end_printe:
		;call endl
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


limpaTela:
	pusha
;; Limpa a tela dos caracteres colocados pela BIOS
	; Set the cursor to top left-most corner of screen
	mov dx, 0 
    mov bh, 0      
    mov ah, 0x2
    int 0x10

    ; print 2000 blanck chars to clean  
    mov cx, 2000 
    mov bh, 0
    mov al, 0x20 ; blank char
    mov ah, 0x9
    int 0x10
    
    ;Reset cursor to top left-most corner of screen
    mov dx, 0 
    mov bh, 0      
    mov ah, 0x2
    int 0x10
	popa
ret

limpe: 
	pusha
	mov dx, 0 
    mov bh, 0      
    mov ah, 0x2
    int 0x10

	mov cx, 2000 
    mov bh, 0
    mov al, 0x20 ; blank char
    mov ah, 0x9
    int 0x10
	popa
ret


blank:
	pusha
	mov al, 0
	xor cx, cx
	loop_blank:
		cmp cx,dx
		je end_loop_blank
		call putchar
		inc cx
		jmp loop_blank
	end_loop_blank:
	popa
	ret
end_blank:

mult_endl:
	pusha
	xor cx,cx
	loop_mult_endl:
		cmp cx, dx
		je end_loop_blank
		call endl
		inc cx
		jmp loop_mult_endl
	end_loop_mult_end:
	popa
	ret
mult_endl_end:

delay1s:
	pusha
	mov cx, 0fh
	mov dx, 4240h
	mov ah, 86h
	int 15h
	popa
 ret

printTela:
	pusha
	call limpaTela
	mov dx, 7
	call mult_endl
	mov dx, 13
	call blank
	mov al, 'P'
	call putchar
	mov al, '1'
	call putchar
	mov dx, 10
	call blank
	mov al, 'P'
	call putchar
	mov al, '2'
	call putchar
	call endl
	mov dx, 13
	call blank
	mov al, byte[pontuation_player_one]
	add al,48
	call putchar
	mov dx, 12
	call blank
	mov al, byte[pontuation_player_two]
	add al,48
	call putchar
	call endl
	;Ifcase
	cmp byte[state], 1
	je Ajogou
	cmp byte[state], 2
	je Bjogou
	cmp byte[state], 3
	je CFinal
	cmp byte[state], 4
	je DFinal

	call endl
	call endl
	jmp end_printTela

	Ajogou:
		call endl
		mov dx, 14
		call blank
		mov al, 'X'
		call putchar
		call endl
		jmp end_printTela
	Bjogou:
		call endl
		mov dx, 14
		call blank
		mov al, 'X'
		call putchar
		mov dx, 10
		call blank
		mov al, 'X'
		call putchar
		call endl
		jmp end_printTela
	CFinal:
		;call endl
		;Atualizacartas
		
		
		cmp byte[vencedor], 1
		je Venc1
		jg Venc2
		jmp Tie
		Venc1:
			mov dx, 18
			call blank
			mov al, '+'
			call putchar
			mov al, '1'
			call putchar
			mov al, 'P'
			call putchar
			mov al, '1'
			call putchar
			call endl
			jmp abc
			
		Venc2:				
			mov dx, 18
			call blank
			mov al, '+'
			call putchar
			mov al, '1'
			call putchar
			mov al, 'P'
			call putchar
			mov al, '2'
			call putchar
			call endl
			jmp abc
			
		Tie:				
			mov dx, 18
			call blank
			mov al, 'T'
			call putchar
			mov al, 'I'
			call putchar
			mov al, 'E'
			call putchar
			mov al, '!'
			call putchar
			call endl
			jmp abc
			
		abc:
		;  Mostrar cartas
		mov dx, 14
		call blank
		mov al, byte[choice_player_one]
		call putchar
		mov dx, 10
		call blank
		mov al, byte[choice_player_two]
		call putchar
		call endl
		;call delay1s
		jmp end_printTela
	
	DFinal:
		mov dx, 17
		call blank
		cmp byte[winner], 1
		je win1		
		jg win2
		jmp igual
		
		win1:
			mov al, 'P'
			call putchar
			mov al, '1'
			call putchar
			mov al, ' '
			call putchar
			mov al, 'W'
			call putchar
			mov al, 'O'
			call putchar
			mov al, 'N'
			call putchar
			jmp out
		win2:
			mov al, 'P'
			call putchar
			mov al, '2'
			call putchar
			mov al, ' '
			call putchar
			mov al, 'W'
			call putchar
			mov al, 'O'
			call putchar
			mov al, 'N'
			call putchar
			jmp out
		igual:
			mov al, ' '
			call putchar
			mov al, 'D'
			call putchar
			mov al, 'R'
			call putchar
			mov al, 'A'
			call putchar
			mov al, 'W'
			call putchar
			mov al, '!'
			call putchar
		out:
		call endl
		mov dx, 14
		call blank
		mov al, byte[choice_player_one]
		call putchar
		mov dx, 10
		call blank
		mov al, byte[choice_player_two]
		call putchar
		call endl
		;call delay1s
		jmp end_printTela
	
	end_printTela:
		mov dx, 13
		call blank
		mov si, old_cards_player_one
		lodsb
		add al, 48
		call putchar
		mov al, 'R'
		call putchar
		lodsb
		add al, 48
		call putchar
		mov al, 'P'
		call putchar
		lodsb
		add al, 48
		call putchar
		mov al, 'S'
		call putchar
		mov dx, 2
		call blank
		mov si, old_cards_player_two
		lodsb
		add al, 48
		call putchar
		mov al, 'R'
		call putchar
		lodsb
		add al, 48
		call putchar
		mov al, 'P'
		call putchar
		lodsb
		add al, 48
		call putchar
		mov al, 'S'
		call putchar	
		call delay1s
		cmp byte[state], 3
		je delay
		cmp byte[state], 4
		je delay
		jmp ndelay
		delay:
		
			call delay1s
		ndelay:
	popa
ret

start_game:
	;pusha
	xor cx,cx;
	begin:
		mov byte[state], 0
		mov byte[choice_player_one], 'X'
		mov byte[choice_player_two], 'X'
		call printTela
		player_one:

			call getchar
			;mov bx, state
			mov byte[state], 1
			cmp al, 'a'
			je player_one_chooses_rock
			cmp al, 's'
			je player_one_chooses_paper
			cmp al, 'd'
			je player_one_chooses_scisors
			jmp player_one

			player_one_chooses_rock:
				mov si, cards_player_one
				cmp byte[si], 0
				jne player_one_can_choose_rock
				je player_one
				jmp player_one
				player_one_can_choose_rock:
					mov di, cards_player_one
					dec byte[di]
					mov di, choice_player_one
					mov byte[di], 'R'
					;call endl
					;mov al, byte[di]
					;call putchar
					jmp end_player_one
			player_one_chooses_paper:
				mov si, cards_player_one
				inc si
				cmp byte[si], 0
				jne player_one_can_choose_paper
				je player_one
				jmp player_one
				player_one_can_choose_paper:
					mov di, cards_player_one
					inc di
					dec byte[di]
					mov di, choice_player_one
					mov byte[di], 'P'	
					;call endl
					;mov al, byte[di]
					;call putchar
					jmp end_player_one	
			player_one_chooses_scisors:
					mov si, cards_player_one
					add si, 2
					cmp byte[si], 0
					jne player_one_can_choose_scisors
					je player_one
					jmp player_one
					player_one_can_choose_scisors:
						mov di, cards_player_one
						add di, 2
						dec byte[di]
						mov di, choice_player_one
						mov byte[di], 'S'
						;call endl
						;mov al, byte[di]
						;call putchar
						jmp end_player_one	
		end_player_one:
			call printTela
		player_two:

			call getchar
			mov byte[state], 2
			cmp al, 'a'
			je player_two_chooses_rock
			cmp al, 's'
			je player_two_chooses_paper
			cmp al, 'd'
			je player_two_chooses_scisors
			jmp player_two

			player_two_chooses_rock:
				mov si, cards_player_two
				cmp byte[si], 0
				jne player_two_can_choose_rock
				je player_two
				jmp player_two
				player_two_can_choose_rock:
					mov di, cards_player_two
					dec byte[di]
					mov di, choice_player_two
					mov byte[di], 'R'
					;call endl
					;mov al, byte[di]
					;call putchar
					jmp end_player_two

			player_two_chooses_paper:

				mov si, cards_player_two
				inc si
				cmp byte[si], 0
				jne player_two_can_choose_paper
				je player_two
				jmp player_two
				player_two_can_choose_paper:
					mov di, cards_player_two
					inc di
					dec byte[di]
					mov di, choice_player_two
					mov byte[di], 'P'	
					call endl
					mov al, byte[di]
					call putchar
					jmp end_player_two

			player_two_chooses_scisors:
					mov si, cards_player_two
					add si, 2
					cmp byte[si], 0
					jne player_two_can_choose_scisors
					je player_two
					jmp player_two
					player_two_can_choose_scisors:
						mov di, cards_player_two
						add di, 2
						dec byte[di]
						mov di, choice_player_two
						mov byte[di], 'S'
						;call endl
						;mov al, byte[di]
						;call putchar
						jmp end_player_two

			end_player_two:
			call printTela

			mov si, cards_player_one
			mov dl, byte[si]
			mov di, old_cards_player_one
			mov byte[di], dl
			inc si
			inc di		
			mov dl, byte[si]
			mov byte[di], dl
			inc si
			inc di		
			mov dl, byte[si]
			mov byte[di], dl					
		
			mov si, cards_player_two
			mov dl, byte[si]
			mov di, old_cards_player_two
			mov byte[di], dl
			inc si
			inc di		
			mov dl, byte[si]
			mov byte[di], dl
			inc si
			inc di		
			mov dl, byte[si]
			mov byte[di], dl	

			decision:
				mov si, choice_player_one
				mov di, choice_player_two
				lodsb
				mov si, choice_player_one
				cmp byte[di], al
				je draw
				cmp byte[si], 'R'
				je player_one_choosed_rock
				cmp byte[si], 'P'
				je player_one_choosed_paper
				cmp byte[si], 'S'
				je player_one_choosed_scisors

				player_one_choosed_rock:
					cmp byte[di], 'S'
					je player_one_won
					jmp player_two_won
				player_one_choosed_paper:
					cmp byte[di], 'R'
					je player_one_won
					jmp player_two_won
				player_one_choosed_scisors:
					cmp byte[di], 'P'
					je player_one_won
					jmp player_two_won

				player_one_won:
					mov byte[vencedor], 1
					inc byte[pontuation_player_one]
					jmp end_decision
				player_two_won:
					mov byte[vencedor], 2
					inc byte[pontuation_player_two]
					jmp end_decision
				draw:
					mov byte[vencedor], 0
					
					
					jmp end_decision
			end_decision:

			mov byte[state], 3
			call printTela
			inc cl
			cmp cl, 9
			jne begin
			jmp end
		end:
			
			;call endl
			;call limpaTela
			;mov si, it_is_the_freaking_end
			;call printf
			final_decision:
				mov si, pontuation_player_one
				mov di, pontuation_player_two
				lodsb
				cmp byte[di], al
				je draw_for_real
				jg player_two_won_for_real
				jl player_one_won_for_real		
				player_one_won_for_real:
					mov byte[winner], 1
					jmp end_game
				player_two_won_for_real:
					mov byte[winner], 2
					jmp end_game
				draw_for_real:
					mov byte[winner], 0
		
				
				jmp end_game
				

	
end_game:
	mov byte[state], 4
	call printTela
	mov di, cards_player_one
	mov byte[di], 3
	inc di
	mov byte[di], 3
	inc di
	mov byte[di], 3
	mov di, cards_player_two
	mov byte[di], 3
	inc di
	mov byte[di], 3
	inc di
	mov byte[di], 3
	mov byte[choice_player_one], 0
	mov byte[choice_player_two], 0
	;popa
;break
ret





main:

	call reset_registers
	call video
	mov al, '!'
	call endl

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
				;call start_game
				jmp game
			
		

		jmp menu
		instructions:
			call getchar
			cmp al, 13
			je game
			jmp instructions
		game:
			;call getchar
			;call putchar
			call start_game

	end_finite_state_machine:
	
	
 



end_program:
	jmp $
times 10000-($-$$) db 0
dw 0xaa55
