;ROCK PAPER SCISORS
org 0x7E00
;jmp 0x0000:main
jmp main

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
instruct db "INSTRUCTIONS", 0
start db "START", 0
story db "STORY", 0
instline1 db "A/S/D", 0
instline2 db "Pedra/Papel/Tesoura", 0
instline3 db "P1 joga primeiro,", 0
instline4 db "P2 joga segundo.", 0
storyline1 db "TBD", 0
vsai db "VS A.I.", 0
vshooman db "VS Human", 0
PC db 0
PC_TURN db 0


BACC db "BACK"

logo db 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 14, 0, 14, 0, 0, 0, 0, 0, 0, 14, 14, 14, 11, 11, 11, 14, 14, 5, 0, 0, 0, 0, 0, 0, 14, 5, 14, 11, 11, 11, 14, 5, 14, 0, 14, 0, 0, 0, 0, 14, 14, 14, 11, 14, 11, 5, 11, 5, 11, 5, 0, 0, 0, 0, 5, 5, 5, 11, 5, 11, 11, 11, 11, 11, 14, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 14, 14, 14, 11, 14, 11, 0, 0, 11, 11, 11, 11, 14, 14, 14, 14, 5, 14, 11, 5, 5, 0, 0, 11, 14, 14, 14, 5, 14, 5, 14, 14, 14, 5, 14, 10, 14, 14, 14, 14, 5, 14, 14, 14, 5, 5, 5, 5, 10, 10, 10, 5, 14, 5, 14, 14, 14, 5, 5, 10, 0, 10, 10, 0, 0, 0, 14, 14, 5, 5, 5, 5, 10, 10, 10, 0, 0, 0, 0, 0, 0, 5, 10, 5, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

smolrock db 15, 15, 12, 0, 0, 0, 0, 0, 0, 15, 0, 0, 12, 0, 12, 12, 0, 0, 0, 0, 12, 15, 12, 15, 12, 12, 0, 0, 0, 12, 15, 12, 15, 12, 15, 12, 0, 12, 15, 12, 12, 12, 12, 15, 12, 12, 15, 12, 15, 12, 15, 12, 12, 12, 0, 12, 15, 15, 12, 15, 15, 12, 12, 0, 0, 12, 15, 15, 12, 15, 12, 15, 0, 0, 12, 4, 4, 4, 4, 15, 15

smolscissors db 15, 15, 11, 15, 11, 15, 11, 0, 0, 15, 0, 11, 15, 11, 15, 11, 0, 11, 11, 0, 11, 15, 11, 15, 11, 0, 0, 0, 0, 11, 15, 11, 15, 11, 15, 0, 0, 11, 15, 11, 11, 11, 11, 15, 11, 11, 15, 11, 15, 11, 15, 11, 11, 11, 0, 11, 15, 15, 11, 15, 15, 11, 11, 0, 0, 11, 15, 15, 11, 15, 11, 15, 0, 0, 11, 15, 15, 11, 15, 15, 15

smolpaper db 15, 15, 13, 15, 13, 15, 13, 13, 0, 15, 0, 13, 15, 13, 15, 13, 15, 13, 13, 0, 13, 15, 13, 15, 13, 15, 13, 0, 13, 13, 15, 13, 15, 13, 15, 13, 13, 15, 13, 13, 13, 13, 13, 15, 13, 13, 15, 13, 15, 13, 15, 13, 13, 13, 0, 13, 15, 15, 13, 15, 15, 13, 0, 0, 0, 13, 15, 15, 13, 15, 13, 15, 13, 0, 13, 15, 15, 13, 15, 15, 15

