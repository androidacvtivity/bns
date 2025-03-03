﻿CREATE TABLE USER_BANCU.KAT_1_CC_FINAL
(
  CUIIO       NUMBER,
  CUIIO_VERS  NUMBER,
  DENUMIRE    VARCHAR2(255 BYTE),
  CUATM       VARCHAR2(255 BYTE),
  CFOJ        VARCHAR2(255 BYTE),
  CFP         VARCHAR2(255 BYTE),
  CAEM2       VARCHAR2(255 BYTE)
)
TABLESPACE TBS_DTI_USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;
