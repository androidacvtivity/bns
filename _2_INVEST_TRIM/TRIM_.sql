SELECT 
      B.*
        
        FROM CIS.MD_CONTROL B  INNER JOIN (
        SELECT 
        A.CONTROL, 
        MAX(A.CONTROL_VERS) CONTROL_VERS
        
        FROM CIS.MD_CONTROL A
        
        
         WHERE
         1=1
         AND A.FORM  = 6
               
         GROUP BY 
          A.CONTROL
         
         ORDER BY 
          A.CONTROL
        
        )  A  ON A.CONTROL = B.CONTROL AND A.CONTROL_VERS = B.CONTROL_VERS   
        
        
         WHERE
         1=1
         AND B.FORM  = 6
         AND B.STATUT <> '3'
               
         
         
         ORDER BY 
          B.CONTROL