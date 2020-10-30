--
--CREATE TABLE BACKUP_FORM_CUIIO_CIS2
--
--AS 
--SELECT *
--
--FROM CIS2.FORM_CUIIO;
--
--
--;


UPDATE CIS2.FORM_CUIIO VB
        
 SET     (
          
          VB.STATUT                 --6
  
  ) 
            = 
  (          
  SELECT 
  
  
          C.STATUT 
                   --19
  
  FROM  USER_BANCU.FORM_CUIIO_1_INF C
       
       
       WHERE
                   VB.CUIIO       = C.CUIIO         AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS    AND 
                   VB.FORM        = C.FORM          AND 
                   VB.FORM_VERS   = C.FORM_VERS     
                   
                   
                                 )   
                WHERE EXISTS  
                
                (
                    SELECT *
                    FROM   USER_BANCU.FORM_CUIIO_1_INF C
                  
                 WHERE
                   
                   VB.CUIIO       = C.CUIIO         AND 
                   VB.CUIIO_VERS  = C.CUIIO_VERS    AND 
                   VB.FORM        = C.FORM          AND 
                   VB.FORM_VERS   = C.FORM_VERS        
                   
                   
                   
                );