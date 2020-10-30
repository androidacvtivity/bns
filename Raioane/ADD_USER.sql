       
    
--
--        INSERT INTO  M53.SYS_USER_ACCES
--        (
--        
--        ID_USER,               
--        CUATM,                       
--        FORM,                        
--        FORM_VERS,      
--        ISADMIN,        
--        ACCES_TYPE,     
--        DATA_REG 
--        )



        SELECT 
        817 ID_USER,               
        CUATM,                       
        FORM,                        
        FORM_VERS,      
        ISADMIN,        
        ACCES_TYPE,     
        SYSDATE DATA_REG       
          
        FROM M53.SYS_USER_ACCES
        
        
        WHERE 
        
        ID_USER IN (347) 
       
       ;
 ------------------------------------------------------------------------------      
       SELECT 

            ID_USER ID_USER 
    
       
       FROM   CIS.SYS_USER 
      
 ;