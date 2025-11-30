  XREF port_T, port_T_ddr
  XDEF steering
  XREF  sequence, PORT_U, table, index,steering_flag,steeringcounter
            

steering:
      PSHA
      PSHB
      PSHX
      PSHY
     
      
 
 steeroff:
  
  
  rescan2: 
            LDAA #$B0
            STAA PORT_U
            INC steeringcounter 
            JSR delay2
            LDAA PORT_U
            ANDA #$0F
            CMPA #$0F
            BEQ stopsteer
            BNE rescan2
  
  stopsteer:
           LDAA steeringcounter
           CMPA #5
           BNE rescan2
           MOVB #0,steeringcounter 
           BCLR port_T, #$08
               
              
  exitsteer:      
             PULY
             PULX
             PULB
             PULA          
             RTS
            
            
            
            
  delay2: 
         PSHY
         LDY    #5000
         
  dms2:  DEY
         BNE  dms2
         PULY 
         RTS
            
           
