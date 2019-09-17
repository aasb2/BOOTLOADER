org 0500h

jmp inicio

MSG1:	db 'Carregando estruturas para o kernel...        ', 0
MSG2:	db 'Inicializando o modo protegido...             ', 0
MSG3:	db 'Carregando o kernel na memoria...             ', 0
OK:		db 'OK!', 0
KERNEL:	db 'Operacao concluida! Inicializando o kernel...', 0

DRIVE:	db 0

inicio:
	cli
	mov AX, 09000h
	mov SS, AX			; cria uma pilha
	mov SP, 0FB00h
	
	xor AX, AX			; zera DS
	mov DS, AX
	
	mov AX, 0B800h		; inicializa ES na memória de vídeo
	mov ES, AX
	sti
	
	mov byte[DRIVE], DL
	mov BX, 01
	
	call limpa_tela		; limpa a tela com a cor 3 = ciano
	call delay
	
	mov BX, 160 + 98 + 10
	
	mov SI, MSG1
	call imprime_msg
	
	mov SI, MSG2		; imprime as mensagens de load
	call imprime_msg
	
	mov SI, MSG3
	jmp call_kernel		; tenta carregar o kernel na memória
	
; -------------------- SUB-ROTINAS --------------------
	
limpa_tela:
	mov byte[ES:BX], 33h	; cor = ciano
	add BX, 2
	
	cmp BX, 4000
	jb limpa_tela
	
ret

delay:
	mov AH, 86h
	mov CX, 000Ah
	mov DX, 000Ah		; delay de (20 << 16 + 40)us
	int 15h
	
ret

mini_delay:
	mov AH, 86h
	mov CX, 0001h
	mov DX, 3000h
	int 15h

ret

imprime_msg:
	add BX, 160 - 98
	call print_string
	
	call delay
	
	mov SI, OK
	call print_string
	
	call delay
	
ret

print_string:
	mov DL, byte[SI]
	mov byte[ES:BX], DL			; escreve caractere na memória de vídeo
	inc BX
	
	mov byte[ES:BX], 34h		; seleciona o atributo do caractere (fundo = ciano, cor = vermelha)
	inc BX
	inc SI
	
	call mini_delay
	
	cmp byte[SI], 0
	jne print_string
	
ret

; -------------------- CHAMADA DO KERNEL --------------------

call_kernel:
	add BX, 160 - 98
	call print_string
	
	call delay
	
	mov SI, OK
	call print_string
	
	call delay
	add BX, 320 - 98
	
	mov SI, KERNEL
	call print_string
	
	call delay
	
	load_hd:
		mov DI, BX
		
		mov AX, 07E0h
		mov ES, AX		; carrega novo endereço (end. 7E00h)
		xor BX, BX
		
		mov AH, 02h		; faz nova leitura do disco
		mov AL, 10		; vai ler 10 setores
		mov CH, 00h		; nº da linha = 0
		mov CL, 03h		; nº do setor = 3
		mov DH, 00h
		mov DL, byte[DRIVE]
		int 13h
		
		jc load_hd		; se leu com sucesso, pula para o endereço do kernel (ES:00)
	
	jmp 7E00h
