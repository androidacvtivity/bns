
            SELECT A.*
            
            FROM CIS2.RENIM A 
            
            
            INNER JOIN USER_BANCU.VW_FORM_85_KAT2016 B ON (B.CUIIO = A.CUIIO AND B.CUIIO_VERS = A.CUIIO_VERS);


--------------------------------------------------------------------------------

        SELECT A.*
        FROM
        (

        SELECT F.*
        
        FROM CIS2.FORM_CUIIO F
        
        WHERE 
        
        F.FORM IN (17)
        AND F.CUIIO_VERS IN (2006)   
        
        --AND F.STATUT = '1'
        
        
        ) A     INNER JOIN USER_BANCU.VW_FORM_85_KAT2016 B ON (B.CUIIO = A.CUIIO AND B.CUIIO_VERS = A.CUIIO_VERS)
        
        ORDER BY 
        A.STATUT DESC