UPDATE CIS2.RENIM VB
        
 SET     (

 
                 VB.DENUMIRE,
                 VB.CUATM,
                 VB.CFP,
                 VB.CFOJ,
               
                 VB.CAEM2,
                 VB.IDNO                       --7
 
  ) 
            = 
  (          
  SELECT 

 
                 C.DENUMIRE,
                 C.CUATM,
                 C.CFP,
                 C.CFOJ,
               
                 C.CAEM2,
                 C.IDNO                          --7
 
  FROM (
           SELECT 
            TRIM(L.CUIIO) CUIIO,
            TRIM(L.CUIIO_VERS) CUIIO_VERS,
            TRIM(L.DENUMIRE) DENUMIRE,
            TRIM(L.CUATM) CUATM,
            TRIM(L.CFP) CFP,
            TRIM(L.CFOJ) CFOJ,
            TRIM(L.CAEM2) CAEM2,
            TRIM(L.IDNO) IDNO
            
                FROM USER_BANCU.KAT_RSF L
  ) C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM USER_BANCU.KAT_RSF C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );