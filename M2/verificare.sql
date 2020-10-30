




        SELECT 
        
        DISTINCT CUIIO,
        DATA_REG
        
        
        
        FROM USER_EREPORTING.DATA_ALL
        
        WHERE 
        
        FORM IN (7)  AND PERIOADA = 416
        AND ID_SCHEMA = 1
        
        AND CUIIO IN (
        SELECT FC.CUIIO
                   
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (7) AND CUIIO_VERS <= 416
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (7) AND FC.STATUT <> '3'
        )
        
        
        ORDER BY 
        DATA_REG DESC