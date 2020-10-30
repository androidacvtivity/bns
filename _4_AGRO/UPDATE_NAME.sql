UPDATE CIS.RENIM VB
        
 SET     (

  VB.CAEM2                  --3
 
  ) 
            = 
  (          
  SELECT 

  C.CAEM2 
 
  
  FROM USER_BANCU.KATALOG C
  
  
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT C.*
                   FROM USER_BANCU.KATALOG C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );
    