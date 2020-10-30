




SELECT 
  IDNO,
  DATA_REG,
  DEN_COM,
  FORMA_ORG,
  ADRESA,
  LIST_COND,
  LISTA_FOND,
  GEN_ACT_NE_LIC,
  GEN_ACT_LIC,
  STATUTUL 

FROM USER_BANCU.VW_REGISTRU

WHERE 

IDNO IN (
1005600040624
)
ORDER BY 

DATA_REG DESC



---------------------------------------------------------------------------------
DROP TABLE USER_BANCU.IT_PARK_CHISNAU CASCADE CONSTRAINTS;

-------------------------------------------------------------------------------
CREATE TABLE USER_BANCU.IT_PARK_CHISNAU
(
  NR                           NUMBER,
  IDNO                         NUMBER,  
  DENUMIREA                    VARCHAR2(1024 BYTE),
  SEDIUL_JURIDIC               VARCHAR2(1024 BYTE),
  TERMEN_CONTRACT              VARCHAR2(1024 BYTE),
  CAEM2_INPARK                 VARCHAR2(1024 BYTE), 
  ADRSELE_SUBD                 VARCHAR2(1024 BYTE),
  PERS_RESPONABILE             VARCHAR2(1024 BYTE),
  DATA_INREGISTRARII           DATE, 
  DATA_ESIRII                  VARCHAR2(1024 BYTE), 
  NR_INREGISTRARII             VARCHAR2(1024 BYTE)
)
TABLESPACE TBS_DTI_USERS
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;



--------------------------------------------------------------------------------
SELECT 
  IDNO,
  DATA_REG,
  DEN_COM,
  FORMA_ORG,
  ADRESA,
  LIST_COND,
  LISTA_FOND,
  GEN_ACT_NE_LIC,
  GEN_ACT_LIC,
  STATUTUL 

FROM USER_BANCU.VW_REGISTRU

WHERE 

IDNO IN (
1005600040624
)
ORDER BY 

DATA_REG DESC