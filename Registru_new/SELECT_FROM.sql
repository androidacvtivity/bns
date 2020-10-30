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

          FROM   ALL_APP.MD_08_04_2019
          
          
          WHERE 
          
          1=1 
          
          OR 
          
          
          (DEN_COM LIKE '%'||'ALINASOFT'||'%'
          OR 
          DEN_COM LIKE '%'||'Alinasoft'||'%')