 
  XREF disp4,PORT_P, fuel
  XDEF refuel

 refuel: PSHA
        LDAA PORT_P
        BITA #$20
        BNE notPB
        LDAA #100
        STAA fuel
  
  notPB:
  
      PULA
      RTS