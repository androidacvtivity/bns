









---------------------------------------------------------------------------




SELECT  
  ID_USER,
  CUATM,
  FORM,
  FORM_VERS,
  ISADMIN,
  ACCES_TYPE,
  CAPITOL_ACCES,
  DATA_REG      
   
   FROM  CIS2.SYS_USER_ACCES



    WHERE  
    
    FORM  IN (

    SELECT 
    FORM 
    FROM CIS2.MD_FORM
    
    WHERE 
    FORM NOT IN (100,101)

 )