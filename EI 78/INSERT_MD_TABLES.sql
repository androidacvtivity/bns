--INSERT INTO CIS2.MD_TABLES
--
--(
--
--            ID_MDTABLE,
--            TABELE,
--            TABELE_VERS,
--            FORM,
--            FORM_VERS,
--            DENUMIRE,
--            DEN_SHORT,
--            NIVELRAIONAL,
--            ORDINE,
--            DATA_REG,
--            STATUT,
--            HTML_HEADER,
--            SQL_TEXT,
--            SQL_TEXT1,
--            LANDSCAPE,
--            COL_NUM,
--            FOOTNOTE,
--            UM,
--            CREATING  
--)





        SELECT 
        
            ID_MDTABLE,
            TABELE,
            2007 TABELE_VERS,
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
            UM,
            CREATING     


          FROM CIS2.MD_TABLES  

            WHERE 
            
            FORM IN (8)
            --AND  TABELE_VERS IN (2000)

            AND STATUT <> '3'
            