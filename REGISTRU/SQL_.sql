INSERT INTO REGISTRU.FINAL_REGISTRU_MD
(
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

)

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
   
  FROM INIT_REGISTRU_MD
  ;




-----------------------------------------------------------------------------------

CREATE OR REPLACE TRIGGER TRG_MD_DATA_CREATE
BEFORE INSERT OR UPDATE ON REGISTRU.INITERNEDIAR_REGISTRU_MD FOR EACH ROW
BEGIN
  :NEW.DATA_CREATE := SYSDATE;
END;
/  

------------------------------------------------------------------------------------
CREATE TABLE REGISTRU.INITERNEDIAR_REGISTRU_MD
(
  IDNO            NUMBER,
  DATA_REG        DATE,
  DEN_COM         VARCHAR2(1024 BYTE),
  FORMA_ORG       VARCHAR2(1024 BYTE),
  ADRESA          VARCHAR2(1024 BYTE),
  LIST_COND       VARCHAR2(1024 BYTE),
  LISTA_FOND      NVARCHAR2(2000),
  GEN_ACT_NE_LIC  VARCHAR2(1024 BYTE),
  GEN_ACT_LIC     VARCHAR2(1024 BYTE),
  STATUTUL        VARCHAR2(1024 BYTE),
  DATA_CREATE     DATE
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

  
  ----------------------------------------------------------------------------------
  INSERT INTO  INIT_REGISTRU_MD
  ( 
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
  )  
  
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
   
   FROM NIT_REGISTRU_MD_TEMP
   
   ;
        
       -------------------------------------------------------------------------
        SELECT *
        FROM INIT_REGISTRU_MD;
        ------------------------------------------------------------------------

        DROP TABLE REGISTRU.INIT_REGISTRU_MD CASCADE CONSTRAINTS;
        

         CREATE TABLE NIT_REGISTRU_MD_TEMP
         
         
         AS    
         
         SELECT *
            
            FROM  INIT_REGISTRU_MD;

