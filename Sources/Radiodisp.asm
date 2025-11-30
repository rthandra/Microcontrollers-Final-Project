  XREF init_LCD
  XREF display_string 
  XREF __SEG_END_SSTACK   
  XDEF Radio_LCD
  XREF speedcount

  my_variable: SECTION
  org $A00
  disp3:	ds.b 33




  Radio_LCD:
  
          PSHD
;*********************string initializations*********************
           ;intializing string "disp" to be:
           ;"The value of the pot is:      ",0
           movb #'R',disp3
           movb #'P',disp3+1
           movb #'M',disp3+2
           movb #':',disp3+3
           movb #' ',disp3+4
           movb #' ',disp3+5
           movb #' ',disp3+6
           movb #' ',disp3+7
           movb #' ',disp3+8
           movb #' ',disp3+9
           movb #' ',disp3+10
           movb #' ',disp3+11
           movb #' ',disp3+12
           movb #' ',disp3+13
           movb #' ',disp3+14
           movb #' ',disp3+15
           movb #' ',disp3+16
           movb #' ',disp3+17
           movb #' ',disp3+18
           movb #' ',disp3+19
           movb #' ',disp3+20
           movb #' ',disp3+21
           movb #' ',disp3+22
           movb #' ',disp3+23
           movb #' ',disp3+24
           movb #' ',disp3+25
           movb #' ',disp3+26
           movb #' ',disp3+27
           movb #' ',disp3+28
           movb #' ',disp3+29
           movb #' ',disp3+30
           movb #' ',disp3+31
           movb #0,disp3+32    ;string terminator, acts like '\0'    
;*********************string initialization*********************





;**************************************************************
;
          LDS   #__SEG_END_SSTACK          
          JSR   init_LCD  ;initialized LCD 
    
          LDAA   #49
          STAA  disp3+10 ;store hundreds
          LDAA   #53
          STAA  disp3+11     
         
          
          LDD   #disp3
          JSR   display_string   ;call display_string
            ;repeat steps 

          PULD
          RTS
;**************************************************************

