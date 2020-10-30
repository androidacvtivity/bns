


    



        SELECT 
        CUIIO,
        CUIIO_VERS,
        DENUMIRE
        
        
        FROM USER_BANCU.VW_MAX_RENIM_CIS2
        
        WHERE 
        
        DENUMIRE LIKE '%FARMSINTEZ%'
        
        
        UNION 
        
        
        
        
        SELECT 
        CUIIO,
        CUIIO_VERS,
        DENUMIRE
        
        
        FROM USER_BANCU.VW_MAX_RENIM_CIS
        
        WHERE 
        
        DENUMIRE LIKE '%FARMSINTEZ%'