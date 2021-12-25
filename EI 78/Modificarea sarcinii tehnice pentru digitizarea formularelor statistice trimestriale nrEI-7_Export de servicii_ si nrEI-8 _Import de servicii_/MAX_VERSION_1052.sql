SELECT 
   L.CONTROL
      
        
        FROM

( 
SELECT 
   B.CONTROL,
   B.CONTROL_VERS,
   B.FORM,
   B.FORM_VERS,
   B.CAPITOL,
   B.CAPITOL_VERS,
   B.ID_MD,
   B.FORMULA,
   B.SQL_TEXT,
   B.PRIORITATEA,
   B.DATA_REG,
   B.STATUT    
      
      
        
        FROM CIS2.MD_CONTROL B  INNER JOIN (
        
        
        SELECT 
        A.CONTROL, 
        MAX(A.CONTROL_VERS) CONTROL_VERS
        
        FROM CIS2.MD_CONTROL A
        
        
         WHERE
         1=1
         AND A.FORM  = 44
               
         GROUP BY 
          A.CONTROL
         
         ORDER BY 
          A.CONTROL
          
          
          
        
        )  A  ON A.CONTROL = B.CONTROL AND A.CONTROL_VERS = B.CONTROL_VERS   
        
        
         WHERE
         1=1
         AND B.FORM  = 44
         AND B.STATUT <> '3'
               
         
         
         ORDER BY 
          B.CONTROL ) L
          
          
          