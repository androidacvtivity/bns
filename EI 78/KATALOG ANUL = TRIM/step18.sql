UPDATE CIS2.RENIM VB
        
 SET     (

 
                 VB.DENUMIRE,
                 VB.CUATM,
                 VB.CFP,
               
                 VB.CAEM2                       --7
 
  ) 
            = 
  (          
  SELECT 

 
                 C.DENUMIRE,
                 C.CUATM,
                 C.CFP,
               
                 C.CAEM2                          --7
 
  FROM (
  
  (
SELECT 
L.CUIIO,
2009 CUIIO_VERS,
L.DENUMIRE,
L.CUATM,
L.CFP,
L.CAEM2
FROM USER_BANCU.VW_KATALOG_EI_78_1047 L

)
  
  
  ) C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM (
                    
                    (
SELECT 
L.CUIIO,
2009 CUIIO_VERS,
L.DENUMIRE,
L.CUATM,
L.CFP,
L.CAEM2
FROM USER_BANCU.VW_KATALOG_EI_78_1047 L

)
                    
                    ) C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );