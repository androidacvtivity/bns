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
   STATUTUL,
   DATA_CREATE,
   FACEBOOK,
   LINKEDIN,
   WEBSITE
            
            FROM USER_BANCU.VW_REGISTRU
            
            WHERE DATA_REG BETWEEN TO_DATE ('01/01/2017 00:00:00',
                                            'MM/DD/YYYY HH24:MI:SS')
                               AND TO_DATE ('12/31/2017 00:00:00',
                                            'MM/DD/YYYY HH24:MI:SS')
           
            AND 
             ','|| GEN_ACT_LIC||',' LIKE '%,'||91||',%'                                  
                                            
                                            
    ORDER BY                                            
    DATA_REG;        
            
            
            