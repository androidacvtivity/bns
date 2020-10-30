SELECT 
           A.CONTROL,
           A.CONTROL_VERS 
     FROM CIS2.MD_CONTROL  A
        INNER JOIN (
 SELECT
    CONTROL,
    MAX(CONTROL_VERS) CONTROL_VERS 
            
        FROM CIS2.MD_CONTROL
        
        WHERE 
        
        FORM  = 8 
        
        
        GROUP BY
        CONTROL
        ) B ON B.CONTROL = A.CONTROL  AND B.CONTROL_VERS = A.CONTROL_VERS
        
        
        WHERE 
        A.STATUT <> '3'
        
        
        ORDER BY 
        A.CONTROL
        
        
        
        
        
        
        