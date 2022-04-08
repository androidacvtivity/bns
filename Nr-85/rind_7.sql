SELECT
     :pID_MDTABLE -1,
     :pCOD_CUATM AS COD_CUATM,
     '07' AS NR_ROW,
      7  AS ORDINE,
     'Din rînd.(04+06) pentru copii cu dereglari:' AS NUME_ROW,
       CIS2.NVAL(COUNT(DISTINCT CASE WHEN D.FORM = 17 AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007) AND  
               D.RIND IN ('010','020','030','040','050','060','070','080','090','100','110','120','130') AND NP.CODUL <> '0' AND  NT.CODUL <> '6'  THEN D.CUIIO ELSE NULL END))  AS  COL1, 
      
      
      
        CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL <> '0'  THEN D.COL4 ELSE NULL END),1))  AS  COL2,
        
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('010') AND NP.CODUL <> '0' THEN D.COL4 ELSE NULL END),1)) 
      - CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1001)  AND  D.RIND IN ('020') AND NP.CODUL <> '0' THEN D.COL4 ELSE NULL END),1)) AS  COL3,
       NULL AS  COL4,
       CIS2.NVAL(ROUND(SUM(CASE WHEN  D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> '0' THEN D.COL1 ELSE NULL END),1))  AS  COL5,
       
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> '0' THEN D.COL5 ELSE NULL END),1))   + 
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> '0' THEN D.COL6 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> '0'  THEN D.COL7 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> '0' THEN D.COL8 ELSE NULL END),1))   +
       CIS2.NVAL(ROUND(SUM(CASE WHEN   D.CAPITOL IN (1002)  AND  D.RIND IN ('120') AND NP.CODUL <> '0' THEN D.COL9 ELSE NULL END),1)) AS  COL6
       
       FROM    
             CIS2.VW_DATA_ALL D    
                      
              
               
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS) 
               
               -------------------------------------------------------------------------------------- 
               INNER JOIN CIS2.CL_N85_NPDS NP ON (RN.N85_NPDS=NP.CODUL) -- (NIÎP).(Col.8) = 1  -- NP.CODUL = 1
              
               -------------------------------------------------------------------------------------- 
                                         
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               
                WHERE  
               (D.PERIOADA =:pPERIOADA) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17 
               
               AND
               D.CAPITOL IN (1001,1002,1003,1004,1005,1006,1007)          
                    