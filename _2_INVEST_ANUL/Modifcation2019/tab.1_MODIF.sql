    SELECT 
                  B.ORDINE AS NR_ROW,
                  B.ORDINE AS ORDINE,
                 '11111111111' AS DECIMAL_POS,
                  B.DENUMIRE AS NUME_ROW,
                  SUM(CASE WHEN NR_ROW LIKE '%'|| R.CFP ||'%' AND MR.RIND IN '100' THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL1,
                  SUM(CASE WHEN NR_ROW LIKE '%'|| R.CFP ||'%' AND MR.RIND IN '810' THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL2,
                  SUM(CASE WHEN NR_ROW LIKE '%'|| R.CFP ||'%' AND MR.RIND IN '820' THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL3,
                  SUM(CASE WHEN NR_ROW LIKE '%'|| R.CFP ||'%' AND MR.RIND IN '830' THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL4,
                  SUM(CASE WHEN NR_ROW LIKE '%'|| R.CFP ||'%' AND MR.RIND IN '840' THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL5,
                  SUM(CASE WHEN NR_ROW LIKE '%'|| R.CFP ||'%' AND MR.RIND IN '850' THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL6,
                  SUM(CASE WHEN NR_ROW LIKE '%'|| R.CFP ||'%' AND MR.RIND IN '860' THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL7,
                  SUM(CASE WHEN NR_ROW LIKE '%'|| R.CFP ||'%' AND MR.RIND IN '870' THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL8,
                  SUM(CASE WHEN NR_ROW LIKE '%'|| R.CFP ||'%' AND MR.RIND IN '880' THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL9,
                  SUM(CASE WHEN NR_ROW LIKE '%'|| R.CFP ||'%' AND MR.RIND IN '890' THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL10,
                  
              
                  ROUND(  (CIS2.NVAL(SUM(CASE WHEN NR_ROW LIKE '%'|| R.CFP ||'%' AND MR.RIND IN '100' THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE 0  END)) / 
                     
                  
                  CIS2.NVAL(SUM(CASE WHEN NR_ROW LIKE '%'|| R.CFP ||'%' AND MR.RIND IN '100' THEN CIS2.NVAL(D.COL3) + CIS2.NVAL(D.COL4) ELSE 0  END))) / P.COL1 * 100,1) 
                 
                    --                    

                  
                  
                   AS COL11
            
            
                    FROM CIS2.DATA_ALL D 
                    
                                         INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
                                         INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO  AND R.CUIIO_VERS = D.CUIIO_VERS
                                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
                                         INNER JOIN CIS2.VW_CL_CFP CF ON CF.CODUL = R.CFP 
                    --
                    
                    CROSS JOIN
                       (SELECT 1 AS ORDINE, '12+13+15+16+17+18+19+20+24+26+28' AS NR_ROW, 'TOTAL imobilizari necorporale si corporale' AS DENUMIRE FROM DUAL UNION
                        SELECT 2 AS ORDINE, '12+13' AS NR_ROW, 'publica' AS DENUMIRE FROM DUAL UNION
                        SELECT 3 AS ORDINE, '15+16+17+18+19' AS NR_ROW, 'privata' AS DENUMIRE FROM DUAL UNION
                        SELECT 4 AS ORDINE, '20' AS NR_ROW, 'mixta (publica si privata), fara participare straina' AS DENUMIRE FROM DUAL UNION
                        SELECT 5 AS ORDINE, '24+26' AS NR_ROW, 'straina' AS DENUMIRE FROM DUAL UNION
                        SELECT 6 AS ORDINE, '28' AS NR_ROW, 'a intreprindelor mixte' AS DENUMIRE FROM DUAL) B
                        
                        
                        
                         CROSS JOIN (
  
                             SELECT 
                            
                                SUM(D.COL1) AS COL1

                             FROM CIS2.DATA_ALL D 
                    
                                         INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
                                         
                                         WHERE 
                                         
                                         D.FORM = 100 AND
                                         D.CUIIO = 2 AND
                                         D.PERIOADA IN :pPERIOADA AND
                                         MR.CAPITOL = 330 AND
                                         MR.RIND IN '01' ) P
                    
                       WHERE
                       
                       (D.FORM=:pFORM) AND
                       (D.FORM_VERS=:pFORM_VERS) AND
                       (:pID_MDTABLE=:pID_MDTABLE) AND
                       D.PERIOADA IN :pPERIOADA AND
                       D.FORM = 8 AND
                       MR.CAPITOL = 323 
                       AND (C.FULL_CODE  LIKE '%'||:pCOD_CUATM||';%')  
                    
                    
                    GROUP BY
                  B.DENUMIRE,
                  B.ORDINE,
                  P.COL1
                  
                  ORDER BY 
                  B.ORDINE
                  