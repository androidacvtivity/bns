UPDATE  CIS2.RENIM VBG
            
            SET (VBG.CAEM2) = (
            
            SELECT 
            
                ABN.CAEM2
                
                FROM USER_BANCU.TUR_2020 ABN
                
                WHERE 
                   
                   VBG.CUIIO       = ABN.CUIIO AND 
                   VBG.CUIIO_VERS  = ABN.CUIIO_VERS 
                   
                  
                   
                   )
                   
                  WHERE EXISTS
                   
                   (
                   
                   
                   SELECT 
            
                ABN.*
                
                FROM USER_BANCU.TUR_2020 ABN
                
                WHERE 
                   
                   VBG.CUIIO       = ABN.CUIIO AND 
                   VBG.CUIIO_VERS  = ABN.CUIIO_VERS 
                   
                
                   
                   )