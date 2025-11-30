;**************************************************************
;* This stationery serves as the framework for a              *
;* user application. For a more comprehensive program that    *
;* demonstrates the more advanced functionality of this       *
;* processor, please see the demonstration applications       *
;* located in the examples subdirectory of the                *
;* Freescale CodeWarrior for the HC12 Program directory       *
;**************************************************************
; Include derivative-specific definitions
;Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF Entry, _Startup, 
            ; we use export 'Entry' as symbol. This allows us to
            ; reference 'Entry' either in the linker .prm file
            ; or from C/C++ later on

            XREF __SEG_END_SSTACK; symbol defined by the linker for the end of the stack
            XREF RTI_ISR,Display_LCD,init_LCD,ignition
            
            ;Keypad 
            XDEF sequence,table, PORT_U, index,LED,lcdcount,speedcount
            XREF keypad
            
            ;variable values
            XDEF radiocount
            
            ;Mainmenu 
            XREF mainmenu,init_disp
            XDEF disp1,disp2,disp3,disp4
            
            ;Engine
            XDEF enginesequence, enginecounter,PORT_P,fuelcounter,speedidlecounter
            XDEF speed15counter,speed30counter,speed45counter,speed60counter,steeringcounter,steeringslowcounter, RTIFLG
            XDEF enginesequence1,enginesequence2,enginesequence3,enginesequence4
           
            ;fuel
            XDEF fuel,fuelflag
            
            ;lights
            XREF lights
            XDEF port_T,blinkeroncounter, blinkeroffcounter,blikeronflag,HLval,Dooroncounter,Doorflag1,Doorflag2, Dooroffcounter
            
            ;steering
            XDEF port_T_ddr, steering_flag
            
            ;speaker
            XDEF songcounter,music1,music2,music3,music4,tune,X1,X2,X3,X4, song_flag1,song_flag2,song_flag3,song_flag4,ignitions_flag
            XDEF emergen,X5,INT_CR, IRQ_flag, startcar

; variable/data section
my_variable: SECTION
  
  ;LCD related
  
  index:     ds.b  1
  disp1:	   ds.b 33
  disp2:     ds.b 33
  disp3:     ds.b 33
  disp4:     ds.b 33


  ;menucounters
  lcdcount:  ds.b  1 
  radiocount: ds.b 1
  speedcount:  ds.b 1
  ;speed: ds.b 1
  
  ;flags
  ignitions_flag: ds.b 1
  mainmenu_flag:  ds.b 1
  speed_flag: ds.b 1
  steering_flag: ds.b 1
  steering_slow: ds.b 1
  fuelflag: ds.b 1
  blikeronflag: ds.b 1
  song_flag: ds.b 1
  song_flag1: ds.b 1
  song_flag2: ds.b 1
  song_flag3: ds.b 1
  song_flag4: ds.b 1
  Doorflag1: ds.b 1
  Doorflag2: ds.b 1
  IRQ_flag: ds.b 1
  ;timer counters
  fuelcounter: ds.w 1
  speedidlecounter: ds.w 1
  speed15counter: ds.w  1
  speed30counter: ds.w 1
  speed45counter: ds.w 1
  speed60counter: ds.w 1
  steeringcounter: ds.b 1
  steeringslowcounter: ds.w 1
  blinkeroncounter: ds.w 1
  blinkeroffcounter: ds.w 1
  songcounter: ds.w 1
  Dooroncounter: ds.w 1
  Dooroffcounter: ds.w 1
  ;engine
  enginecounter: ds.b 1
  
  ;fuel 
  fuel: ds.w 1
  
  ;light
  HLval: ds.w 1
  
  ;speaker
  tune:  ds.w 1
  
  
  
My_constant: SECTION
   RTIFLG:    equ  $0037
   
   enginesequence: dc.b $0A,$12,$14,$0C
   enginesequence1: dc.b $0A
   enginesequence2: dc.b $12
   enginesequence3: dc.b $14
   enginesequence4: dc.b $0C 
   PORT_P:	  equ	  $258
   DDR_P:  	  equ	  $25A
   mask2:     equ   $04
    
  ;Port_S
  LED:       equ $248
  LED_ddr:   equ $24A
  
  ;Port_T
  port_T:    equ  $240
  port_T_ddr:  equ $242
  
  ;Keypad
  PORT_U:   equ   $268
  DDR_U:    equ   $26A
  PER_U:    equ   $26C
  PSR_U:    equ   $26D
  
  sequence: dc.b  $70, $B0, $D0, $E0, 0
  

  table:    dc.b  $eb, $77, $7b, $7d, $b7, $bb, $bd, $d7             
            dc.b  $db, $dd, $e7, $ed, $7e, $be, $de, $ee, 0
  ;speaker
  music1: dc.b   50,70,80,0
  music2: dc.b   60,80,90,0
  music3: dc.b   40,10,30,0
  music4: dc.b   40,90,70,0
  emergen:dc.b   50,70,50,70,0
  X1: dc.w $ffff
  X2: dc.w $ffff
  X3: dc.w $ffff
  X4: dc.w $ffff
  X5: dc.w $7fff 
  
  INT_CR: equ $1E        

; code section
MyCode:     SECTION
Entry:
_Startup:
  
  ;Initialize counter
  MOVW #0,fuelcounter
  MOVW #0,speedidlecounter
  MOVW #0,speed15counter
  MOVW #0,speed30counter
  MOVW #0,speed45counter
  MOVW #0,speed60counter
  MOVB #0,steeringcounter
  MOVW #0,steeringslowcounter
  MOVW #0,blinkeroncounter
  MOVW #0,blinkeroffcounter
  MOVW #0,songcounter
  MOVW #0,Dooroncounter
  MOVW #0,Dooroffcounter
  
  ;initialise fuel capacity
  MOVW #$FF,fuel
  
  ;dc motor
  MOVB #$28, port_T_ddr
  ;speaker
  
  
   ;Initialize menu counters
  MOVB #1,lcdcount
  MOVB #1,radiocount
  MOVB #1,speedcount
  
  
   ;Initialize flags
  MOVB #0,mainmenu_flag
  MOVB #0,speed_flag
  MOVB #0,steering_flag
  MOVB #0,steering_slow 
  MOVB #0,fuelflag 
  MOVB #0,blikeronflag
  MOVB #0,song_flag1
  MOVB #0,song_flag2
  MOVB #0,song_flag3
  MOVB #0,song_flag4
  MOVB #1,Doorflag1
  MOVB #0,Doorflag2
  MOVB #$FF,ignitions_flag
  MOVB #$FF, IRQ_flag
   
  MOVB  #$F0, DDR_U     ;make bits 0-3 inputs and bits 4-7 outputs
  MOVB  #$F0, PSR_U     ;set pins 0-3 as pull-up device
  MOVB  #$0F, PER_U     ;activate pull-up device on pins 0-3                    ; enable interrupts
  
  MOVB #$FF,LED_ddr
  MOVB #0,LED
  
  ;stepper motor
  MOVB	#$1E, DDR_P
  MOVB  #0,enginecounter             
  LDS   #__SEG_END_SSTACK 
  
  startcar:
   
      JSR ignition          
  CLI
        
        MOVB  #$10, RTICTL    ;set RTI interval of 1ms
        MOVB  #$80, CRGINT    ;enable RTI
    
        MOVB  #$C0, INTCR        

Start:
       
      
      JSR mainmenu
      
      BRA Start


