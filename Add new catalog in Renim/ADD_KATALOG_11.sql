--
--INSERT INTO CIS2.FORM_CUIIO (
--                    CUIIO,
--                    CUIIO_VERS,
--                    FORM,
--                    FORM_VERS,
--                    STATUT 
--)


SELECT 
                    L.CUIIO,
                    L.CUIIO_VERS,
                    8 FORM,
                    2000 FORM_VERS,
                    '1'   STATUT 
                
                    FROM USER_BANCU.KATALOG_2_INVEST_ANUL_READY L
                    
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
            
             
    
                                ) R ON R.CUIIO = L.sCUIIO
                                
                                
                                WHERE 
                                R.CUIIO IS  NULL
                                
                      
AND 

L.CUIIO NOT IN (

SELECT
DISTINCT D.CUIIO 

FROM CIS2.VW_DATA_ALL D

WHERE  

    
D.FORM = 8 

AND D.PERIOADA = 2010
 AND D.ID_USER = 9999
)
                                     