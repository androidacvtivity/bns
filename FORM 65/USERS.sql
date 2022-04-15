SELECT

L.ID_USER
FROM
(
SELECT ID_USER
        FROM CIS2.SYS_USER_ACCES
        
        WHERE 
        1=1
        AND FORM = 16          
        AND ACCES_TYPE = 1 ) L LEFT JOIN (
        SELECT 
        ID_USER 
        FROM CIS2.DATA_STATUS
        WHERE 
        FORM = 16 AND PERIOADA = 2010
        ) R ON R.ID_USER = L.ID_USER
         
        WHERE 
        R.ID_USER IS NULL
        