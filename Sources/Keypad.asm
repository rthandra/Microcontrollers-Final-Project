            XDEF  keypad, delay
            XREF  sequence, PORT_U, table, index
            
keypad:     PSHX
            PSHY
            PSHA
            PSHB
            
loop:       LDX   #sequence     ;load X with sequence to scan keypad

rescan:     LDAA  1, x+         
            BEQ   loop
            
            STAA  PORT_U        ;send sequence to Port U
            JSR   delay         ;wait for Port U to debounce
            LDAA  PORT_U
            ANDA  #$0F 
            CMPA  #$0F
            BEQ   rescan        ;scan next row if no key is pressed
            
            LDY   #table        ;load Y with lookup table value
            MOVB  #$0, index
            
lookup:     LDAB  1, y+     
            CMPB  PORT_U
            BEQ   done
            INC   index         ;set index value
            BRA   lookup                                         
            
done:       JSR   delay           
            LDAA  PORT_U
            ANDA  #$0F 
            CMPA  #$0F
            BNE   done          ;wait for Port
    
            
            PULB
            PULA
            PULY
            PULX
            
            RTS


;Delay subroutine:      
delay:      PSHY 
            LDY   #5000           ;load y with value 5000 to delay for 5ms
dms:        DEY                    ;decrement index register Y
            BNE   dms           
            PULY
            RTS                    ;return from subroutine