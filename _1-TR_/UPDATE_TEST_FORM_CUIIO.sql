




         UPDATE CIS2.FORM_CUIIO VBG
            
            SET (VBG.STATUT) = (
            
            SELECT 
            
                ABN.STATUT
                
                FROM USER_BANCU.FORM_CUIIO_INSERT ABN
                
                WHERE 
                   
                   VBG.CUIIO       = ABN.CUIIO AND 
                   VBG.CUIIO_VERS  = ABN.CUIIO_VERS AND 
                   VBG.FORM =  ABN.FORM AND
	               VBG.FORM_VERS =  ABN.FORM_VERS
                   
                   )
                   
                  WHERE EXISTS
                   
                   (
                   
                   
                   SELECT 
            
                ABN.*
                
                FROM USER_BANCU.FORM_CUIIO_INSERT ABN
                
                WHERE 
                   
                   VBG.CUIIO       = ABN.CUIIO AND 
                   VBG.CUIIO_VERS  = ABN.CUIIO_VERS AND 
                   VBG.FORM =  ABN.FORM AND
	               VBG.FORM_VERS =  ABN.FORM_VERS
                   
                   )