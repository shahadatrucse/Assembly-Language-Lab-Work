.MODEL SMALL
.STACK 100H

.DATA 
MSG DB 80 DUP <?>
COUNT DB '0'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
         
    MOV SI,0000H
    MOV DI,0000H
    
    
    MOV AH,01H 
    
    SCAN:
        INT 21H
        CMP AL,0DH
        JE EXIT
        
        MOV MSG[SI],AL
        INC SI
        JMP SCAN
        
    EXIT:
        MOV AH,02H
        MOV DL,0AH
        INT 21H 
                
    COUNT_WORD:
        CMP SI,DI 
        JE EXIT2
        
        CMP MSG[DI],' '
        JE CNT
        
        INC DI
        JMP COUNT_WORD
        
        CNT:
            INC COUNT
            INC DI
            JMP COUNT_WORD
        
         
    EXIT2:
        ADD COUNT,1
        MOV DL,COUNT
        INT 21H 
        
        MOV AH,4CH
        INT 21H
   
        
    MAIN ENDP
END MAIN
        
        
        
        
        
        
    
    

                 