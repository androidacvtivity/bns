





           UPDATE CIS2.MD_RIND 
            
            SET DECIMAL_POS = SUBSTR(DECIMAL_POS,1,4),
            
                COL_ACTIV  = SUBSTR(COL_ACTIV,1,4)
            
           WHERE
           
            FORM IN (44)

            AND CAPITOL IN (405)

            AND RIND_VERS IN (1040)

            AND STATUT <> '3';
            
            SELECT 
            
                DECIMAL_POS,
                SUBSTR(DECIMAL_POS,1,4)  DECIMAL_POS_,
                SUBSTR(COL_ACTIV,1,4)    COL_ACTIV_,
                
                COL_ACTIV
            
            
            FROM CIS2.MD_RIND

            WHERE
            FORM IN (44)

            AND CAPITOL IN (405)

            AND RIND_VERS IN (1040)

            AND STATUT <> '3'
            
            
            ORDER BY 
            
            ORDINE