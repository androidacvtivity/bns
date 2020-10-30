





  SELECT 
    L.CUIIO L_CUIIO ,
    L.CUIIO_VERS  L_CUIIO_VERS,
    R.CUIIO R_CUIIO ,
    R.CUIIO_VERS  R_CUIIO_VERS
    
    FROM
    

  (
      SELECT 
         
         DISTINCT D.CUIIO,
          D.CUIIO_VERS
          
          FROM CIS2.VW_DATA_ALL D
          
          WHERE 
          D.PERIOADA IN (:pPERIOADA)
          AND D.FORM IN (44)
          ) L LEFT JOIN (
          
           SELECT 
           
                  DISTINCT FC.CUIIO,
                  FC.CUIIO_VERS,
                  FC.FORM,
                  FC.FORM_VERS,
                  FC.STATUT
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (44) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
            WHERE 
                      FC.FORM IN (44)
                AND FC.STATUT <> '3'
          
          
          ) R ON R.CUIIO = L.CUIIO  AND R.CUIIO_VERS = L.CUIIO_VERS
          
          
          WHERE 
          1=1            
          AND R.CUIIO IS  NULL
          
         -- AND L.CUIIO_VERS IN (1033)