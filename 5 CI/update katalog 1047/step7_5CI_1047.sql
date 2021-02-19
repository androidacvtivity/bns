UPDATE CIS.RENIM VB
        
 SET     (

 
               
               
                 VB.CAEM2
                                       --7
 
  ) 
            = 
  (          
  SELECT 

 
              
               
                 C.CAEM2
              
 
  FROM USER_BANCU.KAT_5_CI_1047 C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM USER_BANCU.KAT_5_CI_1047 C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );