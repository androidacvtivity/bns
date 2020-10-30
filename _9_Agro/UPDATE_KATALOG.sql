UPDATE CIS2.RENIM VB
        
 SET     (

 
           VB.DENUMIRE,
           VB.CUATM,
           VB.CFP,
           VB.CFOJ                    --7
 
  ) 
            = 
  (          
  SELECT 

 
                            --7
           C.DENUMIRE,
         
           C.CUATM,
           C.CFP,
           C.CFOJ
 
  FROM RENIM_9_AGRO C
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM RENIM_9_AGRO C
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS
                );