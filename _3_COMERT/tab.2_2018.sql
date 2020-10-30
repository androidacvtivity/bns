
-------------------------------------------------------------------------------
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
   CD.NR_ROW AS NR_ROW,
   TO_NUMBER(CD.NR_ROW) AS ORDINE,
  '00' AS DECIMAL_POS,
   CD.NUME_ROW AS NUME_ROW,  
   COL1, COL2
FROM
(

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
                CR.NR_ROW AS NR_ROW,
                TO_NUMBER(CR.NR_ROW) AS ORDINE,
               '00' AS DECIMAL_POS,
                CR.NUME_ROW AS NUME_ROW,  
                 SUM(CASE WHEN MR.RIND IN ('100') AND CR.CFP LIKE '%'||RE.CFP||'%'  THEN  D.COL1 ELSE NULL END) COL1,
                 SUM(CASE WHEN MR.RIND IN ('100') AND CR.CFP LIKE '%'||RE.CFP||'%'  THEN  D.COL2 ELSE NULL END) COL2
                
                    FROM CIS2.DATA_ALL D
                    
                        INNER JOIN CIS2.MD_RIND MR ON  (MR.ID_MD = D.ID_MD)
                        INNER JOIN CIS2.RENIM RE ON (RE.CUIIO = D.CUIIO AND D.CUIIO_VERS = RE.CUIIO_VERS)
                        INNER JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = RE.CUATM)
                        INNER JOIN VW_CL_CFP CP ON (RE.CFP = CP.CODUL)   
                    CROSS JOIN
  (     
    SELECT 'Vinzari de marfuri cu amanuntul - Total' AS NUME_ROW,     '01' AS NR_ROW, '12-13-15-16-17-18-19-20-23-24-25-26-27-28' AS CFP FROM DUAL UNION
    SELECT 'din care - publica' AS NUME_ROW,                  '02' AS NR_ROW, '12-13' AS CFP FROM DUAL UNION     
    SELECT 'privata' AS NUME_ROW, '03' AS NR_ROW,  '15-16-17-18-19'                AS CFP FROM DUAL UNION 
    SELECT 'mixta (publica + privata)' AS NUME_ROW,'04' AS NR_ROW, '20' AS CFP FROM DUAL UNION 
    SELECT 'mixta (cu participarea capitalului strain) si straina' AS NUME_ROW, '05' AS NR_ROW, '23-24-25-26-27-28' AS CFP FROM DUAL   
  ) CR
                     
                    
                    WHERE 
                    MR.CAPITOL IN (357) AND
                    D.FORM_VERS = :pFORM_VERS AND
                    D.PERIOADA IN (:pPERIOADA) AND 
                    D.FORM IN (21)
                    AND  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
                    AND  MR.RIND IN ('100')    
                    
                  GROUP BY
                CR.NUME_ROW,CR.NR_ROW
                )CD 