--SELECT *
--
--       FROM CIS2.FORM_CUIIO 
       
       UPDATE  CIS2.FORM_CUIIO
       
         SET STATUT = '3'
--        
            WHERE 
            FORM = 44
            AND FORM_VERS = 1004
            AND CUIIO_VERS = 1052
            AND STATUT = '1'
            AND 
            CUIIO IN (
            SELECT 
                    R.CUIIO
                    
-- R_CUIIO,
--                    L.CUIIO L_CUIIO
                
                    FROM USER_BANCU.KAT_EI_78_1052_V1 L
                    
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
            
             
    
                                ) R ON R.CUIIO = L.CUIIO
                                
                                
                                WHERE 
                                L.CUIIO IS  NULL
                                
                      
--AND 
--
--R.CUIIO  IN (
--
--SELECT
--DISTINCT D.CUIIO 
--
--FROM CIS2.VW_DATA_ALL D
--
--WHERE  
--
--    
--D.FORM = 8 
--
--AND D.PERIOADA = 2010
-- AND D.ID_USER = 9999
--)
--                                     
            )