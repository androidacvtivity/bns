           create table  USER_BANCU.KATALOG_update
            
            AS

            SELECT * 
            
            
            FROM USER_BANCU.KATALOG 
            
            WHERE
            
            CUIIO NOT IN (

SELECT
            
            CUIIO
            
              

                
                
                FROM -- USER_BANCU.VW_MAX_RENIM_CIS2
                      USER_BANCU.VW_KATALOG_RSF1_2007
                
                WHERE 
                
                CUIIO IN (
                
                SELECT 
                  
                  CUIIO    
                  FROM    USER_BANCU.KATALOG
                
                ) )