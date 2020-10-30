         UPDATE CIS2.MD_RIND 
            
            SET DECIMAL_POS = SUBSTR(DECIMAL_POS,1,4),
            
                COL_ACTIV = SUBSTR(COL_ACTIV,1,4)
            
        
           
            WHERE
            
            FORM IN (46)

            AND CAPITOL IN (403)

            AND RIND_VERS IN (2008)

            AND STATUT <> '3'
            
            
            ;