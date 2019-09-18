org 0500h

jmp inicio

MSG1:	db 'Carregando as estruturas do kernel...         ', 0
MSG2:	db 'Inicializando no modo protegido...            ', 0
MSG3:	db 'Carregar o kernel na memoria...               ', 0
MSG4:   db 'Internalizando raiva pelo projeto...          ', 0
MSG5:   db 'Iniciar naruto_run.exe...                     ', 0
OK:		db 'OK!', 0
KERNELMSG:	db 'Operacao concluida! Inicializando o kernel...', 0

DRIVE:	db 0

inicio:
	cli
	mov ax, 09000h
	mov ss, ax
	mov sp, 0FB00h
	
	xor ax, ax
	mov ds, ax
	
	mov ax, 0B800h
	mov es, ax
	sti
	
	mov byte[DRIVE], dl
	mov bx, 01
	
	call limpa_tela
	call delay
	
	mov bx, 160 + 98 + 10
	
	mov si, MSG1
	call imprime_msg
	
	mov si, MSG2
	call imprime_msg
	
	mov si, MSG3
	call imprime_msg
	
	mov si, MSG4
	call imprime_msg

	mov si, MSG5
	jmp call_kernel
	
limpa_tela:
	mov byte[ES:BX], 0h
	add bx, 2
	
	cmp bx, 4000
	jb limpa_tela
	
ret

delay:
	mov ah, 86h
	mov cx, 000Ah
	mov dx, 000Ah
	int 15h
ret

mini_delay:
	mov ah, 86h
	mov cx, 0001h
	mov dx, 3000h
	int 15h

ret

minimumer_delay
	mov ah, 86h
	mov cx, 0h
	mov dx, 0h
	int 15h
ret

imprime_msg:
	add bx, 160 - 98
	call print_string
	
	;call delay
	
	mov si, OK
	call print_string
	
ret

print_string:
	mov dl, byte[si]
	mov byte[ES:BX], dl
	inc bx
	
	mov byte[ES:BX],0x0a
	inc bx
	inc si

	call minimumer_delay
	
	cmp byte[SI], 0
	jne print_string
	
ret

call_kernel:
	add bx, 160 - 98
	call print_string
	
	call minimumer_delay
	
	mov si, OK
	call print_string
	
	call delay
	add BX, 320 - 98
	
	mov si, KERNELMSG
	call print_string
	
	call delay
	
	load_hd:
		mov di, bx
		
		mov ax, 07E0h
		mov es, ax
		xor bx, bx
		
		mov ah, 02h
		mov al, 10
		mov ch, 00h
		mov cl, 03h
		mov dh, 00h
		mov dl, byte[DRIVE]
		int 13h
		
		jc load_hd
jmp 7E00h
