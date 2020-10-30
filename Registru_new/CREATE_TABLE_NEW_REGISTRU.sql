INSERT INTO ALL_APP.MD_08_04_2019

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
            
            FROM ALL_APP.VW_REG_MODIF_08_04_2019;
            
            
            
            
            