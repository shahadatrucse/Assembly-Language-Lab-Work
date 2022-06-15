.MODEL SMALL
.STACK 100H

.DATA
MSG DB 80 DUP <?>
MIN DB 125
MAX DB 0

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
        
    ITERATE:
        CMP SI,DI
        JE EXIT2
        
        MOV DH,MSG[DI]
        
        
        
        CMP MIN,DH
        JG MIN_ASCI
        
        CMP MAX,DH
        JL MAX_ASCI
        
        INC DI
        JMP ITERATE                   
        
        MIN_ASCI:
            MOV MIN,DH
            CMP DI,0000H  
            JE MAX_ASCI
            INC DI
            JMP ITERATE
            
        MAX_ASCI:
            MOV MAX,DH
            INC DI
            JMP ITERATE
    EXIT2:
        MOV DL,MIN
        INT 21H
        
        MOV DL,MAX
        INT 21H
        
        MOV AH,4CH
        INT 21H
        
   MAIN ENDP
END MAIN

            
            
        
        
        
        

                                                  