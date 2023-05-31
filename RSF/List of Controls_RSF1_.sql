SELECT 
   L.CONTROL,
   L.CONTROL_VERS,
   L.FORM,
   L.FORM_VERS,
   L.CAPITOL,
   L.CAPITOL_VERS,
   L.ID_MD,
   L.FORMULA,
   L.SQL_TEXT,
   L.PRIORITATEA,
   L.DATA_REG,
   L.STATUT    
      
        
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
--         AND A.FORM  = 57
--         AND A.FORM_VERS = 2009
--         AND A.CONTROL_VERS = 2009
               
         GROUP BY 
          A.CONTROL
         
         ORDER BY 
          A.CONTROL
        
        )  A  ON A.CONTROL = B.CONTROL AND A.CONTROL_VERS = B.CONTROL_VERS   
        
        
         WHERE
         1=1
         AND B.FORM   IN (57,59,63,66)
         --58,62,61,68,71,72)
         AND B.STATUT <> '3'
               
         
         
         ORDER BY 
          B.CONTROL ) L
          
          
          
        
          
          WHERE (
  INSTR(L.SQL_TEXT, 'VW_DATA_ALL_FR_TEMP') = 0
  AND INSTR(L.SQL_TEXT, 'CIS2.VW_DATA_ALL_FR_TEMP') = 0
)