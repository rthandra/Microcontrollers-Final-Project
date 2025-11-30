;XDEF SendMessageInfo
  XDEF  song1,song2,song3,song4
 
  XREF  SendsChr, PlayTone
  XREF  music1,music2,music3,music4, X1,X2,X3,X4, tune, songcounter, song_flag1,song_flag2,song_flag3,song_flag4,radiocount


;-------------------------------- sound 1 ----------------------------------

  song1:          PSHX
                PSHY
                PSHA
                PSHB
               
                MOVW #0, songcounter
                LDX #music1              ;load the address of first value of tune
                STX tune              ;store address of tune1 into tune variable
             
play1:          
                
                LDX  tune
                LDAA 0,x                ;load variable into A
                PSHA                    ;push A into stack
                JSR SendsChr            ;play the sound
                PULA                    ;pull A from stack
                JSR PlayTone
               
                LDY songcounter        ;load delay counter
                CPY X2             ;compare to soundcounter
                BNE increment1          ;if not same, branch to increment counter
               
                MOVW #0, songcounter   ;reset counter to 0    
                LDX tune             ;proceed to the next tune
                INX                     ;increment x
                LDY [0, x]
                CPY #0
                BEQ finish1
                STX tune             ;store back into variable
                BRA play1              ;branch to end the the subroutine
               
increment1:     LDX songcounter        ;load counter
                INX                     ;increment counter
                STX songcounter        ;store back into variable
               
                BRA play1              ;end the subroutine

               
finish1:        
                MOVB #$FF,song_flag1
                PULB
                PULA
                PULY
                PULX
                RTS                          ;return subroutine    

;-------------------------------- sound 2 ------------------------------------        
         
song2:          PSHX
                PSHY
                PSHA
                PSHB
               
                MOVW #0, songcounter
                LDX #music2              ;load the address of first value of tune
                STX tune              ;store address of tune1 into tune variable
             
play2:          
                
                LDX  tune
                LDAA 0,x                ;load variable into A
                PSHA                    ;push A into stack
                JSR SendsChr            ;play the sound
                PULA                    ;pull A from stack
                JSR PlayTone
               
                LDY songcounter        ;load delay counter
                CPY X2             ;compare to soundcounter
                BNE increment2          ;if not same, branch to increment counter
               
                MOVW #0, songcounter   ;reset counter to 0    
                LDX tune             ;proceed to the next tune
                INX                     ;increment x
                LDY [0, x]
                CPY #0
                BEQ finish2
                STX tune             ;store back into variable
                BRA play2              ;branch to end the the subroutine
               
increment2:     LDX songcounter        ;load counter
                INX                     ;increment counter
                STX songcounter        ;store back into variable
               
                BRA play2              ;end the subroutine

               
finish2:        
                MOVB #$FF,song_flag2
                PULB
                PULA
                PULY
                PULX
                RTS                     ;return subroutine
                     
;-------------------------------- sound 3 ------------------------------------        
         
song3:          PSHX
                PSHY
                PSHA
                PSHB
                MOVW #0, songcounter
                LDX #music3              ;load the address of first value of tune
                STX tune             ;store address of tune1 into tune variable
             
play3:          
                
                LDX  tune
                LDAA 0,x                ;load variable into A
                PSHA                    ;push A into stack
                JSR SendsChr            ;play the sound
                PULA                    ;pull A from stack
                JSR PlayTone
               
                LDY songcounter        ;load delay counter
                CPY X3             ;compare to soundcounter
                BNE increment3          ;if not same, branch to increment counter
               
                MOVW #0, songcounter   ;reset counter to 0    
                LDX tune             ;proceed to the next tune
                INX                     ;increment x
                LDY [0, x]
                CPY #0
                BEQ finish3
                STX tune             ;store back into variable
                BRA play3              ;branch to end the the subroutine
               
increment3:     LDX songcounter        ;load counter
                INX                     ;increment counter
                STX songcounter        ;store back into variable
               
                BRA play3              ;end the subroutine

               
finish3:        
                MOVB #$FF,song_flag3
                PULB
                PULA
                PULY
                PULX
                RTS                     ;return subroutine
               
;-------------------------------- sound 4 ------------------------------------        
         
song4:          PSHX
                PSHY
                PSHA
                PSHB
                MOVW #0, songcounter
                LDX #music4              ;load the address of first value of tune
                STX tune             ;store address of tune1 into tune variable
             
play4:          
               
                LDX  tune
                LDAA 0,x                ;load variable into A
                PSHA                    ;push A into stack
                JSR SendsChr            ;play the sound
                PULA                    ;pull A from stack
                JSR PlayTone
               
                LDY songcounter        ;load delay counter
                CPY X4             ;compare to soundcounter
                BNE increment4          ;if not same, branch to increment counter
               
                MOVW #0, songcounter   ;reset counter to 0    
                LDX tune             ;proceed to the next tune
                INX
                LDY [0, x]
                CPY #0
                BEQ finish4                     ;increment x
                STX tune             ;store back into variable
                BRA play4              ;branch to end the the subroutine
               
increment4:     LDX songcounter        ;load counter
                INX                     ;increment counter
                STX songcounter        ;store back into variable
               
                BRA play4              ;end the subroutine                                                                
               
finish4:        
                MOVB #$FF,song_flag4
                PULB
                PULA
                PULY
                PULX
                RTS                     ;return subroutine

