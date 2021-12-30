--INSERT INTO CIS2.FORM_CUIIO (
--
--  CUIIO,
--  CUIIO_VERS,
--  FORM,
--  FORM_VERS,
--  STATUT 
--)



SELECT 
  R.CUIIO,
  R.CUIIO_VERS,
  6 FORM,
  1004 FORM_VERS,
  '1' STATUT 

FROM 

(


SELECT FC.CUIIO,
       FC.CUIIO_VERS
                  
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (6) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (6) AND FC.STATUT <> '3' 
             
             
             
             ) FC 
             
             
                                  RIGHT  JOIN USER_BANCU.TUR_1_V2 R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 
                                  
                                  
                                  WHERE 
                                  
                                  FC.CUIIO IS  NOT   NULL