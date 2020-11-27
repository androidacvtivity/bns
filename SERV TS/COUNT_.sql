SELECT 
             FORM,
             CUIIO,
             ID_MD,   
             COUNT(CUIIO||' '||ID_MD) AS CNT
             
             FROM USER_EREPORTING.DATA_ALL
             
             WHERE 
             
             FORM IN (2,3,4,5) AND PERIOADA = 429
             
             
             GROUP BY 
             FORM,
             CUIIO,
             ID_MD 
             
             HAVING 
             COUNT(CUIIO||' '||ID_MD) > 1