
SELECT 
FC.CUIIO
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
             
             
             ) FC LEFT JOIN (
             
             
SELECT 

DISTINCT D.CUIIO

FROM 

   
   (
   SELECT 
      D.CUIIO,
      D.CUIIO_VERS,
      D.RIND,
      D.COL1
    FROM VW_DATA_ALL_CALC D
    WHERE D.PERIOADA = :pPERIOADA     
      AND D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'
      AND D.FORM       IN(10)
      AND D.CAPITOL    IN(46)
      
      GROUP BY 
          D.CUIIO,
      D.CUIIO_VERS,
      D.RIND,
      D.COL1
      ) D

      
             ) R ON R.CUIIO = FC.CUIIO
             
             WHERE 
             
             R.CUIIO IS NULL  