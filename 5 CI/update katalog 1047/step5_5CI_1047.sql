








            SELECT *

            FROM USER_BANCU.VW_MAX_RENIM_TRIM_CIS_48
            
            
            WHERE 
            
            
            CUIIO IN  (
            SELECT 
CUIIO


    FROM USER_BANCU.KAT_5_CI_1047
            
            )
            
            AND CUIIO_VERS  = 1047