

--         INSERT INTO  CIS.SYS_USER_ACCES           
--            ( 
--            ID_USER,
--            CUATM,
--            FORM,
--            FORM_VERS,
--            ISADMIN,
--            ACCES_TYPE,
--            CAPITOL_ACCES,
--            DATA_REG
--
--            ) 



            SELECT 
            
            1158 ID_USER,
            CUATM,
            FORM,
            FORM_VERS,
            ISADMIN,
            ACCES_TYPE,
            CAPITOL_ACCES,
            SYSDATE DATA_REG
           
            
            FROM CIS.SYS_USER_ACCES
            
            
            WHERE
            
             ID_USER IN (1120)