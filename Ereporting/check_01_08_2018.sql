     
 --Analyze
 --Here are data.

      SELECT *
        
        FROM USER_EREPORTING.DATA_ALL
        
        WHERE
        CUIIO IN  37535463
        
        AND 
        FORM = 16
        AND PERIOADA IN (2006)
        
        ORDER BY 
        ID_MD
        ;
        
        SELECT *
        FROM CIS2.FORM_CUIIO 
        
        WHERE 
         
         CUIIO IN  37535463
         AND FORM = 16
         ;
        
        -------------------------------------------------------------------------
        
        SELECT *
        
        FROM USER_EREPORTING.DATA_ALL_PRIMIT
        
        WHERE
        CUIIO IN 40250907
        
        AND 
        FORM = 16
        AND PERIOADA IN (2006)
        
        ORDER BY 
        ID_MD;
        
 ---------------------------------------------------------------------------       
        SELECT *
        
        FROM CIS2.DATA_ALL
        
        WHERE
        CUIIO IN 40250907
        
        AND 
        FORM = 16
        AND PERIOADA IN (2006)
        
        ORDER BY 
        ID_MD;