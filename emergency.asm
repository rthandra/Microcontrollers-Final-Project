
 XREF emergen,tune,SendsChr,PlayTone,songcounter,X5, IRQ_flag,LED, Doorflag1,port_T
 XDEF emergency


emergency:      PSHX
                PSHY
                PSHA
                PSHB
                MOVB #$FF,IRQ_flag
                MOVW #0, songcounter
                LDX #emergen              ;load the address of first value of tune
                STX tune             ;store address of tune1 into tune variable
             
play5:          
                LDAA port_T
                ANDA #%01000000
                CMPA #%01000000
                BEQ finish5
                LDAA Doorflag1
                CMPA #1
                BEQ lightson
                CMPA #2
                BEQ lightsoff
                
        lightson:
                INC Doorflag1
                MOVB #$FF,LED
                BRA alarm
        lightsoff:
                DEC Doorflag1
                MOVB #$00,LED
                BRA alarm
                
        alarm:  LDX  tune
                LDAA 0,x                ;load variable into A
                PSHA                    ;push A into stack
                JSR SendsChr            ;play the sound
                PULA                    ;pull A from stack
                JSR PlayTone
               
                LDY songcounter        ;load delay counter
                CPY X5             ;compare to soundcounter
                BNE increment5          ;if not same, branch to increment counter
               
                MOVW #0, songcounter   ;reset counter to 0    
                LDX tune             ;proceed to the next tune
                INX
                LDY [0, x]
                CPY #0
                BEQ emergency                     ;increment x
                STX tune             ;store back into variable
                BRA play5              ;branch to end the the subroutine
               
increment5:     LDX songcounter        ;load counter
                INX                     ;increment counter
                STX songcounter        ;store back into variable
               
                BRA play5              ;end the subroutine                                                                
               
finish5:        
                
                PULB
                PULA
                PULY
                PULX
                RTS                     ;return subroutine

