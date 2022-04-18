--            INSERT INTO CIS2.FORM_CUIIO
--            
--             (
--            
--                   CUIIO,
--                   CUIIO_VERS,
--                   FORM,
--                   FORM_VERS,
--                   STATUT 
--            
--            )
--


                    SELECT 
--                    
--                    L.CUIIO L_CUIIO,
--                    L.CUIIO_VERS  L_CUIIO_VERS,
                    
                    L.CUIIO,
                    L.CUIIO_VERS,
                    43 FORM,
                    2000 FORM_VERS,
                    '1' STATUT 
                
                    FROM AGRO_4 L
                    
                                LEFT   JOIN (
                                
                                SELECT 
                  FC.CUIIO,
                  FC.CUIIO_VERS,
                  FC.FORM,
                  FC.FORM_VERS,
                  FC.STATUT

        FROM

        (

   
                SELECT 
                  FC.CUIIO,
                  FC.CUIIO_VERS,
                  FC.FORM,
                  FC.FORM_VERS,
                  FC.STATUT
                  
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
            WHERE 
            FC.FORM IN (:pFORM) 
            
            AND FC.STATUT <> '3'
            
            
            
            )
            
            FC
          
        
            WHERE 
            
            1=1  
            
             
           -- AND FC.CUIIO_VERS   IN (1040) 
                                ) R ON R.CUIIO = L.CUIIO
                                
                                
                                WHERE 
                                R.CUIIO IS  NOT  NULL
                                
                       --         AND   R.CUIIO_VERS  <> 1040    
                                     