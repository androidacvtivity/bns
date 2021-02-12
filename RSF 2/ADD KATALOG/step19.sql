UPDATE CIS2.RENIM VB
        
 SET     (

 
                 VB.DENUMIRE,
                 VB.CUATM,
                 VB.CFP,
               
               
                 VB.CAEM2,
                 VB.IDNO                       --7
 
  ) 
            = 
  (          
  SELECT 

 
                 C.DENUMIRE,
                 C.CUATM,
                 TRIM(C.CFP) CFP ,
               
               
                 C.CAEM2,
                 C.IDNO                          --7
 
  FROM USER_BANCU.KATALOG_2RSF_2009_v1 C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM USER_BANCU.KATALOG_2RSF_2009_v1 C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );