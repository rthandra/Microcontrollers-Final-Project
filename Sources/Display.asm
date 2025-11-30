  
   
    
  XDEF Display_LCD
  XREF init_LCD
  XREF display_string 
  XREF __SEG_END_SSTACK   
  XREF lcdcount,init_disp,disp1,disp2,disp3,disp4



 Display_LCD:
               
          JSR   init_disp   
          JSR   init_LCD  ;initialized LCD 
          LDAA  lcdcount
          CMPA  #1
          BEQ   Dispspeed
          CMPA  #2
          BEQ   Disprpm
          CMPA  #3
          BEQ   Dispradio
          CMPA  #4
          BEQ    Dispfuel
          
  Dispspeed:
             LDD   #disp1
             JSR   display_string
             BRA  exit  ;call display_string
                       ;repeat steps
                       
   Disprpm:
             
             LDD  #disp2
             JSR  display_string
             BRA  exit  ;call display_string
                       ;repeat steps
   Dispradio: 
            
             LDD   #disp3
             JSR   display_string
             BRA  exit  ;call display_string
                       ;repeat steps
   Dispfuel:
             
             LDD  #disp4
             JSR  display_string
             BRA  exit  ;call display_string
                       ;repeat steps  
                       
                       
        
         
           

          exit: 	
              	RTS
              
;**************************************************************


 
