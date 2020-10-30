SELECT *
FROM
(

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
  

             
             ','||GEN_ACT_NE_LIC||',' LIKE '%,'||5610||',%'
             



UNION  

SELECT 
  IDNO,
  'I5620' CAEM2,
  'Activitati de alimentatie (catering) pentru evenimente si alte servicii de alimentatie'        DEN_CAEM2, 
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
        ','||GEN_ACT_NE_LIC||',' LIKE '%,'||5620||',%'


UNION  

SELECT 
  IDNO,
  'I5621' CAEM2,
  'Activitati de alimentatie (catering) pentru evenimente'        DEN_CAEM2, 
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
        ','||GEN_ACT_NE_LIC||',' LIKE '%,'||5621||',%'


UNION  

SELECT 
  IDNO,
  'I5629' CAEM2,
  'Alte activitati de alimentatie'        DEN_CAEM2, 
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
        ','||GEN_ACT_NE_LIC||',' LIKE '%,'||5629||',%'
        
        
        
        UNION  

SELECT 
  IDNO,
  'I5630' CAEM2,
  'Baruri si alte activitati de servire a bauturilor'        DEN_CAEM2, 
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
        ','||GEN_ACT_NE_LIC||',' LIKE '%,'||5630||',%'
)
ORDER BY
DATA_REG DESC,
CAEM2