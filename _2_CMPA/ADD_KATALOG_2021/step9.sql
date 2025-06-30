--INSERT INTO CIS2.REG_UNIT_GC
--(
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
--)



SELECT 
  UNIT_CODE,
  1065 UNIT_CODE_VERS,
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

    FROM USER_BANCU.REG_UNIT_GC_MAX
    
    WHERE 
    UNIT_CODE IN (
    

 878860,
879091,
879176,
879206,
879222,
879336,
879441,
879540,
879697,
879704,
879772,
879853,
879933,
879948,
879950,
880018,
880163,
880340,
880436,
880540,
880586



)

AND UNIT_CODE_VERS <> 1065
    
    ORDER BY
    UNIT_CODE