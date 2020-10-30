
INSERT INTO M53.SYS_USER_ACCES    

(

        ID_USER,
        CUATM,
        FORM,
        FORM_VERS,
        ISADMIN,
        ACCES_TYPE,
        DATA_REG,
        CAPITOL_ACCES  
)


    
    SELECT 
    
        815 ID_USER,
        CUATM,
        FORM,
        FORM_VERS,
        ISADMIN,
        ACCES_TYPE,
        DATA_REG,
        CAPITOL_ACCES  
    
    FROM M53.SYS_USER_ACCES
    
    
    WHERE
    
    ID_USER IN (361)