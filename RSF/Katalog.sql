



        SELECT 
        DISTINCT D.CUIIO,
        R.IDNO,
        R.DENUMIRE
        
            FROM CIS2.VW_DATA_ALL_FR D
            
                    INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
            
            WHERE 
            D.PERIOADA IN (2009)
            AND D.FORM IN (57)