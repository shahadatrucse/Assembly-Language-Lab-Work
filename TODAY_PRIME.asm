.MODEL SMALL                 
.STACK 100H
.DATA

TWO DB 2
THREE DB 3
FIVE DB 5
SEVEN DB 7
ELEVEN DB 11
THIRTEEN DB 13       

NUMBER DW 0
STR DB 5 DUP ('$')
NEWLINE DB 0AH,0DH,'$'
PRIME DB "THIS NUMBER IS  PRIME$"
NOT_PRIME DB "THIS NUMBER IS NOT PRIME$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    MOV SI,0
    SCAN:
        INT 21H
        CMP AL,0DH
        JE END_SCAN
        MOV STR[SI],AL
        INC SI
        JMP SCAN
    
    END_SCAN:
        CALL MAKENUMBER
        
        CMP NUMBER,1
        JE LAST
        
        MOV AX,NUMBER
        CMP AL,TWO
        JE IS_PRIME
        DIV TWO
        CMP AH,0
        JE LAST
        
        MOV AX,NUMBER
        CMP AL,THREE
        JE IS_PRIME
        DIV THREE
        CMP AH,0
        JE LAST    
        
        MOV AX,NUMBER
        CMP AL,FIVE
        JE IS_PRIME
        DIV FIVE
        CMP AH,0
        JE LAST
        
        MOV AX,NUMBER
        CMP AL,SEVEN
        JE IS_PRIME
        DIV SEVEN
        CMP AH,0
        JE LAST
        
        MOV AX,NUMBER
        CMP AL,ELEVEN
        JE IS_PRIME
        DIV ELEVEN
        CMP AH,0
        JE LAST
        
        MOV AX,NUMBER
        CMP AL,THIRTEEN
        JE IS_PRIME
        DIV THIRTEEN
        CMP AH,0
        JE LAST
        
        
        IS_PRIME:
            LEA DX,PRIME
            JMP BELOW
        
        LAST:
            LEA DX,NOT_PRIME
            
            
        BELOW: 
            CALL PRINTLINE
            MOV AH,9
            INT 21H
            
            
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

MAKENUMBER PROC
    PUSH DX
    PUSH AX
    PUSH BX
    
    MOV AX,0
    MOV SI,0
    MOV BL,10
    ITERATE:
        MOV DL,STR[SI]
        CMP DL,'$'
        JE END_ITERATE
        SUB DL,'0'
        MUL BL 
        ADD AL,DL
        INC SI
        JMP ITERATE
    
    END_ITERATE:
        MOV NUMBER,AX
        POP BX
        POP AX
        POP DX
        RET
        MAKENUMBER ENDP
END MAIN
         
        
        
            


 