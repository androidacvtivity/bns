﻿UPDATE CIS2.RENIM VB
        
 SET     (

 
                 VB.DENUMIRE,
                 VB.CUATM,
                 VB.CFP,
                 VB.CFOJ,
               
                 VB.CAEM2
                                    --7
 
  ) 
            = 
  (          
  SELECT 

 
                 C.DENUMIRE,
                 C.CUATM,
                 C.CFP,
                 C.CFOJ,
               
                 C.CAEM2
                                       --7
 
  FROM USER_BANCU.KAT_RSF1_F C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM USER_BANCU.KAT_RSF1_F C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );