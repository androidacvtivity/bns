SELECT D.*


    FROM --MD_CONTROL_TEST D
    CIS2.MD_CONTROL D
    
    WHERE 
    
    D.FORM = 52
    
    AND D.SQL_TEXT NOT LIKE '%VW_DATA_ALL_TEMP%';