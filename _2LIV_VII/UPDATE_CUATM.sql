UPDATE CIS2.RENIM VB
        
 SET     (

  VB.CUATM                  --3
 
  ) 
            = 
  (          
  SELECT 

  C.CUATM 
 
  
  FROM USER_BANCU.RENAME_2INVEST C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                   
                 FROM USER_BANCU.RENAME_2INVEST C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );
    