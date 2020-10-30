











            SELECT
                CUIIO,
                CUIIO_VERS,
                CFP    
            
             FROM USER_BANCU.VW_MAX_RENIM_CIS2
             
             WHERE 
             
             CUIIO IN (
             
             SELECT 
                    CUIIO
                    
                 
                 FROM USER_BANCU.VW_KATALOG_2_INVEST_ANUL
                 
                 WHERE 
                 
                 CFP IS NULL
                 
                 AND CUIIO_VERS = 2006
             )
             
         --    AND CUIIO_VERS < 2006