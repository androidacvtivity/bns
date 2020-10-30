--       INSERT INTO CIS2.FORM_CUIIO
--        
--        (
--         CUIIO,
--         CUIIO_VERS,
--         FORM,
--         FORM_VERS,
--         STATUT        
--        
--        )
----   

        SELECT 
             CUIIO,
             CUIIO_VERS,
             60 FORM,
             2000 FORM_VERS,
             '1'  STATUT
             
              FROM  RENIM

    WHERE 

CUIIO IN (
38779084,
2684436,
26844361,
26844362

)
        
     AND CUIIO_VERS IN (2007)