UPDATE CIS2.RENIM VB
        
 SET     (

 
                 VB.DENUMIRE,
                 VB.CUATM,
                 VB.CFP
                                       --7
 
  ) 
            = 
  (          
  SELECT 

 
                 C.DENUMIRE,
                 C.CUATM,
                 C.CFP
                                        --7
 
  FROM USER_BANCU.KAT_4_RSF1 C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM USER_BANCU.KAT_4_RSF1 C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );