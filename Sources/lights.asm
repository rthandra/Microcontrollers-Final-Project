  XREF port_T,LED,blinkercounter
  XDEF lighting


lighting: 
        
        PSHX
        PSHA
        PSHB
        LDAA port_T
        ANDA #%00000010
        CMPA #%00000010
        BEQ right
        LDAA port_T
        ANDA #%00000100
        CMPA #%00000100
        BEQ left
        
right:
      LDAA #$0F
      STAA LED
      INC blinkercounter
      LDX  blinkercounter
      CPX #157
      BLO exitlights
      MOVW #0,blinkercounter
      MOVB #0,LED
      BRA exitlights
      
left:
     LDAA #$F0
     STAA LED
     INC blinkercounter
     LDX blinkercounter
     CPX #157
     BLO exitlights
     MOVW #0,blinkercounter
     MOVB #0,LED
     BRA exitlights
     
 hazard:
     LDAA #$FF
     STAA LED
     INC blinkercounter
     LDX blinkercounter
     CPX #157
     BLO exitlights
     MOVW #0,blinkercounter
     MOVB #0,LED
     BRA exitlights
     
 exitlights:
          PULB
          PULA
          PULX
          RTS
        
