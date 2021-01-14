--We are updating the supplies.

--UPDATE CIS2.FORM_CUIIO VB
        
 SET     (

 
               
               
                 VB.STATUT                       --7
 
  ) 
            = 
  (          
  SELECT 

 
                
               
                 C.STATUT                          --7
 
  FROM FORM_CUIIO_1_INF C
  
       WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS AND 
                   VB.FORM  = C.FORM AND
                   VB.FORM_VERS   = C.FORM_VERS  
                   
                )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM FORM_CUIIO_1_INF C
                    
                    
                   WHERE
                   VB.CUIIO       = C.CUIIO AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS AND 
                   VB.FORM  = C.FORM AND
                   VB.FORM_VERS   = C.FORM_VERS  
                );