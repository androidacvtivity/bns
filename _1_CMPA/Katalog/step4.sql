﻿CREATE TABLE USER_BANCU.REG_UNIT_GC_CMPA1
(
  UNIT_CODE       NUMBER                        ,
  UNIT_CODE_VERS  NUMBER                        ,
  NAME            VARCHAR2(100 BYTE)
 
)
TABLESPACE TBS_DTI_USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


UPDATE  USER_BANCU.REG_UNIT_GC_CMPA1 

SET UNIT_CODE_VERS = 1044;