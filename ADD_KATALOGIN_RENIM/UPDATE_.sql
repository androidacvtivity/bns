UPDATE CIS2.RENIM VB
        
 SET     (

 
--                 VB.DENUMIRE,
--                 VB.CUATM,
--                 VB.CFP
--                 
                 ---------------------------------
                  --VB.DENUMIRE,
                    VB.CFP
                   -- VB.CFP
--                  VB.CFOJ,
--                  VB.CAEM2,
--                  VB.IDNO                   
                                       --7
 
  ) 
            = 
  (          
  SELECT 

 
               --   C.DENUMIRE,
                   C.CFP
                  --C.CFP
--                  C.CFOJ,
--                  C.CAEM2,
--                  C.IDNO                   
                                         --7
 
  FROM USER_BANCU."UPDATE" C
       WHERE
       C.CFP IS NOT NULL 
       
       AND 
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    
                    SELECT *
                    FROM USER_BANCU."UPDATE" C
                    WHERE
                   
                     C.CFP IS NOT NULL
                   
                   
                   AND VB.CUIIO   = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );