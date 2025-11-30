
 XREF index, speedcount,fuelcounter
 XREF speedidlecounter,speed15counter,speed30counter,speed45counter,speed60counter,stepper
 
 XDEF counters
 
               PSHX
               PSHY
               PSHA
               PSHB
               
               
  
               
 
  counters:
               LDAA speedcount
               CMPA #1
               BEQ speedidle
               CMPA #2
               BEQ speed15
               CMPA #3
               BEQ speed30
               CMPA #4
               BEQ speed45
               CMPA #5
               BEQ speed60
               
               
               
   speedidle:
             

               LDX     speedidlecounter 
               INX                            ;increment 1s counter
               STX     speedidlecounter
               CPX     #157                 ;equal to 1 second?
               BLO     exitcounter
               MOVW    #0, speedidlecounter
             
               
   speed15:
               LDX     speed15counter 
               INX                            ;increment 1s counter
               STX     speed15counter
               CPX     #78                 ;equal to 1 second?
               BLO     exitcounter
               MOVW    #0, speedidlecounter
               
  
   speed30:
               LDX     speed30counter 
               INX                            ;increment 1s counter
               STX     speed30counter
               CPX     #40                 ;equal to 1 second?
               BLO     exitcounter
               MOVW    #0, speedidlecounter
               
   speed45:
               LDX     speed45counter 
               INX                            ;increment 1s counter
               STX     speed45counter
               CPX     #20                 ;equal to 1 second?
               BLO     exitcounter
               MOVW    #0, speedidlecounter
               
   
   speed60:
               LDX     speed60counter 
               INX                            ;increment 1s counter
               STX     speed60counter
               CPX     #10                 ;equal to 1 second?
               BLO     exitcounter
               MOVW    #0, speedidlecounter

    exitcounter:     PULB
                     PULA
                     PULY
                     PULX
                     RTS
