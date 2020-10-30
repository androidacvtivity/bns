SELECT 
  IDNO,
  'I5610' CAEM2,
  'Restaurante'        DEN_CAEM2, 
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
  

             
             ','||GEN_ACT_LIC||',' LIKE '%,'||83||',%'
             
             
             
             AND 
             
             FORMA_ORG IN ('Societate cu răspundere limitată')
             
             AND 
             
             ADRESA LIKE  'mun. Chişinău%'
             
             
             ORDER BY 
              DATA_REG DESC