victory1 db 15, 15, 0, 0, 4, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 15, 0, 5, 4, 0, 4, 4, 4, 4, 4, 0, 0, 4, 0, 0, 0, 5, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 5, 5, 5, 4, 0, 0, 4, 4, 4, 4, 4, 0, 0, 0, 0, 5, 0, 0, 4, 4, 0, 4, 14, 4, 14, 4, 0, 0, 0, 0, 5, 5, 5, 4, 4, 4, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 4, 0, 4, 0, 15, 4, 0, 0, 4, 0, 0, 0, 0, 0, 4, 0, 0, 4, 0, 15, 4, 4, 4, 4, 0, 0, 0, 0, 0, 4, 4, 0, 4, 12, 12, 4, 12, 12, 4, 5, 5, 0, 0, 4, 12, 4, 4, 4, 15, 12, 12, 12, 12, 4, 0, 0, 0, 0, 4, 12, 4, 12, 4, 15, 15, 15, 12, 12, 4, 5, 5, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 4, 12, 12, 4, 0, 4, 10, 4, 0, 12, 4, 0, 15, 0, 0, 0, 4, 4, 4, 0, 4, 10, 4, 0, 12, 4, 15, 15

drawall db 15, 15, 0, 0, 0, 3, 3, 0, 0, 3, 0, 0, 0, 0, 0, 15, 0, 0, 0, 3, 2, 2, 3, 2, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 15, 2, 2, 2, 2, 15, 2, 2, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 2, 14, 5, 14, 5, 14, 5, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 11, 2, 3, 3, 0, 0, 3, 3, 0, 11, 0, 15, 3, 0, 15, 11, 3, 11, 11, 0, 0, 3, 11, 3, 11, 3, 3, 11, 3, 3, 11, 11, 11, 3, 0, 0, 3, 11, 3, 11, 0, 0, 0, 0, 0, 11, 11, 3, 0, 0, 0, 3, 3, 3, 3, 3, 3, 3, 11, 15, 11, 3, 0, 0, 0, 0, 3, 0, 0, 0, 3, 11, 3, 11, 11, 11, 3, 0, 0, 0, 0, 3, 0, 0, 0, 3, 3, 11, 11, 11, 3, 2, 11, 11, 0, 3, 2, 0, 0, 3, 2, 2, 2, 2, 2, 2, 2, 11, 11, 11, 0, 0, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 11, 11, 15, 0, 0, 3, 3, 10, 10, 10, 10, 10, 10, 10, 3, 11, 15, 15

victory2 db 15, 15, 0, 0, 0, 5, 0, 0, 0, 11, 0, 11, 0, 0, 0, 15, 5, 5, 0, 5, 5, 5, 0, 0, 11, 0, 0, 0, 11, 0, 5, 5, 5, 5, 5, 5, 5, 0, 0, 11, 11, 11, 0, 11, 0, 5, 5, 5, 5, 5, 5, 0, 0, 0, 11, 0, 0, 0, 11, 11, 5, 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, 13, 0, 0, 5, 5, 5, 0, 0, 13, 0, 0, 13, 0, 5, 5, 13, 5, 5, 5, 0, 0, 0, 0, 13, 0, 13, 0, 0, 0, 15, 5, 0, 15, 5, 0, 0, 0, 0, 13, 13, 5, 5, 0, 13, 13, 5, 13, 13, 5, 0, 0, 0, 0, 5, 5, 5, 13, 0, 5, 13, 13, 13, 13, 5, 0, 0, 0, 5, 13, 13, 13, 5, 0, 13, 5, 5, 13, 5, 0, 0, 0, 0, 5, 13, 5, 5, 5, 0, 5, 5, 5, 5, 0, 0, 0, 0, 0, 0, 5, 13, 5, 0, 0, 5, 13, 13, 5, 5, 5, 0, 0, 0, 0, 5, 13, 5, 0, 0, 8, 5, 5, 8, 5, 5, 5, 0, 0, 0, 5, 13, 5, 0, 15, 8, 10, 10, 8, 8, 5, 5, 0, 0, 0, 5, 13, 5, 15, 15

