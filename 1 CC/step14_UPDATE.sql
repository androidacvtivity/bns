--             INSERT INTO CIS.FORM_CUIIO  
--              
--              (
--              
--                   CUIIO,
--                   CUIIO_VERS,
--                   FORM,
--                   FORM_VERS,
--                   STATUT
--              )



            
            
            SELECT             
         
             
                   A.CUIIO,
                   A.CUIIO_VERS,
                   6 FORM,
                   1004 FORM_VERS,
                   '1' STATUT


                  
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
             
             AND FC.CUIIO_VERS =  1052
             
             
             
             ) FC  RIGHT JOIN USER_BANCU.KAT_2_NVEST_TRIM A ON A.CUIIO = FC .CUIIO AND 
                                                                                                       A.CUIIO_VERS = FC.CUIIO_VERS 
                                                                                                       
                                                                                                       
                                                                                                       WHERE 
                                                                                                      FC.CUIIO IS  NOT    NULL 
            
--           )
--            
--            AND FORM = 6 AND CUIIO_VERS = 1052 AND FORM_VERS = 1004 AND STATUT = '1' 
            
--            AND CUIIO NOT IN (
--                  SELECT 
--        DISTINCT CUIIO
--        
--            FROM DATA_ALL 
--            
--            WHERE 
--            
--            PERIOADA = 2010
--            AND FORM = 12 
--            
--            AND CUIIO NOT IN (
--            SELECT CUIIO
--FROM USER_BANCU.KAT_1_CC
--            )
--            
          --  )