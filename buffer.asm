sseg SEGMENT STACK ;início seg. pilha
byte 4000h DUP(?) ;dimensiona pilha
sseg ENDS ;fim seg. pilha
dseg SEGMENT PUBLIC ;início seg. dados
byte 4000h DUP(?) ;temporários
sword ? ;inteiro numero
byte 100h DUP(?) ;string nome em 16386
byte ? ;logico verificador
dseg ENDS ;fim seg. dados
cseg SEGMENT PUBLIC ;início seg. código
ASSUME CS:cseg, DS:dseg
strt:
mov ax, dseg
mov ds, ax
dseg SEGMENT PUBLIC
byte "digite seu nome: $"
dseg ENDS
; "digite seu nome: " em 16643
mov dx, 16643
mov ah, 09h
int 21h
mov dx, 0
mov al, 0FFh
mov ds:[0], al
mov ah, 0Ah
int 21h
mov ah, 02h
mov dl, 0Dh
int 21h
mov DL, 0Ah
int 21h
mov di, 02;posição do string
mov si, 16386
R0:
mov al, ds:[di]
cmp al, 0dh ;verifica fim string
je R1 ;salta se fim string
mov ds:[si], al ;próximo caractere
add di, 1 ;incrementa base
add si, 1
jmp R0 ;loop
R1:
mov al, 024h ;fim de string
mov ds:[si], al ;grava '$'
mov ax, 0FFh ; const true
mov DS:[0], al
; true em 0
mov al, DS:[0]
mov DS:[16642], ax
mov ax, 0 ; const 0
mov DS:[0], al
; 0 em 0
mov al, DS:[0]
mov ah, 0
mov DS:[16384], ax
mov ah, 4Ch
int 21h
cseg ENDS ;fim seg. código
END strt ;fim programa
