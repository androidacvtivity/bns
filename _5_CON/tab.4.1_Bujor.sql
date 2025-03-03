﻿--INSERT INTO TABLE_OUT 
--(
--  PERIOADA,
--  FORM,
--  FORM_VERS,
--  ID_MDTABLE,
--  COD_CUATM,
--  NR_SECTIE,
--  NUME_SECTIE,
--  NR_SECTIE1,
--  NUME_SECTIE1,
--  NR_SECTIE2,
--  NUME_SECTIE2,
--  NR_ROW,
--  ORDINE,
--  DECIMAL_POS,
--  NUME_ROW,  
--  COL1
--)

--SELECT
--  :pPERIOADA,
--  :pFORM,
--  :pFORM_VERS,
--  :pID_MDTABLE,
--  :pCOD_CUATM,
--   D.CODUL AS NR_SECTIE,
--  '0' AS NUME_SECTIE,
--  '0' AS NR_SECTIE1,
--  '0' AS NUME_SECTIE1,
--  '0' AS NR_SECTIE2,
--  '0' AS NUME_SECTIE2,
--  D.NR_ROW ||'~'||D.CODUL AS NR_ROW,
--  D.ORDINE AS ORDINE,
--  '1' AS DECIMAL_POS,
--  D.CODUL AS NUME_ROW,
--  D.COL1 AS COL1 
--    
--FROM
--    (
    SELECT 
      R1.CODUL,
      R1.NR_ROW, 
      R1.ORDINE,   
      SUM(D1.COL1) AS COL1

    FROM        
        CIS2.VW_DATA_ALL  D1
        INNER JOIN CIS2.VW_CL_CUATM VC ON (D1.CUATM = VC.CODUL)
        INNER JOIN CIS2.VW_CL_CAEM2 V ON (D1.CAEM2 = V.CODUL)
        RIGHT JOIN
        (
                           SELECT 
                                   CM.CODUL,   
                                   M.RIND AS NR_ROW,
                                   M.RIND_VERS AS RIND_VERS,
                                   MAX(M.ORDINE) AS ORDINE
                                   
                            FROM CIS2.VW_CL_CAEM2 CM
                                CROSS JOIN (SELECT
                                              M.RIND,
                                              MAX(M.ORDINE) AS ORDINE,
                                              MAX(M.RIND_VERS) AS RIND_VERS
                                            FROM
                                              CIS2.MD_RIND M
                                              INNER JOIN (
                                                  SELECT
                                                  M.RIND,
                                                  MAX(M.RIND_VERS) AS RIND_VERS
                                                FROM
                                                  CIS2.MD_RIND M
                                                WHERE
                                                  M.FORM IN (18) AND       
                                                  M.RIND_VERS <=:pPERIOADA AND
                                                  M.CAPITOL_VERS IN (1032) AND
                                                  M.CAPITOL IN (1009) AND
                                                  M.RIND NOT IN ('-') 
                                                GROUP BY
                                                  M.RIND
                                              ) R ON (M.RIND = R.RIND AND M.RIND_VERS=R.RIND_VERS)
                                            WHERE
                                              M.FORM IN (18) AND   
                                              M.CAPITOL IN (1009) AND    
                                              M.RIND_VERS <=:pPERIOADA AND
                                              M.CAPITOL_VERS IN (1032) AND
                                              M.RIND NOT IN ('-') AND
                                              M.STATUT <> '3'
                                            GROUP BY
                                              M.RIND) M
                                     
                            WHERE 
                                CM.CODUL IN

                                ('00000','A0000','A0100','A0160','A0200','A0300','B0000','C0000','C1000','C1100','C1200','C1300','C1400','C1500','C1600','C1700','C1800','C1900','C2000',
                                 'C2100','C2200','C2300','C2400','C2500','C2600','C2700','C2800','C2900','C3000','C3100','C3200','C3300','D0000','D3510','D3511','D3512','D3513','D3514',
                                 'D3520','D3521','D3522','D3523','D3530','E0000','E3600','E3700','E3810','E3820','E3830','E3900','F0000','F4100','F4200','F4300','G0000','G4500','G4600',
                                 'G4700','G4790','H0000','H4900','H4950','H5000','H5100','H5200','H5300','I0000','I5500','I5600','J0000','J5800','J5900','J6000','J6100','J6200','J6300',
                                 'K0000','K6400','K6500','K6600','L0000','M0000','M6900','M7000','M7100','M7120','M7200','M7300','M7400','M7490','M7500','N0000','N7700','N7800','N7900',
                                 'N8000','N8100','N8200','O0000','P0000','Q0000','Q8600','Q8700','Q8800','R0000','R9000','R9100','R9200','R9300','S0000','S9400','S9510','S9520','S9600',
                                 'B0800','B0900','H4910','H4920','H4930','H4940','H5010','H5020','H5030','H5040','H5110','H5120','I5510','I5520','I5530','I5590','I5610','I5620','I5630',
                                 'M7112','R9320')
                            GROUP BY
                              CM.CODUL,   
                                   M.RIND,
                                   M.RIND_VERS
                            ORDER BY
                              CM.CODUL,
                              M.RIND
        ) R1 ON (V.FULL_CODE LIKE '%'||R1.CODUL||'%' AND D1.RIND = R1.NR_ROW AND D1.FORM IN (18)           AND 
            D1.CAPITOL_VERS  <= :pPERIOADA AND         
            D1.CAPITOL IN (1009) AND
            D1.FORM_VERS = :pFORM_VERS  AND 
            D1.PERIOADA IN (:pPERIOADA) AND VC.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' )


                
        GROUP BY
            R1.CODUL,
            R1.NR_ROW,
            R1.ORDINE
        ORDER BY
        R1.CODUL,
            R1.NR_ROW,
            R1.ORDINE
            
     --   ) D 
            
