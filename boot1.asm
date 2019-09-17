org 7C00h

jmp 0000h:inicio

DRIVE:	db 0

inicio:
	xor AX, AX		; zera DS
	mov DS, AX
	
	mov byte[DRIVE], DL
	
	reset:
		mov AH, 00h		; reseta o disco
		int 13h
		
		jc reset		; reseta até obter êxito
		
	load_hd:
		mov AX, 0050h
		mov ES, AX		; carrega o ponteiro para a memória (endereço 0500h)
		xor BX, BX
		
		mov AH, 02h		; faz leitura do disco (carrega em ES:BX)
		mov AL, 02h		; setores a serem lidos = 2
		mov CH, 00h		; nº da linha = 0
		mov CL, 02h		; nº do setor = 2
		mov DH, 00h
		mov DL, byte[DRIVE]
		int 13h
		
		jc load_hd		; se houve erro, exibe uma mensagem
	
	jmp 0500h

times 510-($-$$) db 00
dw 0AA55h
