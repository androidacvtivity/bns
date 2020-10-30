



        SELECT *
        
              FROM ALL_APP.VW_REGISTRU;
              
              
              CREATE TABLE KATALOG_EI78_1036
(
  CUIIO           NUMBER, 
  CUIIO_VERS      NUMBER,
  DENUMIRE        VARCHAR2(1024 BYTE),
 
 
  CUATM           VARCHAR2(1024 BYTE),
  CFP            VARCHAR2(1024 BYTE),
  CFOJ            VARCHAR2(1024 BYTE),
  COCM           VARCHAR2(1024 BYTE),
 
 
  CAEM2          VARCHAR2(1024 BYTE)
 
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