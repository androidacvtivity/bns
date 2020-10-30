













 



           INSERT INTO CIS2.MD_TABLES
           
                (
                ID_MDTABLE,
                 TABELE,
                 TABELE_VERS,
                 FORM,
                 FORM_VERS,
                 DENUMIRE,
                 DEN_SHORT,
                 NIVELRAIONAL,
                 ORDINE,
                 DATA_REG,
                 STATUT,
                 HTML_HEADER,
                 SQL_TEXT,
                 SQL_TEXT1,
                 LANDSCAPE,
                 COL_NUM,
                 FOOTNOTE,
                 UM    

              )

                SELECT 
                 ID_MDTABLE,
                 TABELE,
                1032  TABELE_VERS,
                 FORM,
                 FORM_VERS,
                 DENUMIRE,
                 DEN_SHORT,
                 NIVELRAIONAL,
                 ORDINE,
                 DATA_REG,
                 STATUT,
                 HTML_HEADER,
                 SQL_TEXT,
                 SQL_TEXT1,
                 LANDSCAPE,
                 COL_NUM,
                 FOOTNOTE,
                 UM    
                
                FROM CIS2.MD_TABLES
                
                WHERE 
                FORM IN (44)

                AND STATUT <> '3'

                AND TABELE_VERS IN (1034)