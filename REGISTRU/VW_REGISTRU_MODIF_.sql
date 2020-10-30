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
            
    FROM  USER_BANCU.VW_REGISTRU_MODIF
    
    
    
    WHERE 
    1=1
    
    AND  DEN_COM LIKE '%SOCIE%'
    
    ORDER BY 
    
    -- DATA_REG DESC
    
    DEN_COM DESC
    
    
    ;
    
    
    COMMIT;