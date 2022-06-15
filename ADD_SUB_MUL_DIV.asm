.MODEL SMALL

.STACK 100H

.DATA
A DB ?
B DB ? 
NEWLINE DB 0AH,0DH,'$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV A,AL
    INT 21H
    SUB AL,'0'
    MOV B,AL
    
    
    ADD AL,A
    CALL PRINTX 
    
    INT 21H
    
    MOV AL,A ; 2
    SUB AL,B ; 5
    CALL PRINTX
    
    MOV AL,A
    MUL B
    CALL PRINTX
    
    MOV AH,0
    MOV AL,A
    DIV B
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
    ;PUSH DX
    ;PUSH AX
    ;PUSH BX
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
    INT 21H
    ;POP BX
    ;POP AX
    ;POP DX
    RET
    PRINTX ENDP
END MAIN
    
    
    
    
    
    
    
     
        
        
    
        
    