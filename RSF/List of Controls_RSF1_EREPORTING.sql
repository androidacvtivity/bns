--INSERT INTO CIS2.MD_CONTROL (
--
--   CONTROL,
--   CONTROL_VERS,
--   FORM,
--   FORM_VERS,
--   CAPITOL,
--   CAPITOL_VERS,
--   ID_MD,
--   FORMULA,
--   SQL_TEXT,
--   PRIORITATEA,
--   DATA_REG,
--   STATUT 
--
--)

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
      
      
        
        FROM USER_EREPORTING.MD_CONTROL B  INNER JOIN (
        SELECT 
        A.CONTROL, 
        MAX(A.CONTROL_VERS) CONTROL_VERS
        
        FROM USER_EREPORTING.MD_CONTROL A
        
        
         WHERE
         1=1
         AND A.FORM  = 57
         AND A.FORM_VERS = 2009
--         AND A.CONTROL_VERS = 2009
               
         GROUP BY 
          A.CONTROL
         
         ORDER BY 
          A.CONTROL
        
        )  A  ON A.CONTROL = B.CONTROL AND A.CONTROL_VERS = B.CONTROL_VERS   
        
        
         WHERE
         1=1
         AND B.FORM  = 57
         AND B.STATUT <> '3'
               
         
         
         ORDER BY 
          B.CONTROL ) L