--INSERT INTO CIS2.FORM_CUIIO 
--    
--     (
--     
--       CUIIO,
--       CUIIO_VERS,
--       FORM,
--       FORM_VERS,
--       STATUT
--     )


      SELECT CUIIO,
             CUIIO_VERS,
             36 FORM,
             2000 FORM_VERS,
             '1' STATUT
 

            FROM CIS2.RENIM
            
            WHERE
            
           CUIIO IN  (
--40192469,
40842861,
40903261,
40924441,
40928290,
40982792,
41003660,
41229329,
41343166,
41354023,
41391934,
41393017,
41454782,
411433544

) AND 

CUIIO_VERS = 2010

        
        
        
        
        
        ;
