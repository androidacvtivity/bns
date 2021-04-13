SELECT *

    FROM CIS2.FORM_CUIIO 
    
    WHERE 
    
    CUIIO IN (
    SELECT 
CUIIO


    FROM USER_BANCU.KAT_RSF
    
   
    
    )
    
    AND CUIIO_VERS = 2009
    AND FORM = 63