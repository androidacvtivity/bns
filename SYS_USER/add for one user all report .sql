INSERT INTO    CIS2.SYS_USER_ACCES
    (
  ID_USER,        
  CUATM,          
  FORM,           
  FORM_VERS,      
  ISADMIN,        
  ACCES_TYPE,     
  CAPITOL_ACCES,  
  DATA_REG       
  )
  




SELECT
  251 ID_USER,        
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
  ID_USER,        
  CUATM,          
  FORM,           
  FORM_VERS,      
  ISADMIN,        
  ACCES_TYPE,     
  CAPITOL_ACCES,  
  DATA_REG 
  
     FROM CIS2.SYS_USER_ACCES
  
  
        WHERE
        
        ID_USER IN (463)
        
        ORDER BY FORM
        
        
        
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
  
     FROM CIS2.SYS_USER_ACCES
  
  
        WHERE
        
        ID_USER IN (251)
        
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
      
      ROWNUM <=15  
      
      ORDER BY 
        L.FORM


  
 
        
  