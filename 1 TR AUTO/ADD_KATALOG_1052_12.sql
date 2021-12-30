SELECT FC.CUIIO,
       FC.CUIIO_VERS
                  
              FROM
(
SELECT FC.CUIIO,
       FC.CUIIO_VERS
                  
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (6) AND CUIIO_VERS <= 1052
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (6) AND FC.STATUT <> '3' 
             
             ) FC    LEFT  JOIN USER_BANCU.TUR_1_V2 R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
                                  
                                  
                                  WHERE 
                                  
                                  R.CUIIO IS NOT   NULL
             

