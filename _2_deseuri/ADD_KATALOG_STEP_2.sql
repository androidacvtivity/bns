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

          SELECT 
             CUIIO,
             CUIIO_VERS,
             32 FORM,
             2000 FORM_VERS,
             '1' STATUT
 

        

FROM 

(
SELECT *


            from RENIM
            
            
            WHERE 
            
            CUIIO IN (
              SELECT 
        
                CUIIO
        
        
                FROM USER_BANCU.KATALOG_V1
            
            )
            AND CUIIO_VERS = 2007
            )     
 

            
            
                WHERE 
                
                CUIIO NOT IN (
                
                SELECT CUIIO 

    

        FROM FORM_CUIIO
        
        WHERE


            CUIIO IN (
              SELECT 
        
                CUIIO
        
        
                FROM USER_BANCU.KATALOG_V1
            
            )
            
            
            AND CUIIO_VERS = 2007
            
            
            AND FORM IN (32)
                
                )
