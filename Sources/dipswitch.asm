                ;movb #$ff, port_s_ddr
;opening:         ldaa port_t
                 ;cmpa #$01 
                 ;beq opendoor 
         	 ;cmpa #$02 
                ; beq rightsignal 
	         ;cmpa #$04
                ; beq leftsignal 
		 ;cmpa #$06
		 ;beq hazardlights 
		; cmpa #$80
		; beq bothlightson
                 

;rightsignal:     ldab #$01
	         ;stab port_s 
		 ;bra opening 
;leftsignal:      ldab #$80
		 ;stab port_s 
		 ;bra opening 

;bothlightson:    ldab #$18
		; stab port_s
	;	 bra opening 

;opendoor:        jsr    


;hazardlights:   
