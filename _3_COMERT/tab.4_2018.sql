



SELECT
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
  
         
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  A.CODUL AS NR_ROW,
  ROWNUM AS ORDINE,
  '111111' AS DECIMAL_POS,
  A.DENUMIRE AS NUME_ROW,
  A.COL1,
  (((NVAL(A.COL1)/NOZERO(B.COL1))*100)/NOZERO(A.COL2))*100 AS COL2,
  A.COL3,
  A.COL4,
  A.COL5,
  A.COL6
FROM


 (
      SELECT 
                 CR.CODUL,
                 CR.DENUMIRE,  
                 CR.FULL_CODE, 
                 SUM(CASE WHEN MR.RIND IN ('100')  THEN   D.COL1 ELSE NULL END) COL1,
                 SUM(CASE WHEN MR.RIND IN ('100')  THEN   D.COL2 ELSE NULL END) COL2,
                 SUM(CASE WHEN MR.RIND IN ('100')  AND    RE.CFP IN ('12','13') THEN   D.COL1  ELSE NULL END) COL3,
                 SUM(CASE WHEN MR.RIND IN ('100')  AND    RE.CFP IN ('15','16','17','18','19') THEN   D.COL1  ELSE NULL END) COL4,
                 SUM(CASE WHEN MR.RIND IN ('100')  AND    RE.CFP IN ('20') THEN   D.COL1  ELSE NULL END) COL5,
                 SUM(CASE WHEN MR.RIND IN ('100')  AND    RE.CFP IN ('23','24','25','26','27','28') THEN   D.COL1  ELSE NULL END) COL6
                    FROM CIS2.DATA_ALL D
                    
                        INNER JOIN CIS2.MD_RIND MR ON  (MR.ID_MD = D.ID_MD)
                        INNER JOIN CIS2.RENIM RE ON (RE.CUIIO = D.CUIIO AND D.CUIIO_VERS = RE.CUIIO_VERS)
                        INNER JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = RE.CUATM)
                        
                        INNER JOIN CIS2.MD_RIND MRR  ON (MRR.ID_MD=D.ID_MD AND C.FULL_CODE LIKE  '%'||:pCOD_CUATM||';%' ) 
                       
                     INNER JOIN VW_CL_CUATM CR ON(C.FULL_CODE LIKE '%'||CR.CODUL||';%')  
                        
                         
                    
                    WHERE 
                    MR.CAPITOL IN (357) AND
                    D.FORM_VERS = :pFORM_VERS AND
                    D.PERIOADA IN (:pPERIOADA) AND 
                    D.FORM IN (21)
                    AND  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
                    AND (LENGTH(CR.FULL_CODE)<=24 OR CR.CODUL IN (0110000))  
                    AND  MR.RIND IN ('100')

         GROUP BY
  CR.CODUL,
  CR.DENUMIRE,
  CR.FULL_CODE
ORDER BY
  CR.FULL_CODE
  
    )  
    A 
CROSS JOIN
(

SELECT 
       
  D.COL1        
  
  
FROM 
  
  CIS2.DATA_ALL D
  
  
                        INNER JOIN CIS2.MD_RIND MR ON  (MR.ID_MD = D.ID_MD)
                        INNER JOIN CIS2.RENIM RE ON (RE.CUIIO = D.CUIIO AND D.CUIIO_VERS = RE.CUIIO_VERS)
WHERE
 
  D.PERIOADA = :pPERIOADA AND
  D.FORM IN (100)              AND 
  D.FORM_VERS = :PFORM_VERS  AND    
  MR.CAPITOL IN (359) AND
  MR.RIND IN ('100')
  
  
) B
    
    
  