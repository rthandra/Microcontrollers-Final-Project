  XREF speedcount,disp1,disp2
  XDEF currentspeedRPM


currentspeedRPM: 

    LDAA speedcount
    CMPA #1
    BEQ speed1
    CMPA #2
    BEQ speed2
    CMPA #3
    BEQ speed3
    CMPA #4
    BEQ speed4
    CMPA #5
    JMP speed5
    
          
   ;reverse:
          ;LDAA #45
          ;STAA disp1+9
          ;LDAA #49
          ;STAA disp1+10
          ;LDAA #53
          ;STAA disp1+11
          ;JMP exit4
          
   speed1:
          LDAA #56
          STAA disp2+9
          LDAA #48
          STAA disp2+10
          LDAA #48
          STAA disp2+11       
          LDAA #48
          STAA disp1+9
          LDAA #48
          STAA disp1+10
          JMP exit4
          
          
   speed2:
          LDAA #49
          STAA disp2+9
          LDAA #49
          STAA disp2+10
          LDAA #48
          STAA disp2+11
          LDAA #48
          STAA disp2+1
          LDAA #49
          STAA disp1+9
          LDAA #53
          STAA disp1+10
          JMP exit4
          
          
   speed3:
          LDAA #49
          STAA disp2+9
          LDAA #57
          STAA disp2+10
          LDAA #48
          STAA disp2+11
          LDAA #48
          STAA disp2+12
          LDAA #51
          STAA disp1+9
          LDAA #48
          STAA disp1+10
          JMP exit4
          
   speed4:
         LDAA #50
          STAA disp2+9
          LDAA #55
          STAA disp2+10
          LDAA #48
          STAA disp2+11
          LDAA #48
          STAA disp2+12
         LDAA #52
         STAA disp1+9
         LDAA #53
         STAA disp1+10
         JMP exit4
         
   speed5:
          LDAA #51
          STAA disp2+9
          LDAA #53
          STAA disp2+10
          LDAA #48
          STAA disp2+11
          LDAA #48
          STAA disp2+12
        LDAA #54
        STAA disp1+9
        LDAA #48
        STAA disp1+10
        JMP exit4
          
          
          
          
  exit4: 
        RTS