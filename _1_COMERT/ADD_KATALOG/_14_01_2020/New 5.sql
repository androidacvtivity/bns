UPDATE CIS2.RENIM VB
        
 SET     (
       
          VB.CUATM,
        
          VB.CFP,
          VB.CAEM2
                       --6
  
  ) 
            = 
  (          
  SELECT 
  
  
          C.CUATM,
          
          C.CFP,
          C.CAEM2
                   --19
  
  FROM  USER_BANCU.KAT_1_COMERT_v2 C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS 
                
                   
                   
                                 )   
                WHERE EXISTS  
                
                (
                    SELECT C.*
                    FROM   USER_BANCU.KAT_1_COMERT_v2 C
                  
                 WHERE
                   
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS     
                   
                   
                   
                );