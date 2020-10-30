

INSERT INTO CIS2.SYS_USER_ACCES
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
 1258 ID_USER,
 '0100000'CUATM, 
 MF.FORM,
 MF.FORM_VERS,
 '0' ISADMIN,
 '1'ACCES_TYPE,
  NULL CAPITOL_ACCES,
  SYSDATE DATA_REG   

 FROM

(
SELECT 

  1258 ID_USER,
  L.CUATM,
  L.FORM,
  L.FORM_VERS,
  '0' ISADMIN,
  L.ACCES_TYPE,
  L.CAPITOL_ACCES,
  SYSDATE DATA_REG  
      
FROM CIS2.SYS_USER_ACCES L

WHERE 
ID_USER IN (1258)) L  RIGHT JOIN CIS2.MD_FORM MF ON (MF.FORM = L.FORM AND MF.FORM_VERS = L.FORM_VERS)   


    WHERE 
    
    L.FORM IS NULL
    
    
    GROUP BY 
    
    ROWNUM,
   MF.FORM,
   MF.FORM_VERS
    
    HAVING 
    
    ROWNUM < 10 

;



-------------------------------------------------------------------------------------
 INSERT INTO CIS.SYS_USER_ACCES
 (
  ID_USER,--        NUMBER                         NOT NULL,
  CUATM,--          VARCHAR2(7 BYTE)               NOT NULL,
  FORM,--           NUMBER                         NOT NULL,
  FORM_VERS,--      NUMBER,
  ISADMIN,--        VARCHAR2(1 BYTE),
  ACCES_TYPE,--     NUMBER,
  CAPITOL_ACCES,--  VARCHAR2(100 BYTE),
  DATA_REG,--       DATE,
  DATA_LEVEL --    NUMBER
 )



   SELECT 
   
  1147 ID_USER,--        NUMBER                         NOT NULL,
  CUATM,--          VARCHAR2(7 BYTE)               NOT NULL,
  FORM,--           NUMBER                         NOT NULL,
  FORM_VERS,--      NUMBER,
  ISADMIN,--        VARCHAR2(1 BYTE),
  ACCES_TYPE,--     NUMBER,
  CAPITOL_ACCES,--  VARCHAR2(100 BYTE),
  SYSDATE  DATA_REG,--       DATE,
  DATA_LEVEL --    NUMBER
   
     FROM CIS.SYS_USER_ACCES
     
     WHERE 
     
     ID_USER IN (202)
     
     ;



--------------------------------------------------------------------------------

  SELECT SYSDATE 
  
    FROM DUAL;













---------------------------------------------------------------------------------
       SELECT 
        CUIIO,
        --DENUMIREA,
        COUNT (CUIIO) CNT 
       
       
       FROM USER_BANCU.CATALOG_1036
       
       
       GROUP BY 
       
       CUIIO
       --DENUMIREA
       
       HAVING 
       
       COUNT (CUIIO) > 1 