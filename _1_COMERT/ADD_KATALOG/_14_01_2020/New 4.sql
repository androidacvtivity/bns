UPDATE CIS2.RENIM VB
        
 SET     (
  
  VB.DENUMIRE,                    --3
  VB.CUATM,                       --6
  VB.CFP,                         --7
  VB.CAEM2                       --19
  ) 
            = 
  (          
  SELECT 
  C.DENUMIRE,                    --3
  C.CUATM,                       --6
  C.CFP,                         --7
  C.CAEM2                       --19
  
  FROM USER_BANCU.KAT_1_COMERT_v2 C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM USER_BANCU.KAT_1_COMERT_v2 C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );