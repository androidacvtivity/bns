--
--
--
--    INSERT INTO    CIS.SYS_USER_ACCES
--    (
--  ID_USER,        
--  CUATM,          
--  FORM,           
--  FORM_VERS,      
--  ISADMIN,        
--  ACCES_TYPE,     
--  CAPITOL_ACCES,  
--  DATA_REG       
--  )
--  




SELECT
  1003 ID_USER,        
  L.CUATM,          
  L.FORM,           
  L.FORM_VERS,      
  L.ISADMIN,        
  L.ACCES_TYPE,     
  L.CAPITOL_ACCES,  
  SYSDATE DATA_REG 

FROM

( 
  SELECT
  1003 ID_USER,        
  '0000000'CUATM,          
  FORM,           
  FORM_VERS,      
  '0' ISADMIN,        
  '1' ACCES_TYPE,     
  NULL CAPITOL_ACCES,  
  SYSDATE DATA_REG 
  
     FROM CIS.MD_FORM 
     --CIS2.SYS_USER_ACCES
  
  
        WHERE
        1=1
        
        
        
        
        
        ) L  LEFT JOIN  (
        
        SELECT
  ID_USER,        
  CUATM,          
  FORM,           
  FORM_VERS,      
  ISADMIN,        
  ACCES_TYPE,     
  CAPITOL_ACCES,  
  DATA_REG 
  
     FROM CIS.SYS_USER_ACCES
  
  
        WHERE
        
        ID_USER IN (1003)
        
        ) R ON R.FORM = L.FORM


        WHERE
        
        R.FORM IS NULL
        

GROUP BY 
  L.CUATM,          
  L.FORM,           
  L.FORM_VERS,      
  L.ISADMIN,        
  L.ACCES_TYPE,     
  L.CAPITOL_ACCES,
  ROWNUM 

      HAVING 
     1=1 
      AND ROWNUM <=15  



  
 
        
  