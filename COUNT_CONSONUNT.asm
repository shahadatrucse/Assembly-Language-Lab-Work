.MODEL SMALL
.STACK 100H

.DATA
MSG DB 80 DUP (?)  
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
        
    COUNT_CONSONENT:
        CMP SI,DI
        JE EXIT2
        
        CMP MSG[DI],'A'
        JL NOT_COUNT
        CMP MSG[DI],'Z'
        JG LOWERCASE
        
        JMP COUNT
        
        LOWERCASE:
            CMP MSG[DI],'a'
            JL NOT_COUNT
            CMP MSG[DI],'z'
            JG NOT_COUNT
            
            JMP COUNT 
            
        NOT_COUNT:
            INC DI
            JMP COUNT_CONSONENT
        
        
        
        COUNT: 
        
        CMP MSG[DI],'A'
        JZ NOT_COUNT  
        
        CMP MSG[DI],'E'
        JZ NOT_COUNT
        
        CMP MSG[DI],'I'
        JZ NOT_COUNT
        
        CMP MSG[DI],'O'
        JZ NOT_COUNT
        
        CMP MSG[DI],'U'
        JZ NOT_COUNT     
        
        CMP MSG[DI],'a'
        JZ NOT_COUNT  
        
        CMP MSG[DI],'e'
        JZ NOT_COUNT
        
        CMP MSG[DI],'i'
        JZ NOT_COUNT
        
        CMP MSG[DI],'o'
        JZ NOT_COUNT
        
        CMP MSG[DI],'u'
        JZ NOT_COUNT
        
        INC CNT
        INC DI
        JMP COUNT_CONSONENT 
        
        
        
        EXIT2:
            MOV DL,CNT
            MOV AH,02H
            INT 21H
            
            MOV AH,4CH
            INT 21H
            
        MAIN ENDP
END MAIN 
        
            
            