.MODEL SMALL
.STACK 100H

.DATA
MSG DB 80 <?>
CNT DB '0'

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
        
     COUNT_DIGIT:
        CMP SI,DI
        JE EXIT2
        
        CMP MSG[DI],'0'
        JL LAST
        
        CMP MSG[DI],'9'
        JG LAST
        
        INC CNT
        
         LAST:
            INC DI
            JMP COUNT_DIGIT
        
     EXIT2:
        MOV DL,CNT
        MOV AH,02H
        INT 21H
        
        MOV AH,24H
        INT 21H
     MAIN ENDP
END MAIN
        
        
    
    
    