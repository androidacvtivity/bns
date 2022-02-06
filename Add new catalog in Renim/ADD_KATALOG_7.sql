
SELECT 
                  FC.CUIIO,
                  FC.CUIIO_VERS,
                  FC.FORM,
                  FC.FORM_VERS,
                  FC.STATUT
                  
             FROM (
SELECT 
                  FC.CUIIO,
                  FC.CUIIO_VERS,
                  FC.FORM,
                  FC.FORM_VERS,
                  FC.STATUT
                  
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, 
                                      MAX (CUIIO_VERS) CUIIO_VERS,
                                      MAX (FORM_VERS)  form_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                                 AND FORM_VERS in (:pFORM_VERS)
                              GROUP BY CUIIO
                              
                              ) BB
                     ON (BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS and  BB.FORM_VERS = FC.form_VERS )
            WHERE 
            FC.FORM IN (:pFORM) 
            AND FC.FORM_VERS in (:pFORM_VERS)
            
            AND FC.STATUT <> '3' ) FC 
            
            WHERE
            1=1 
            