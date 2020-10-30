CREATE TABLE USER_BANCU.FORM_CUIIO_3_COM
(
  CUIIO       NUMBER                            NOT NULL,
  CUIIO_VERS  NUMBER                            NOT NULL,
  FORM        NUMBER                            NOT NULL,
  FORM_VERS   NUMBER                            NOT NULL,
  STATUT      VARCHAR2(1 BYTE)
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