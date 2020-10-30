


        SELECT 
        
          L.CUIIO,
          R.CUIIO

          FROM
          ( 
          
          
          SELECT  
                  FC.CUIIO,
                  FC.CUIIO_VERS,
                  FC.FORM,
                  FC.FORM_VERS,
                  FC.STATUT
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (44) AND CUIIO_VERS <= 1038
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS) 
            WHERE FC.FORM IN (44) AND FC.STATUT <> '3'  
            
            
            ) L
            
            
            
                    LEFT JOIN  (
                    
                    SELECT  
                  FC.CUIIO,
                  FC.CUIIO_VERS,
                  FC.FORM,
                  FC.FORM_VERS,
                  FC.STATUT
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (44) AND CUIIO_VERS <= 1036
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS) 
            WHERE FC.FORM IN (44) AND FC.STATUT <> '3' 
                    ) R ON R.CUIIO = L.CUIIO
                    
                    
                    WHERE 
                    1=1 
                    AND R.CUIIO IS  NULL
            
            