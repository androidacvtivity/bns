

UPDATE CIS.FORM_CUIIO

SET STATUT = '3'


--SELECT *
--
--
--FROM CIS.FORM_CUIIO 

WHERE 

CUIIO IN (

SELECT FC.CUIIO
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
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3'
             ) FC 
             
             WHERE 
             FC.CUIIO_VERS = 1048
             
             ) FC  LEFT JOIN USER_BANCU.KAT_2_INVEST_TRIM_F R ON R.CUIIO = FC.CUIIO  AND R.CUIIO_VERS = FC.CUIIO_VERS
             
             WHERE 
             
             R.CUIIO IS NULL 
             
             )
             
             AND FORM = 6 
             AND CUIIO_VERS = 1048
             AND STATUT = '1'
             AND FORM_VERS = 1004