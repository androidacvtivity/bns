-- INSERT INTO FORM_CUIIO
    
      (
                        CUIIO,
                        CUIIO_VERS,
                        FORM, 
                        FORM_VERS,
                        STATUT 
      )



             SELECT 
                
                
                        CUIIO,
                        CUIIO_VERS,
                        45 FORM, 
                        1004 FORM_VERS,
                        '1' STATUT 
                        
                        
                        FROM RENIM
                        
                        WHERE 
                        
                        CUIIO IN (
40926291,
41260747,
41292055,
41236009,
23144521,
41268602,
41269406,
41261333

)

AND 1=1  AND CUIIO_VERS IN (1041)