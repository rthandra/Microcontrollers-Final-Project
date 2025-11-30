  XREF init_LCD
  XREF display_string 
  XREF __SEG_END_SSTACK   
  XDEF Speed_LCD
  XREF speedcount
  XREF disp1


  Speed_LCD:
  
          PSHD
;*********************string initializations*********************
           ;intializing string "disp" to be:
           ;"The value of the pot is:      ",0
           movb #'R',disp1
           movb #'p',disp1+1
           movb #'e',disp1+2
           movb #'e',disp1+3
           movb #'d',disp1+4
           movb #' ',disp1+5
           movb #' ',disp1+6
           movb #' ',disp1+7
           movb #' ',disp1+8
           movb #' ',disp1+9
           movb #' ',disp1+10
           movb #' ',disp1+11
           movb #' ',disp1+12
           movb #' ',disp1+13
           movb #' ',disp1+14
           movb #' ',disp1+15
           movb #' ',disp1+16
           movb #' ',disp1+17
           movb #' ',disp1+18
           movb #' ',disp1+19
           movb #' ',disp1+20
           movb #' ',disp1+21
           movb #' ',disp1+22
           movb #' ',disp1+23
           movb #' ',disp1+24
           movb #' ',disp1+25
           movb #' ',disp1+26
           movb #' ',disp1+27
           movb #' ',disp1+28
           movb #' ',disp1+29
           movb #' ',disp1+30
           movb #' ',disp1+31
           movb #0,disp1+32    ;string terminator, acts like '\0'    
;*********************string initialization*********************





;**************************************************************
;
          LDS   #__SEG_END_SSTACK          
          JSR   init_LCD  ;initialized LCD 
    
          LDAA   #49
          STAA  disp1+10 ;store hundreds
          LDAA   #53
          STAA  disp1+11     
         
          
          LDD   #disp1
          JSR   display_string   ;call display_string
            ;repeat steps 

          PULD
          RTS
;**************************************************************

