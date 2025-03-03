--INSERT INTO CIS2.MD_TABLES
--
--(
--  ID_MDTABLE,   
--  TABELE,        
--  TABELE_VERS, 
--  FORM, 
--  FORM_VERS,
--  DENUMIRE,
--  DEN_SHORT,
--  NIVELRAIONAL, 
--  ORDINE,
--  DATA_REG,
--  STATUT,
--  HTML_HEADER,
--  SQL_TEXT, 
--  SQL_TEXT1,   
--  LANDSCAPE,   
--  COL_NUM,   
--  FOOTNOTE, 
--  UM,  
--  CREATING  
--
--)

SELECT
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
  UM,  
  CREATING  

    FROM CIS2.MD_TABLES
    
    WHERE

ID_MDTABLE IN 

  (SELECT D.ID_MDTABLE
    FROM CIS2.MD_TABLES D
         INNER JOIN (  SELECT D.TABELE, MAX (D.TABELE_VERS) TABELE_VERS
                         FROM CIS2.MD_TABLES D
                        WHERE D.FORM = 3
                     GROUP BY D.TABELE) DD
             ON (D.TABELE = dd.TABELE AND D.TABELE_VERS = dd.TABELE_VERS)
   WHERE D.FORM = 3
GROUP BY D.ID_MDTABLE,
         D.TABELE,
         D.TABELE_VERS,
         d.ORDINE
)

AND STATUT <>  '3'

ORDER BY

ORDINE