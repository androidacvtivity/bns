

--            INSERT INTO  CIS2.FORM_CUIIO 
--                        --FORM_CUIIO_TEST_1040
--            (
--            
--                    CUIIO,
--                    CUIIO_VERS,
--                    FORM,
--                    FORM_VERS,
--                    STATUT 
--            
--            
--            )

SELECT  
                  R.CUIIO,
                  R.CUIIO_VERS,
                  46 FORM,
                  2000 FORM_VERS,
                  '1'  STATUT
                  
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
            
            )  FC   RIGHT  JOIN USER_BANCU.EI_78_2008 R ON FC.CUIIO = R.CUIIO 
            
            
            
                        WHERE
                        1=1 
                        AND  FC.CUIIO IS NOT   NULL  
                        
                        AND R.CUIIO_VERS IN (2008)
                        
                        
                        
                        ; 
            
            
--                        AND 
--                        
--                        FC.CUIIO_VERS IN (2008);
                        
                        
                        
                        
   -----------------------------------------------                     
                         CREATE TABLE FORM_CUIIO_TEST_2008_TEST_2008

            AS 
            SELECT *
            
                FROM CIS2.FORM_CUIIO_TEST_2008
                WHERE
                 1=1;
                
                 
            
           SELECT *     
            FROM FORM_CUIIO_TEST_2008_TEST_1040;
            
            
          DELETE
         
            FROM FORM_CUIIO_TEST_2008_TEST;
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                             
                        
                        