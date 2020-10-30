SELECT * 
                
                     FROM  CIS2.MD_RIND
                     
                     WHERE
                     1=1
                     
                     AND ID_MD IN (
                     
         SELECT 
            
            D.ID_MD
          
            
            FROM CIS2.MD_RIND D
            
            WHERE
            
            D.CAPITOL IN (1049)  
            AND D.FORM IN (49)
            
            AND LENGTH(TRIM(D.RIND))  >= 9 
            
            
              AND
  
            TO_NUMBER(SUBSTR(D.RIND,1,1)) <> 3  
            
            
                     );