--UPDATE CIS2.RENIM VB
        
 SET     (
        --  VB.DENUMIRE,
          VB.CUATM,
          VB.CAEM2,
          VB.CFP,
          VB.CFOJ                 --6
  
  ) 
            = 
  (          
  SELECT 
  
  
          --C.DENUMIRE,
          C.CUATM,
          C.CAEM2,
          C.CFP,
          C.CFOJ 
                   --19
  
  FROM  USER_BANCU.KAT_1_INF_1 C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS 
                
                   
                   
                                 )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM   USER_BANCU.KAT_1_INF_1 C
                  
                 WHERE
                   
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS     
                   
                   
                   
                );