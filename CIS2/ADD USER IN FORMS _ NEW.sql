   INSERT INTO COMERT.SYS_USER_ACCES
  (  

  ID_USER,
  ID_FORM,
  COD_CUATM,
  ID_ACCES_TYPE,
  DATA_REG,
  STATUS  
  )

  SELECT 
    
  315 ID_USER,
  ID_FORM,
  COD_CUATM,
  ID_ACCES_TYPE,
  DATA_REG,
  STATUS     
    
    FROM COMERT.SYS_USER_ACCES
    
    WHERE 
    
    ID_USER IN (180);
    
--------------------------------------------------------------------------------    

---------------------------------------------------------------------------------
 INSERT INTO M53.SYS_USER_ACCES A
        
        (
        
        A.ID_USER,
        A.CUATM,
        A.FORM,
        A.FORM_VERS,
        A.ISADMIN,
        A.ACCES_TYPE,
        A.DATA_REG,
        A.CAPITOL_ACCES 
        
        )



        SELECT 
        813 ID_USER,
        A.CUATM,
        A.FORM,
        A.FORM_VERS,
        A.ISADMIN,
        A.ACCES_TYPE,
        A.DATA_REG,
        A.CAPITOL_ACCES 

        FROM M53.SYS_USER_ACCES A
        
        
        WHERE 
        
        ID_USER IN (589)
        ; 



-----------------------------------------------------------------------------------
--          INSERT INTO M53.SYS_USER_ACCES A
--           (        
--            ID_USER,
--            CUATM,
--            FORM,
--            FORM_VERS,
--            ISADMIN,
--            ACCES_TYPE,
--            DATA_REG,
--            CAPITOL_ACCES
--            ) 



          SELECT  
            A.ID_USER,
            A.CUATM,
            A.FORM,
            A.FORM_VERS,
            A.ISADMIN,
            A.ACCES_TYPE,
            A.DATA_REG,
            A.CAPITOL_ACCES

             
        FROM M53.SYS_USER_ACCES A
        
        WHERE 
        A.ID_USER IN (589)
        
        ----------------------------------------------------------------
        ; 
        
-------------------------------------------------------------------------------        
        -----------------------------------------------------------------------
        
        -----------------------------------------------------------------------
        INSERT INTO CIS.SYS_USER_ACCES 
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
            
            1134 ID_USER,
            A.CUATM,
            A.FORM,
            A.FORM_VERS,
            A.ISADMIN,
            A.ACCES_TYPE,
            A.CAPITOL_ACCES,
            SYSDATE  DATA_REG
             
        FROM CIS.SYS_USER_ACCES A 
        
        WHERE
        
       
        A.ID_USER IN  (611)
        
        --AND A.ID_USER NOT IN  (1248)
        
        
       --AND  ROWNUM < 8
        
        ;
        




---------------------------------------------------------------------------------
        DESCRIBE CIS2.SYS_USER_ACCES;


---------------------------------------------------------------------------------
        SELECT SYSDATE
        
        FROM DUAL;