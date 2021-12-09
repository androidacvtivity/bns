UPDATE CIS2.RENIM VB
        
 SET     (

  VB.IDNO                    --3
 
  ) 
            = 
  (          
  SELECT 
  C.IDNO                       --1       

  
  FROM USER_BANCU.KAT_9_AGRO C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT C.*
                    FROM USER_BANCU.KAT_9_AGRO C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );
    