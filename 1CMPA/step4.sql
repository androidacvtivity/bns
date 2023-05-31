--INSERT INTO USER_BANCU.CMPA2_1052_FINAL (
--  UNIT_CODE,
--  UNIT_CODE_VERS,
--  NR_GOSP,
--  NR_MAPS,         
--  SURNAME,         
--  NAME,            
--  PATRONIMIC,      
--  CUATM,           
--  ADDRESS_1,       
--  ADDRESS_2,       
--  ADDRESS_3,       
--  ADDRESS_4,       
--  ENVIRONMENT,     
--  CSID,            
--  EDIT_USER 
--
--
--)


SELECT 
  D.UNIT_CODE,
  D.UNIT_CODE_VERS,
  D.UNIT_CODE  NR_GOSP,
  D.UNIT_CODE NR_MAPS,         
  NULL SURNAME,         
  D.NAME,            
  NULL PATRONIMIC,      
  D.CUATM,           
  D.ADDRESS_1,       
  NULL ADDRESS_2,       
  NULL ADDRESS_3,       
  NULL ADDRESS_4,       
  D.ENVIRONMENT,     
  D.CSID,            
  D.EDIT_USER 
            
           
            
            FROM


(
SELECT 
  D.UNIT_CODE,
  D.UNIT_CODE_VERS,
  D.NR_GOSP,
  D.NR_MAPS,         
  D.SURNAME,         
  D.NAME,            
  D.PATRONIMIC,   
  CASE 
                   
                   WHEN LENGTH(D.CUATM) = 6  AND SUBSTR(D.CUATM,1,1) =  '1' THEN '0'||D.CUATM 
                   
                   
                   WHEN LENGTH(D.CUATM) = 6  AND SUBSTR(D.CUATM,1,1) =  '3' THEN '0'||D.CUATM 
                   
                   ELSE  D.CUATM END  CUATM,   
--  D.CUATM,           
  D.ADDRESS_1,       
  D.ADDRESS_2,       
  D.ADDRESS_3,       
  D.ADDRESS_4,       
  D.ENVIRONMENT,     
  D.CSID,            
  D.EDIT_USER 
            
           
            
            FROM USER_BANCU.CMPA2_1052 D

)

D

LEFT   JOIN  CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM 
  
  WHERE 
  
  C.CODUL IS NOT  NULL ;
           