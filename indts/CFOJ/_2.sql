CREATE TABLE IND_TS
(
  CUIIO       NUMBER                            ,
  CUIIO_VERS  NUMBER                            ,
 
  CFOJ        VARCHAR2(512 BYTE)
 
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