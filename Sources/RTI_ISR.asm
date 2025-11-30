 ; XREF index,Speedcount,lcdcount,Speed_LCD,radiocount,CRGFLG, keypad,LED , Display_LCD
  ;XDEF RTI_ISR 

  XREF stepper, RTIFLG,speedidlecounter,speed15counter,speed30counter,speed45counter,speed60counter,speedcount
  XREF fuel,fuelflag,disp4,fuelcounter
  XREF lights,lighting,LED,port_T,blinkeroncounter, blinkeroffcounter, blikeronflag,HLval,port_T_ddr,index,Doorcounter,Doorflag1,Doorflag2,Dooroffcounter,Dooroncounter
  XREF song1,song2,song3,song4,radiocount,lcdcount, song_flag1,song_flag2,song_flag3,song_flag4
 
  XREF enginecounter,steering,steering_flag,ignitions_flag
  
  XDEF RTI_ISR
 
RTI_ISR:

     LDAA #00
     CMPA ignitions_flag
     BEQ doors
     BSET   RTIFLG, #$80
     
  
  
  doors:
        ;BRSET Doorflag2,#$FF,steer 
        ;LDAA port_T
        ;ANDA #%00000001
        ;CMPA #%00000001
        ;BEQ dooron
        ;BNE resetdoor
        
  dooron:
     ;LDAA Doorflag1
     ;CMPA #$FF
     ;BEQ  dooroff
     ;LDAA #$00
     ;ORAA HLval
     ;STAA LED
     ;MOVW #$00,Dooroffcounter
     ;LDX Dooroncounter
     ;INX
     ;STX Dooroncounter
     ;CPX #3000
     ;BLO steer
     
 dooroff:
     ;MOVB #$FF,Doorflag1
     ;MOVW #0,Dooroncounter
     ;LDAA #$0F
     
     ;LDX Dooroffcounter
     ;INX
     ;STX Dooroffcounter
     ;CPX #6000
     ;BLO steer
     ;MOVB #0,Doorflag1
     ;MOVB #$FF,Doorflag2
     ;BRA steer
     
  resetdoor:
      ; MOVB #0,Doorflag2
       
     
     
 steer: BRSET steering_flag,#00,RadioRTI
        BSET port_T, #$08
     
   
 RadioRTI:
      LDAA lcdcount
      CMPA #3
      BEQ  playradio
      BNE  Headlights
      
 playradio:
      LDAA radiocount
      CMPA #1
      BEQ channel1
      CMPA #2
      BEQ channel2
     CMPA #3
      BEQ channel3
      CMPA #4
      BEQ channel4
      
 channel1:
      MOVB  #0,song_flag2
      MOVB  #0,song_flag3
      MOVB  #0,song_flag4
      BRSET song_flag1,#$FF,Headlights
      JSR song1
      
      BRA Headlights
      
 channel2:
      MOVB  #0,song_flag1
      MOVB  #0,song_flag3
      MOVB  #0,song_flag4
      BRSET song_flag2,#$FF,Headlights
      JSR song2
      BRA Headlights
      
 channel3:
      MOVB  #0,song_flag2
      MOVB  #0,song_flag1
      MOVB  #0,song_flag4
      BRSET song_flag3,#$FF,Headlights
      JSR song3
      BRA Headlights
      
 channel4:
      MOVB  #0,song_flag2
      MOVB  #0,song_flag3
      MOVB  #0,song_flag1
      BRSET song_flag4,#$FF,Headlights  
      JSR song4
      BRA Headlights
      
 Headlights:         
  
      JSR lights
 
 

 fuelRTI:
      LDAA #$FF
      CMPA fuelflag
      BEQ  lightsRTI  
      LDX fuelcounter
      INX
      STX fuelcounter
      CPX #400
      LBLO lightsRTI
      MOVB #0,fuelcounter
      ;LDX fuel
      ;DEX
      ;DEX
      ;STX fuel
      DEC fuel
      DEC fuel
      CPX #2
      BHI displayfuel
      MOVB #$FF,fuelflag
 
 displayfuel:
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
          
 
         
  
 lightsRTI:
      LDAA #$FF
      CMPA Doorflag1
      LBEQ speedchangeRTI 
      LDAA port_T
      ANDA #%00000110
      CMPA #%00000010
      BEQ rightonblink
      LDAA port_T
      ANDA #%00000110
      CMPA #%00000100
      BEQ leftonblink
      CMPA #%00000110
      CMPA #%00000110
      LBEQ hazardonblink
      CMPA #0
      LBEQ speedchangeRTI
      
 rightonblink:
     LDAA blikeronflag
     CMPA #$FF
     BEQ  rightoffblink
     LDAA #$00
     ORAA HLval
     STAA LED
     MOVW #$00,blinkeroffcounter
     LDX blinkeroncounter
     INX
     STX blinkeroncounter
     CPX  #3000
     LBLO speedchangeRTI
     
 rightoffblink:
     MOVB #$FF,blikeronflag
     MOVW #0,blinkeroncounter
     LDAA #$F0
     ORAA HLval
     STAA LED
     LDX blinkeroffcounter
     INX
     STX blinkeroffcounter
     CPX #3000
     LBLO speedchangeRTI
     MOVB #0,blikeronflag
     LBRA speedchangeRTI
     
 leftonblink:
     LDAA blikeronflag
     CMPA #$FF
     BEQ  leftoffblink
     LDAA #$00
     ORAA HLval
     STAA LED
     MOVW #$00,blinkeroffcounter
     LDX blinkeroncounter
     INX
     STX blinkeroncounter
     CPX #3000
     BLO speedchangeRTI
     
 leftoffblink:
     MOVB #$FF,blikeronflag
     MOVW #0,blinkeroncounter
     LDAA #$0F
     ORAA HLval
     STAA LED
     LDX blinkeroffcounter
     INX
     STX blinkeroffcounter
     CPX #3000
     BLO speedchangeRTI
     MOVB #0,blikeronflag
     BRA speedchangeRTI
     
 hazardonblink:
     LDAA blikeronflag
     CMPA #$FF
     BEQ  hazardoffblink
     LDAA #$00
     ORAA HLval
     STAA LED
     MOVW #$00,blinkeroffcounter
     LDX blinkeroncounter
     INX
     STX blinkeroncounter
     CPX #3000
     BLO speedchangeRTI
     
 hazardoffblink:
     MOVB #$FF,blikeronflag
     MOVW #0,blinkeroncounter
     LDAA #$E7
     ORAA HLval
     STAA LED
     LDX blinkeroffcounter
     INX
     STX blinkeroffcounter
     CPX #3000
     BLO speedchangeRTI
     MOVB #0,blikeronflag
     BRA speedchangeRTI 
     
         
