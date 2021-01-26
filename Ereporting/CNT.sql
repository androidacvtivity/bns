            SELECT 
            
            D.CUIIO||'-'||ID_MD AS CNT ,
         
            COUNT (D.CUIIO||'-'||ID_MD) AS CNT 
            FROM USER_EREPORTING.DATA_ALL D
            
            WHERE 
            D.PERIOADA = :pPERIOADA 
            AND D.FORM  = :pFORM  




        GROUP BY 
        D.CUIIO||'-'||ID_MD
        
        HAVING 
        COUNT (D.CUIIO||'-'||ID_MD) > 1
        
        