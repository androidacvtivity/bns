


            SELECT *
             FROM FORM_CUIIO_TEST;





--
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



                    SELECT 
--                    
--                    L.CUIIO L_CUIIO,
--                    L.CUIIO_VERS  L_CUIIO_VERS,
                    
                    R.CUIIO,
                    R.CUIIO_VERS,
                    44 FORM,
                    1004 FORM_VERS,
                    R.STATUT 
                
                    FROM USER_BANCU.EI_78_1040 L
                    
                                RIGHT  JOIN (
                                
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
                                L.CUIIO IS  NULL
                                
                       --         AND   R.CUIIO_VERS  <> 1040    
                                     