title db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 14, 14, 11, 0, 14, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 14, 14, 11, 14, 14, 14, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 14, 14, 14, 14, 14, 14, 14, 0, 11, 11, 11, 11, 14, 14, 14, 14, 14, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 14, 14, 14, 14, 14, 14, 14, 11, 11, 11, 11, 11, 14, 14, 14, 14, 5, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 14, 5, 5, 5, 5, 14, 14, 11, 11, 11, 11, 11, 14, 14, 14, 14, 11, 11, 11, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 14, 0, 0, 0, 0, 14, 14, 11, 11, 11, 11, 11, 14, 14, 14, 14, 14, 11, 11, 11, 11, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 14, 0, 0, 0, 11, 14, 14, 11, 11, 11, 11, 11, 14, 14, 5, 14, 14, 14, 11, 11, 11, 14, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 14, 0, 0, 0, 11, 14, 14, 11, 11, 14, 14, 11, 14, 14, 11, 5, 14, 14, 14, 11, 11, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 14, 14, 14, 14, 14, 14, 14, 11, 11, 14, 14, 11, 5, 5, 11, 11, 5, 5, 5, 11, 11, 11, 11, 11, 0, 0, 14, 14, 0, 0, 0, 0, 0, 14, 14, 14, 14, 14, 14, 14, 14, 11, 11, 5, 5, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 0, 14, 14, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 14, 14, 14, 14, 14, 14, 14, 11, 14, 14, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 14, 14, 14, 14, 14, 14, 14, 11, 14, 14, 14, 14, 14, 14, 14, 11, 14, 14, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 14, 14, 14, 14, 14, 14, 14, 11, 14, 14, 5, 5, 5, 14, 14, 11, 14, 14, 0, 0, 0, 0, 0, 11, 11, 11, 14, 14, 14, 14, 14, 14, 14, 11, 5, 5, 14, 14, 14, 5, 5, 11, 14, 14, 11, 11, 5, 14, 14, 5, 5, 5, 14, 14, 14, 14, 14, 14, 14, 11, 14, 14, 14, 14, 14, 14, 14, 11, 11, 11, 14, 14, 14, 11, 11, 11, 14, 14, 5, 5, 5, 14, 14, 5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 11, 14, 14, 5, 5, 5, 14, 14, 11, 11, 11, 14, 14, 14, 5, 5, 5, 14, 14, 14, 14, 14, 14, 14, 0, 14, 14, 5, 5, 14, 14, 14, 5, 5, 11, 14, 14, 11, 11, 11, 14, 14, 11, 14, 5, 14, 14, 14, 5, 5, 5, 14, 14, 14, 14, 0, 14, 14, 0, 5, 0, 0, 0, 14, 14, 14, 11, 11, 11, 14, 14, 11, 11, 11, 14, 14, 5, 14, 14, 14, 14, 14, 5, 0, 0, 0, 5, 5, 0, 10, 0, 0, 10, 0, 10, 0, 0, 14, 14, 14, 11, 11, 11, 14, 14, 14, 14, 14, 14, 14, 5, 14, 14, 0, 0, 0, 0, 0, 10, 0, 0, 0, 10, 0, 10, 0, 0, 10, 0, 14, 11, 14, 14, 14, 11, 5, 5, 14, 14, 14, 14, 14, 14, 14, 5, 5, 5, 0, 10, 10, 0, 0, 10, 0, 0, 0, 10, 10, 10, 0, 0, 10, 0, 14, 14, 14, 14, 14, 5, 5, 5, 5, 5, 5, 0, 0, 0, 5, 0, 0, 0, 0, 10, 0, 10, 0, 10, 0, 0, 0, 10, 0, 10, 0, 0, 10, 0, 14, 14, 14, 14, 14, 5, 5, 0, 0, 0, 0, 0, 10, 0, 0, 10, 10, 0, 0, 10, 10, 0, 0, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 0, 0, 0, 0, 0, 10, 10, 10, 0, 10, 0, 10, 10, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 0, 0, 10, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 0, 0, 10, 0, 0, 0, 0, 10, 0, 0, 0, 0, 10, 10, 0, 0, 0, 0, 0, 10, 10, 0, 0, 10, 10, 0, 0, 0, 10, 10, 0, 10, 10, 0, 0, 0, 10, 10, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 10, 0, 0, 10, 10, 0, 0, 0, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 0, 10, 10, 0, 0, 0, 0, 10, 0, 0, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 10, 0, 10, 0, 0, 0, 10, 10, 0, 0, 10

