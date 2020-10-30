    UPDATE CIS2.FORM_CUIIO  VB
        
       SET (
        
         VB.STATUT 
        
        ) 
        
        = 
        
        (
        SELECT
         C.STATUT 
        
        
        FROM USER_BANCU.VW_FROM_CUIIO_EI78_1036 C 
        
        WHERE 
        
                   VB.CUIIO            = C.CUIIO  
                   AND VB.CUIIO_VERS   = C.CUIIO_VERS
                   AND VB.FORM         = C.FORM
                   AND VB.FORM_VERS    = C.FORM_VERS
                   
                   )
                   
                   WHERE EXISTS  
                   
                   (
                   SELECT *
        
        
        
        FROM USER_BANCU.VW_FROM_CUIIO_EI78_1036 C 
        
        WHERE 
        
                   VB.CUIIO            = C.CUIIO  
                   AND VB.CUIIO_VERS   = C.CUIIO_VERS
                   AND VB.FORM         = C.FORM
                   AND VB.FORM_VERS    = C.FORM_VERS
                   
                   );