speedchangeRTI:  
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
               CPX     #200                 ;equal to 1 second?
               BLO     exitRTI
               JSR     stepper
               MOVW    #0, speedidlecounter
               BRA     exitRTI
             
               
   speed15:
               LDX     speed15counter 
               INX                            ;increment 1s counter
               STX     speed15counter
               CPX     #150                ;equal to 1 second?
               BLO     exitRTI
               JSR     stepper
               MOVW    #0, speed15counter
               BRA     exitRTI
  
   speed30:
               LDX     speed30counter 
               INX                            ;increment 1s counter
               STX     speed30counter
               CPX     #130                 ;equal to 1 second?
               BLO     exitRTI
               JSR     stepper
               MOVW    #0, speed30counter
               BRA     exitRTI
               
   speed45:
               LDX     speed45counter 
               INX                            ;increment 1s counter
               STX     speed45counter
               CPX     #90                 ;equal to 1 second?
               BLO     exitRTI
               JSR     stepper
               MOVW    #0, speed45counter
               BRA     exitRTI
   
   speed60:
               LDX     speed60counter 
               INX                            ;increment 1s counter
               STX     speed60counter
               CPX     #60                 ;equal to 1 second?
               BLO     exitRTI
               JSR     stepper
               MOVW    #0, speed60counter
               BRA     exitRTI
             
               

    exitRTI:      BSET    RTIFLG, #$80           ;reset RTIF
                  RTI

