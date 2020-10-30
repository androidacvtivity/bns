   SELECT 
          R.CUIIO,
          R.CUIIO_VERS,
          R.CUATM,
          R.CFP,
          R.CFOJ,
          R.CAEM2

     FROM (SELECT FC.CUIIO,
                  FC.CUIIO_VERS,
                  FC.FORM,
                  FC.FORM_VERS,
                  FC.STATUT
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (37) AND CUIIO_VERS <= 1816
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
            WHERE FC.FORM IN (37) AND FC.STATUT <> '3') FC
          INNER JOIN CIS2.RENIM R
             ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
             
             
             INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
             
             
             WHERE 
             1=1
             AND  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%')  
             
--             AND 
--             
--             R.CUIIO IN (
--             13245550,
--             2749512,
--41265360,
--12942559
--
--             
--        )
--             