printEnding:
	pusha
	mov cx, 138
	mov dx, 92
	mov ah, 0ch
	mov bh, 0
	lodsb
	eloop:
		innereloop:
			int 10h
			inc dx
			int 10h
			inc dx
			int 10h
			inc cx
			int 10h
			dec dx
			int 10h
			dec dx
			int 10h
			inc cx
			int 10h
			inc dx
			int 10h
			inc dx
			int 10h
			dec dx
			dec dx
			inc cx
			cmp cx, 183
			je e.innereloop
			lodsb
			jmp innereloop
		e.innereloop:
		add dx, 3
		mov cx, 138
		cmp dx, 137
		je e.eloop
		lodsb
		jmp eloop
	e.eloop:
	popa
ret

printTitle:
	pusha
	mov cx, 125
	mov dx, 55
	mov ah, 0ch
	mov bh, 0
	lodsb
	tloop:
		innertloop:
			int 10h
			inc dx
			int 10h
			dec dx
			inc cx
			int 10h
			inc dx
			int 10h
			dec dx
			inc cx
			cmp cx, 193
			je e.innertloop
			lodsb
			jmp innertloop
		e.innertloop:
		add dx, 2
		mov cx, 125
		cmp dx, 117
		je e.tloop
		lodsb
		jmp tloop
	e.tloop:
	popa
ret

printSlot1:
	pusha
	mov cx, 123
	mov dx, 110
	mov ah, 0ch
	mov bh, 0
	lodsb
	s1loop:
		inners1loop:
			int 10h
			inc cx
			cmp cx, 132
			je e.inners1loop
			lodsb
			jmp inners1loop
		e.inners1loop:
		inc dx
		mov cx, 123
		cmp dx, 119
		je e.s1loop
		lodsb
		jmp s1loop
	e.s1loop:
	popa
ret

printSlot2:
	pusha
	mov cx, 185
	mov dx, 110
	mov ah, 0ch
	mov bh, 0
	lodsb
	s2loop:
		inners2loop:
			int 10h
			inc cx
			cmp cx, 194
			je e.inners2loop
			lodsb
			jmp inners2loop
		e.inners2loop:
		inc dx
		mov cx, 185
		cmp dx, 119
		je e.s2loop
		lodsb
		jmp s2loop
	e.s2loop:
	popa
ret

printCard1Image:
	pusha
	mov cx, 120
	mov dx, 107
	mov ah, 0ch
	mov bh, 0
	lodsb
	c1loop:
		innerc1loop:
			int 10h
			inc cx
			cmp cx, 135
			je e.innerc1loop
			lodsb
			jmp innerc1loop
		e.innerc1loop:
		inc dx
		mov cx, 120
		cmp dx, 122
		je e.c1loop
		lodsb
		jmp c1loop
	e.c1loop:
	popa

	printCard1Square:
	pusha
	mov ah, 0ch
	mov bh, 0
	mov al, 0xf
	mov dx, 85
	mov cx, 105
	int 10h
	c1square1:
		int 10h
		inc cx
		cmp cx, 150
		je e.c1square1
		jmp c1square1
	e.c1square1:
	c1square2:
		int 10h
		inc dx
		cmp dx, 145
		je e.c1square2
		jmp c1square2
	e.c1square2:
	c1square3:
		int 10h
		dec cx
		cmp cx, 105
		je e.c1square3
		jmp c1square3
	e.c1square3:
	c1square4:
		int 10h
		dec dx
		cmp dx, 85
		je e.c1square4
		jmp c1square4
	e.c1square4:
	popa
ret

