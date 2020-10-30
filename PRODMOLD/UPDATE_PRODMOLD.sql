

        UPDATE CIS.RENIM R 
        
        SET (
        
        R.CAEM2 
        
        )
        
         = 
         (
         
           SELECT 
             VB.CAEM2 
              
              FROM USER_BANCU.VW_PRODMOLD_2006 VB 
              
              WHERE 
              VB.CUIIO        = R.CUIIO AND 
              VB.CUIIO_VERS   = R.CUIIO_VERS  
              
              
        )
        
        WHERE EXISTS   
        
         (
         
         SELECT  * 
             
              
              FROM USER_BANCU.VW_PRODMOLD_2006 VB 
              
              WHERE 
              VB.CUIIO        = R.CUIIO AND 
              VB.CUIIO_VERS   = R.CUIIO_VERS  
         );