SELECT
  620 ID_USER,        
  '0000000'CUATM,          
  FORM,           
  FORM_VERS,      
  '0' ISADMIN,        
  '1' ACCES_TYPE,     
  NULL CAPITOL_ACCES,  
  SYSDATE DATA_REG 
  
     FROM CIS2.MD_FORM 
     --CIS2.SYS_USER_ACCES
  
  
        WHERE
        1=1
        
       -- ID_USER IN (376)