  XDEF mainmenu
  XREF keypad,index,LED,lcdcount,Display_LCD, Start,radiocount,speedcount,steering,steering_flag,ignitions_flag, port_T,refuel


mainmenu:
    JSR refuel
    LDAA #$FF
    CMPA ignitions_flag
    LBEQ done1
     

    JSR keypad
    LDAA index
     CMPA #4
    LBEQ steer
    CMPA #6
    LBEQ steer
    CMPA #2
    BEQ Speedh
    CMPA #8
    BEQ Speedl
    CMPA #$A
    BEQ Menuright
    CMPA #$B
    BEQ Menuleft
    CMPA #$E
    BEQ Radioup
    CMPA #$F
    BEQ Radiodown
    
    
 
  Speedh:
      INC  speedcount
      LDAA speedcount
      CMPA #6
      BEQ maxspeed
      JSR Display_LCD
      LBRA done1
     
  maxspeed:
     MOVB #4,speedcount
     BRA Speedh
     
  Speedl:
     DEC speedcount
     CMPA #0
     BEQ minspeed
     JSR Display_LCD
     BRA done1
  
  minspeed:
    MOVB #2,speedcount
    BRA Speedl
 
  Menuright:
     INC lcdcount
     LDAA lcdcount
     CMPA #6
     BEQ resetlcd
     JSR  Display_LCD
     BRA  done1
     
 resetlcd:
    MOVB #1,lcdcount
    BRA Menuright
  
 Menuleft:
    DEC lcdcount
    LDAA lcdcount
    CMPA #0
    BEQ  resetlcd2
    JSR  Display_LCD
    BRA  done1
    
 resetlcd2:
    MOVB #5,lcdcount
    BRA Menuleft
    
 Radioup:
     INC radiocount
     LDAA radiocount
     CMPA #6
     BEQ resetradio
     JSR Display_LCD
     BRA done1
     
 resetradio:
     MOVB #1,radiocount
     BRA Radioup
     
 Radiodown:
     DEC radiocount
     LDAA radiocount
     CMPA #0
     BEQ resetradio2
     JSR Display_LCD
     BRA done1
 
 resetradio2:
     MOVB #5,radiocount
     BRA Radiodown
     
  steer:
           
       BSET port_T, #$08
             
       JSR steering
       bra done1
       
 
       
      
  done1:
        RTS
        
    
    
    
    
    
    
    
    
    
  
  