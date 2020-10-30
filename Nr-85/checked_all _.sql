






          SELECT 
                 B.*
                 
            FROM
          (

            SELECT  R.*
            
            FROM USER_BANCU.VW_FORM_85_KAT2016 A
            
                LEFT JOIN CIS2.RENIM R ON (R.CUIIO = A.CUIIO  AND R.CUIIO_VERS = A.CUIIO_VERS) 
            
            WHERE 
            
            R.CUIIO IS NOT NULL
            
            
            ) A 
            
            
            RIGHT  JOIN (
            
            SELECT 
            A.*
            
            FROM CIS2.FORM_CUIIO A
            
            WHERE 
            
            A.FORM IN (17) 
            AND A.CUIIO_VERS IN (2006)
            
            
            
            
            
            
            ) B ON (B.CUIIO = A.CUIIO AND B.CUIIO_VERS = A.CUIIO_VERS)
            
            WHERE
            
            A.CUIIO IS NULL