CREATE OR REPLACE FORCE VIEW REG_UNIT_GC_MAX
(
  UNIT_CODE,
  UNIT_CODE_VERS,
  NR_GOSP,
  NR_MAPS,         
  SURNAME,         
  NAME,            
  PATRONIMIC,      
  CUATM,           
  ADDRESS_1,       
  ADDRESS_2,       
  ADDRESS_3,       
  ADDRESS_4,       
  ENVIRONMENT,     
  CSID,            
  EDIT_USER 
)

AS 
SELECT 

  RN.UNIT_CODE,
  RN.UNIT_CODE_VERS,
  RN.NR_GOSP,
  RN.NR_MAPS,         
  RN.SURNAME,         
  RN.NAME,            
  RN.PATRONIMIC,      
  RN.CUATM,           
  RN.ADDRESS_1,       
  RN.ADDRESS_2,       
  RN.ADDRESS_3,       
  RN.ADDRESS_4,       
  RN.ENVIRONMENT,     
  RN.CSID,            
  RN.EDIT_USER       

FROM CIS2.REG_UNIT_GC RN 

INNER JOIN (
SELECT 
FC.UNIT_CODE, 
MAX(FC.UNIT_CODE_VERS) UNIT_CODE_VERS,
FC.NR_GOSP,
FC.NR_MAPS   

 FROM CIS2.REG_UNIT_GC FC 
 
 GROUP BY 
 FC.UNIT_CODE, 
 FC.NR_GOSP,
 FC.NR_MAPS 
 ) D ON 
 
  D.UNIT_CODE = RN.UNIT_CODE
                  AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                  AND D.NR_GOSP = RN.NR_GOSP
                  AND D.NR_MAPS = RN.NR_MAPS