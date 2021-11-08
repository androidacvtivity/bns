﻿/* Formatted on 11/8/2021 6:03:12 PM (QP5 v5.326) */
  SELECT D.ID_MDTABLE
    FROM CIS2.MD_TABLES D
         INNER JOIN (  SELECT D.TABELE, MAX (D.TABELE_VERS) TABELE_VERS
                         FROM CIS2.MD_TABLES D
                        WHERE D.FORM = 40
                     GROUP BY D.TABELE) DD
             ON (D.TABELE = dd.TABELE AND D.TABELE_VERS = dd.TABELE_VERS)
   WHERE D.FORM = 40
GROUP BY D.ID_MDTABLE,
         D.TABELE,
         D.TABELE_VERS,
         d.ORDINE
ORDER BY d.ORDINE