

CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_REGISTRU
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
  STATUTUL,
  DATA_CREATE,
  FACEBOOK,
  LINKEDIN,
  WEBSITE 
) 
   
AS 
 
 
 SELECT 
   TRIM(VB.IDNO)              AS IDNO,
   VB.DATA_REG           AS DATA_REG,
   TRIM(VB.DEN_COM)           AS DEN_COM,
   TRIM(VB.FORMA_ORG)         AS FORMA_ORG,
   TRIM(VB.ADRESA)            AS ADRESA,
   TRIM(VB.LIST_COND)         AS LIST_COND,
   TRIM(VB.LISTA_FOND)        AS LISTA_FOND,
   REPLACE(TRIM(VB.GEN_ACT_NE_LIC), ' ','' )      AS GEN_ACT_NE_LIC,
   REPLACE(TRIM(VB.GEN_ACT_LIC), ' ','' )         AS GEN_ACT_LIC,
   TRIM(VB.STATUTUL)          AS STATUTUL, 
   TRIM(DATA_CREATE)          AS DATA_CREATE,
   TRIM(FACEBOOK)             AS FACEBOOK,
   TRIM(LINKEDIN)             AS LINKEDIN,
   TRIM(WEBSITE)              AS WEBSITE
   
    
   FROM USER_BANCU.REGISTRU_MD_19_12_2017 VB
   
   
   ;
   
--   ORDER BY 
--   DATA_REG DESC
   --;
   
   -----------------------------------------------------------------------------