printCard2Image:
	pusha
	mov cx, 182
	mov dx, 107
	mov ah, 0ch
	mov bh, 0
	lodsb
	c2loop:
		innerc2loop:
			int 10h
			inc cx
			cmp cx, 197
			je e.innerc2loop
			lodsb
			jmp innerc2loop
		e.innerc2loop:
		inc dx
		mov cx, 182
		cmp dx, 122
		je e.c2loop
		lodsb
		jmp c2loop
	e.c2loop:
	popa

	printCard2Square:
	pusha
	mov ah, 0ch
	mov bh, 0
	mov al, 0xf
	mov dx, 85
	mov cx, 167
	int 10h
	c2square1:
		int 10h
		inc cx
		cmp cx, 212
		je e.c2square1
		jmp c2square1
	e.c2square1:
	c2square2:
		int 10h
		inc dx
		cmp dx, 145
		je e.c2square2
		jmp c2square2
	e.c2square2:
	c2square3:
		int 10h
		dec cx
		cmp cx, 167
		je e.c2square3
		jmp c2square3
	e.c2square3:
	c2square4:
		int 10h
		dec dx
		cmp dx, 85
		je e.c2square4
		jmp c2square4
	e.c2square4:
	popa
ret

getchar:
	push bx
	cmp byte[PC_TURN], 1
	je pc_plays
	jne human_plays

	human_plays:
		mov ah, 0x0
		int 16h
		jmp end_getchar
	pc_plays:
		call delay1s
		xor ax, ax
		rdtsc
		mov bx, 3
		xor dx, dx
		div bx
		;mov dx, 1
		cmp dx, 1
		je itIsPaper
		jl itIsRock
		jg itIsScisors


		itIsPaper:
			mov al, 's'
			jmp end_getchar
		itIsRock:
			mov al, 'a'
			jmp end_getchar
		itIsScisors:
			mov al, 'd'
			jmp end_getchar
		
		jmp end_getchar
	end_getchar:
	pop bx
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


