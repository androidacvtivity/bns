--               
--               INSERT INTO CIS2.FORM_CUIIO 
--               (
--                    CUIIO,
--                    CUIIO_VERS,
--                    FORM,
--                    FORM_VERS,
--                    STATUT
--               
--               )
               SELECT             
                   R.CUIIO CUIIO,
                   1044  CUIIO_VERS,
                   6 FORM,
                   1004 FORM_VERS,
                   '1' STATUT
                   
                   --R.CUIIO  R_CUIIO
                   FROM
              (
              SELECT             
                   FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (6) AND CUIIO_VERS <= 1044
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (6) AND FC.STATUT <> '3') FC  RIGHT JOIN USER_BANCU.KAT_1_TUR_ver2 R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
             
             
             WHERE 
             FC.CUIIO IS NOT   NULL 
             
             --AND FC.CUIIO_VERS <> 1044
             
             
             
             