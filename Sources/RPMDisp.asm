  XREF init_LCD
  XREF display_string 
  XREF __SEG_END_SSTACK   
  XDEF RPM_LCD
  XREF speedcount

  my_variable: SECTION
  org $900
  disp2:	ds.b 33




  RPM_LCD:
  
          PSHD
;*********************string initializations*********************
           ;intializing string "disp" to be:
           ;"The value of the pot is:      ",0
           movb #'R',disp2
           movb #'P',disp2+1
           movb #'M',disp2+2
           movb #':',disp2+3
           movb #' ',disp2+4
           movb #' ',disp2+5
           movb #' ',disp2+6
           movb #' ',disp2+7
           movb #' ',disp2+8
           movb #' ',disp2+9
           movb #' ',disp2+10
           movb #' ',disp2+11
           movb #' ',disp2+12
           movb #' ',disp2+13
           movb #' ',disp2+14
           movb #' ',disp2+15
           movb #' ',disp2+16
           movb #' ',disp2+17
           movb #' ',disp2+18
           movb #' ',disp2+19
           movb #' ',disp2+20
           movb #' ',disp2+21
           movb #' ',disp2+22
           movb #' ',disp2+23
           movb #' ',disp2+24
           movb #' ',disp2+25
           movb #' ',disp2+26
           movb #' ',disp2+27
           movb #' ',disp2+28
           movb #' ',disp2+29
           movb #' ',disp2+30
           movb #' ',disp2+31
           movb #0,disp2+32    ;string terminator, acts like '\0'    
;*********************string initialization*********************





;**************************************************************
;
          LDS   #__SEG_END_SSTACK          
          JSR   init_LCD  ;initialized LCD 
    
          LDAA   #49
          STAA  disp2+10 ;store hundreds
          LDAA   #53
          STAA  disp2+11     
         
          
          LDD   #disp2
          JSR   display_string   ;call display_string
            ;repeat steps 

          PULD
          RTS
;**************************************************************