limpaTela:
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
    
    mov dx, 0 
    mov bh, 0      
    mov ah, 0x2
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

	mov dx, 10
	call mult_endl
	jmp end_printTela

	Ajogou:
		call endl
		call endl
		mov dx, 14
		call blank
		mov si, logo
		call printCard1Image
		mov dx, 8
		call mult_endl
		pusha
			mov ah, 0ch
			mov bh, 0
			mov al, 0xf
			mov cx, 107
			mov dx, 87
			int 10h
			mov cx, 109
			int 10h
			mov cx, 107
			mov dx, 89
			int 10h
			mov cx, 148
			mov dx, 143
			int 10h
			mov cx, 146
			int 10h
			mov cx, 148
			mov dx, 141
			int 10h
		popa
		jmp end_printTela
	Bjogou:
		call endl
		mov dx, 14
		call blank
		mov si, logo
		call printCard1Image
		pusha
			mov ah, 0ch
			mov bh, 0
			mov al, 0xf
			mov cx, 107
			mov dx, 87
			int 10h
			mov cx, 109
			int 10h
			mov cx, 107
			mov dx, 89
			int 10h
			mov cx, 148
			mov dx, 143
			int 10h
			mov cx, 146
			int 10h
			mov cx, 148
			mov dx, 141
			int 10h
		popa
		call printCard2Image
		call endl
		mov dx, 8
		call mult_endl
		pusha
			mov ah, 0ch
			mov bh, 0
			mov al, 0xf
			mov cx, 169
			mov dx, 87
			int 10h
			mov cx, 171
			int 10h
			mov cx, 169
			mov dx, 89
			int 10h
			mov cx, 210
			mov dx, 143
			int 10h
			mov cx, 208
			int 10h
			mov cx, 210
			mov dx, 141
			int 10h
		popa
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
		call endl
		mov dx, 14
		call blank
		mov al, byte[choice_player_one]
		call putchar
		mov dx, 7
		call blank
		mov al, byte[choice_player_two]
		call putchar
		mov dx, 6
		call mult_endl
		mov dx, 17
		call blank
		mov al, byte[choice_player_one]
		call putchar
		mov dx, 7
		call blank
		mov al, byte[choice_player_two]
		call putchar
		cmp byte[choice_player_one], 'R'
		je definerock1
		cmp byte[choice_player_one], 'S'
		je definescissors1
		cmp byte[choice_player_one], 'P'
		je definepaper1

		definerock1:
			mov si, smolrock
		jmp defined1
		definepaper1:
			mov si, smolpaper
		jmp defined1
		definescissors1:
			mov si, smolscissors
		defined1:

		call printSlot1

		cmp byte[choice_player_two], 'R'
		je definerock2
		cmp byte[choice_player_two], 'S'
		je definescissors2
		cmp byte[choice_player_two], 'P'
		je definepaper2

		definerock2:
			mov si, smolrock
		jmp defined2
		definepaper2:
			mov si, smolpaper
		jmp defined2
		definescissors2:
			mov si, smolscissors
		defined2:

		call printSlot2
		mov bl, 0
		call endl
		call endl
		call printCard1Square
		call printCard2Square
		mov bl, 0
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
			mov si, victory1
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
			mov si, victory2
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
			mov si, drawall
		out:
		call printEnding
		mov dx, 10
		call mult_endl
		jmp end_printTela
	
	end_printTela:
		mov dx, 13
		call blank
		mov si, old_cards_player_one
		lodsb
		add al, 48
		mov bl, 0xf
		call putchar
		mov al, 'R'
		mov bl, 0xc
		call putchar
		lodsb
		add al, 48
		mov bl, 0xf
		call putchar
		mov al, 'P'
		mov bl, 0xd
		call putchar
		lodsb
		add al, 48
		mov bl, 0xf
		call putchar
		mov al, 'S'
		mov bl, 0xb
		call putchar
		mov dx, 2
		call blank
		mov si, old_cards_player_two
		lodsb
		add al, 48
		mov bl, 0xf
		call putchar
		mov al, 'R'
		mov bl, 0xc
		call putchar
		lodsb
		add al, 48
		mov bl, 0xf
		call putchar
		mov al, 'P'
		mov bl, 0xd
		call putchar
		lodsb
		add al, 48
		mov bl, 0xf
		call putchar
		mov al, 'S'
		mov bl, 0xb
		call putchar
		mov ah, 0ch
		mov bh, 0
		mov al, 0xf
		mov dx, 82
		mov cx, 101
		lineprint:
			int 10h
			inc cx
			cmp cx, 218
			je e.lineprint
		jmp lineprint
		e.lineprint:
		call delay1s
		cmp byte[state], 3
		je delay
		cmp byte[state], 4
		je delay
		jmp ndelay
		delay:
			call delay1s
		ndelay:
		mov ah, 0ch
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
			cmp byte[PC],1
			jne not_pc
			mov byte[PC_TURN],1
			not_pc:
			call getchar
			mov byte[PC_TURN],0
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
	mov byte[state], 0
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
	mov di, old_cards_player_one
	mov byte[di], 3
	inc di
	mov byte[di], 3
	inc di
	mov byte[di], 3
	mov di, old_cards_player_two
	mov byte[di], 3
	inc di
	mov byte[di], 3
	inc di
	mov byte[di], 3
	mov byte[rodada], 0
	mov byte[pontuation_player_one], 0
	mov byte[pontuation_player_two], 0
	mov byte[choice_player_one], 0
	mov byte[choice_player_two], 0
	mov byte[PC], 0
	call limpaTela
	xor cx, cx
	mov cl, 1
	jmp menu
ret

