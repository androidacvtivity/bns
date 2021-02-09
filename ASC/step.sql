SELECT FC.CUIIO,
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
                   
                   FROM 

(
SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (20) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (20) AND FC.STATUT <> '3') FC
             
             WHERE 
             
             FC.CUIIO_VERS =  2009
             ) FC LEFT JOIN  (SELECT 
DISTINCT CUIIO,
CUIIO_VERS,
CUATM


FROM USER_EREPORTING.VW_DATA_ALL

WHERE

FORM = 20 
AND PERIOADA = 2009 


ORDER BY 

CUATM) R ON R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS 

WHERE 

R.CUIIO IS NOT NULL