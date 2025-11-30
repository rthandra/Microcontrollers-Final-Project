 XREF speedcount,disp2
 XDEF currentRPM


currentRPM: 

    LDAA speedcount
    CMPA #1
    BEQ RPM1
    CMPA #2
    BEQ RPM2
    CMPA #3
    BEQ RPM3
    CMPA #4
    BEQ RPM4
    CMPA #5
    BEQ RPM5
    
          
   ;reverseRPM:
          ;LDAA #49
          ;STAA disp2+9
          ;LDAA #49
          ;STAA disp2+10
          ;LDAA #48
          ;STAA disp2+11
          ;LDAA #48
         ; STAA disp2+12
         ; JMP exit5
          
   RPM1:       
          LDAA #56
          STAA disp2+9
          LDAA #48
          STAA disp2+10
          LDAA #48
          STAA disp2+11
          JMP exit5
          
   RPM2:
          LDAA #49
          STAA disp2+9
          LDAA #49
          STAA disp2+10
          LDAA #48
          STAA disp2+11
          LDAA #48
          STAA disp2+12
          JMP exit5
          
   RPM3:
          LDAA #49
          STAA disp2+9
          LDAA #52
          STAA disp2+10
          LDAA #48
          STAA disp2+11
          LDAA #48
          STAA disp2+12
          JMP exit5
   RPM4:
          LDAA #49
          STAA disp2+9
          LDAA #55
          STAA disp2+10
          LDAA #48
          STAA disp2+11
          LDAA #48
          STAA disp2+12
          JMP exit5
   RPM5:
          LDAA #50
          STAA disp2+9
          LDAA #49
          STAA disp2+10
          LDAA #48
          STAA disp2+11
          LDAA #48
          STAA disp2+12
          JMP exit5
          
          
          
  exit5: 
        RTS