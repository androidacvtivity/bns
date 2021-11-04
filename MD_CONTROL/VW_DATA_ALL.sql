



SELECT D.*


    FROM CIS2.MD_CONTROL D
    
    WHERE 
    
    D.FORM = 69
    
    AND D.SQL_TEXT LIKE '%VW_DATA_ALL_TEMP%'