

 SELECT *
 FROM USER_BANCU.VW_FROM_CUIIO_EI78_1036;

--CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_FROM_CUIIO_EI78_1036
--(
--   CUIIO,
--   CUIIO_VERS,
--   FORM,
--   FORM_VERS,
--   STATUT
--)
--AS
SELECT 
    R.CUIIO,
    R.CUIIO_VERS,
    44 FORM,
    1004 FORM_VERS,
    '3' STATUT
    
        
    FROM USER_BANCU.VW_RENIM_EI_78_1036 L
    
    
              RIGHT  JOIN (
              SELECT FC.CUIIO,
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
              



              ) R  ON (R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS)
              
              
              WHERE 
              
              L.CUIIO IS  NOT NULL
              
              AND 
              
              L.CUIIO_VERS  IS NOT  NULL
             