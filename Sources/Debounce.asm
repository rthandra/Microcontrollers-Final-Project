  XDEF  delay

delay:      PSHY 
            LDY   #1000            ;load y with value 5000 to delay for 1ms
dms:        DEY                    ;decrement index register Y
            BNE   dms           
            PULY
            RTS                    ;return from subroutine