.MODEL SMALL
.STACK 100H
.DATA

NUMBER DB 0
NEWLINE DB 0AH,0DH,'$'
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV AH,0
    SUB AL,'0'
    MOV CX,AX
    MOV AX,1
    FACTORIAL:
        MUL CL
        LOOP FACTORIAL
    CALL PRINTX
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
PRINTLINE PROC
    PUSH DX
    PUSH AX
    LEA DX,NEWLINE
    MOV AH,9
    INT 21H 
    POP AX
    POP DX
    RET
    PRINTLINE ENDP

PRINTX PROC
    PUSH DX
    PUSH AX
    PUSH BX
    CALL PRINTLINE
    MOV AH,0
    MOV BL,10
    DIV BL
    MOV BL,AH
    MOV DL,AL
    ADD DL,'0'
    MOV AH,2
    INT 21H
    MOV DL,BL
    ADD DL,'0'
    MOV AH,2
    INT 21H
    POP BX
    POP AX
    POP DX
    PRINTX ENDP
END MAIN
    
    
    