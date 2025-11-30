  XREF radiocount,disp3,song1,song2,song3,song4
  XDEF channel
  


channel: 

    LDAA radiocount
    CMPA #1
    BEQ channelA
    CMPA #2
    BEQ channelB
    CMPA #3
    BEQ channelC
    CMPA #4
    BEQ channelD
          
   channelA:
          
          LDAA #65
          STAA disp3+9
          BRA exit3
          
   channelB:       
          LDAA #66
          STAA disp3+9
          BRA exit3
          
   channelC:
          LDAA #67
          STAA disp3+9
          BRA exit3
          
   channelD:
          LDAA #68
          STAA disp3+9  
          BRA exit3
          
          
  exit3: 
        RTS