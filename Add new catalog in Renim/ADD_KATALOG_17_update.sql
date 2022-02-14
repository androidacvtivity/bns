UPDATE CIS.RENIM VB
        
 SET     (

 

                  --VB.DENUMIRE,
                 -- VB.CUATM
                  VB.CFP
                 -- VB.CFOJ,
                  --VB.CAEM2,
                  --VB.IDNO                   
                                       --7
 
  ) 
            = 
  (          
  SELECT 

 
                  --C.DENUMIRE,
                  --C.CUATM
                  C.CFP
                 -- C.CFOJ,
                  --C.CAEM2,
                  --C.IDNO                   
                                         --7
 
  FROM USER_BANCU.PRODMOLD_2010 C
       WHERE
                   C.CUATM IS NOT NULL
                   AND  VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT C.*
                    FROM USER_BANCU.PRODMOLD_2010 C
                   WHERE
                   

                   C.CFP IS NOT NULL

                   AND VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );