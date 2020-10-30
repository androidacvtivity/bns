





            SELECT 
            R.IDNO,
            R.DATA_REG,
            R.DEN_COM,
            R.FORMA_ORG,
            R.ADRESA,
            R.LISTA_FOND,
            R.LIST_COND,
            CC.CODUL GEN_ACT_NE_LIC,
            CC.DENUMIRE  DEN_CAEM,
            C.CODUL GEN_ACT_LIC,
            C.DENUMIRE  DEN_GEN_ACT_LIC
            
            
            FROM USER_BANCU.VW_REGISTRU R
            
            
                        INNER JOIN  USER_BANCU.CL_LICENTIAT C ON  ','||R.GEN_ACT_LIC||',' LIKE '%,'||C.CODUL||',%'
                        
                        INNER JOIN  CIS2.VW_CL_CAEM  CC ON  ','||R.GEN_ACT_NE_LIC||',' LIKE '%,'||SUBSTR(CC.CODUL,2)||',%'
                        
                        
             
            WHERE 
            
            IDNO IN (1005600048561)
            
            