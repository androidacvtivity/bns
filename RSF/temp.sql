--I need to search in column CLOB if not exist) VW_DATA_ALL_FR_TEMP
--AND   CIS2. VW_DATA_ALL_FR_TEMP )
--AND FORM IN (57,59,63,66)



--It os optimal SQL ? 

SELECT * 
        
        
           FROM  CIS2.MD_CONTROL
           
           WHERE 
           
           (SQL_TEXT  NOT LIKE '%VW_DATA_ALL_FR_TEMP%' 
           AND 
           SQL_TEXT  NOT LIKE '%CIS2.VW_DATA_ALL_FR_TEMP%' 
           )
           
           
                      
           AND FORM IN (57,59,63,66)
        