UPDATE CIS.RENIM VB
        
 SET     (
 
  VB.CFOJ                        --8
 
  ) 
            = 
  (          
  SELECT 
  C.CFOJ 
 
  
  FROM USER_BANCU.IND_TS C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM USER_BANCU.IND_TS C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );
    