



           SELECT 
            name 
            
            FROM
            
           ( 
            SELECT LOWER(name) AS name

            FROM ALL_APP.STAFFBNS
            
            )
            
            
            
                WHERE 
                
                NAME LIKE '%'||:pNAME||'%'
                
                
                UNION 
                
                SELECT 
            name 
            
            FROM
            
           ( 
            SELECT name  AS name

            FROM ALL_APP.STAFFBNS
            
            )
            
            
            
                WHERE 
                
                NAME LIKE '%'||:pNAME||'%'
             