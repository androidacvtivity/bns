


            SELECT 
                  FC.CUIIO,
                  FC.CUIIO_VERS,
                  FC.FORM,
                  FC.FORM_VERS,
                  FC.STATUT
                  
                  FROM
            (

           SELECT FC.CUIIO,
                  FC.CUIIO_VERS,
                  FC.FORM,
                  FC.FORM_VERS,
                  FC.STATUT
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (2) AND CUIIO_VERS <= 2007
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
            WHERE 
            FC.FORM IN (2) AND FC.STATUT <> '3'
            ) FC
            
            
            WHERE
            
            FC.CUIIO IN (
            SELECT 
                
                CUIO AS CUIIO 
                
                 FROM USER_BANCU.IT_PARK_CHISNAU_2018
            
            )