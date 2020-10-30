

    SELECT 
    
            DISTINCT   
            
            B.CUIIO,
            B.CUIIO_VERS,
            
            A.CUIIO  A_CUIIO
            
    
    
    FROM

    (       
       
       SELECT    
          R.CUIIO,
          R.CUIIO_VERS
        
         
     FROM (SELECT FC.CUIIO,
                  FC.CUIIO_VERS,
                  FC.FORM,
                  FC.FORM_VERS,
                  FC.STATUT
             FROM CIS.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS.FORM_CUIIO
                                 WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
            WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
          INNER JOIN CIS.RENIM R
             ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)


                ) A    RIGHT JOIN (
                
                
        SELECT 
            A.CUIIO,
            A.CUIIO_VERS,
            A.PERIOADA
        
        FROM USER_EREPORTING.DATA_ALL A
        
        WHERE 
        
        A.PERIOADA IN (:pPERIOADA)
        AND A.FORM IN (:pFORM)
        
        
                
                ) B  ON B.CUIIO = A.CUIIO AND B.CUIIO_VERS = A.CUIIO_VERS   
             
          
             
             
             
             WHERE
             
             1 = 1
             
           --  AND B.CUIIO_VERS <> A.CUIIO_VERS
              
              
             AND A.CUIIO IS NULL
             
             
             