  SELECT 
       
          DISTINCT D.CUIIO,
                   R.DENUMIRE,
                   R.CUATM
          
                               
       
            FROM  USER_EREPORTING.VW_DATA_ALL_PRIMIT D
            
            --
                                           INNER JOIN CIS.RENIM R ON R.CUIIO = D.CUIIO  AND  R.CUIIO_VERS  = D.CUIIO_VERS
            
            
            WHERE
            
            D.PERIOADA = :pPERIOADA  
            
            AND D.FORM  = :pFORM 
            
            AND D.ID_SCHEMA = :pID_SCHEMA  
            
            AND D.CUATM LIKE '17%'  