main:
	call video

	finite_state_machine:
		menu:
			call limpaTela
			cmp cl, 2
			je instselect
			jg storyselect
				mov dx, 16
				call mult_endl
				mov dx, 17
				call blank
				mov al, '>'
				call putchar
				mov si, start
				call printf
				mov dx, 15
				call blank
				mov si, instruct
				call printf
				mov dx, 18
				call blank
				mov si, story
				call printf
			jmp endmenuprint

			instselect:
				mov dx, 16
				call mult_endl
				mov dx, 18
				call blank
				mov si, start
				call printf
				mov dx, 14
				call blank
				mov al, '>'
				call putchar
				mov si, instruct
				call printf
				mov dx, 18
				call blank
				mov si, story
				call printf
			jmp endmenuprint

			storyselect:
				mov dx, 16
				call mult_endl
				mov dx, 18
				call blank
				mov si, start
				call printf
				mov dx, 15
				call blank
				mov si, instruct
				call printf
				mov dx, 17
				call blank
				mov al, '>'
				call putchar
				mov si, story
				call printf
			
			endmenuprint:

			mov si, title
			call printTitle

			minimenu:
				call getchar
				cmp al, 's'
				je up_one_choice
				cmp al, 'w'
				je down_one_choice
				cmp al, 13
				je choose
			jmp minimenu
			
			
			up_one_choice:
				cmp cl,3
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
				call limpaTela
				cmp cl, 2
				je instructions
				jl game
				jg historia
			jmp menu
		instructions:
			mov dx, 12
			call mult_endl
			mov dx, 18
			call blank
			mov si, instline1
			call printf
			mov dx, 20
			call blank
			mov al, '='
			call putchar
			call endl
			mov dx, 11
			call blank
			mov si, instline2
			call printf
			call endl
			mov dx, 13
			call blank
			mov si, instline3
			call printf
			mov dx, 13
			call blank
			mov si, instline4
			call printf
			call endl
			mov dx, 18
			call blank
			mov al, '>'
			call putchar
			mov si, BACC
			call printf
			instructionne:
				call getchar
				cmp al, 13
				je menu
			jmp instructionne
		historia:
			mov dx, 12
			call mult_endl
			mov dx, 19
			call blank
			mov si, storyline1
			call printf
			call endl
			mov dx, 18
			call blank
			mov al, '>'
			call putchar
			mov si, BACC
			call printf
			tale:
				call getchar
				cmp al, 13
				je menu
			jmp tale
		game:
			mov cl, 1
			gamemenu:
				call limpaTela
				cmp cl, 2
				je aiselect
				jg baccselect

				mov dx, 16
				call mult_endl
				mov dx, 15
				call blank
				mov al, '>'
				call putchar
				mov si, vshooman
				call printf
				mov dx, 17
				call blank
				mov si, vsai
				call printf
				mov dx, 18
				call blank
				mov si, BACC
				call printf
				jmp endgameprint

			aiselect:
				mov dx, 16
				call mult_endl
				mov dx, 16
				call blank
				mov si, vshooman
				call printf
				mov dx, 16
				call blank
				mov al, '>'
				call putchar
				mov si, vsai
				call printf
				mov dx, 18
				call blank
				mov si, BACC
				call printf
				jmp endgameprint

			baccselect:
				mov dx, 16
				call mult_endl
				mov dx, 16
				call blank
				mov si, vshooman
				call printf
				mov dx, 17
				call blank
				mov si, vsai
				call printf
				mov dx, 17
				call blank
				mov al, '>'
				call putchar
				mov si, BACC
				call printf
			endgameprint:

			mov si, title
			call printTitle

			miniminimenu:
				call getchar
				cmp al, 's'
				je up_one_choice2
				cmp al, 'w'
				je down_one_choice2
				cmp al, 13
				je choose2
			jmp miniminimenu
			
			up_one_choice2:
				cmp cl, 3
				jl up_one2
				jmp gamemenu
				up_one2:
					inc cx
					jmp gamemenu

			down_one_choice2:
				cmp cl, 1
				jg down_one2
				jmp gamemenu
				down_one2:
					dec cx
					jmp gamemenu
			
			choose2:
				call limpaTela
				cmp cl, 2
				jne not_ai
				mov byte[PC],1
				mov di, cards_player_two
				mov byte[di], 9
				inc di
				mov byte[di], 9
				inc di
				mov byte[di], 9
				mov di, old_cards_player_two
				mov byte[di], 9
				inc di
				mov byte[di], 9
				inc di
				mov byte[di], 9
				jmp start_game
				not_ai:
				cmp cl, 2
				jl start_game
				jg backmenu ;Just to be sure

			backmenu:
				mov cl, 1
			jmp menu
	jmp $
times 63*512-($-$$) db 0
dw 0xaa55

