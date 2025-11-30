
  XREF fuelcounter,fuel,disp4,fuelflag

  XDEF fuell

fuell: PSHX
       PSHY
       PSHA
       PSHB
      
       
       
fuelloop: 
          LDX fuelcounter
          INX 
          CPX #500
          LBLO donefuel
          MOVB #0, fuelcounter
          DEC fuel
          DEC fuel
          LDD   fuel
          LDX   #100
          IDIV          ;D divide X and store in X (1), rem in D (47)
          XGDX          ;exchange D with X
          ADDD  #$30
          STAB  disp4+25 ;store hundreds 
          TFR   x,d
          LDX   #10     ;load x with 10
          IDIV          ;D divide 10 and store in X(4), rem in D(7)
          XGDX  
          ADDD  #$30
          STAB  disp4+26
          TFR   x,d
          ADDD  #$30     
          STAB  disp4+27
          LDD fuel
          CPD #0
          BEQ nofuel
          BRA donefuel
          
 nofuel:
       MOVB #$FF,fuelflag
       
 donefuel:
         PULB
         PULA
         PULY
         PULX

          
          
          
