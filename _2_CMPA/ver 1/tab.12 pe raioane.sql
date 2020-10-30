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
          A.COL1 ||'~'||ROWNUM AS NR_ROW, 
          ROWNUM ORDINE,
          '0001' AS DECIMAL_POS,                     
          A.ORDINE||'-'||A.NUME_ROW NUME_ROW,
          A.COL2 AS COL1,
          A.COL3 AS COL2 ,
          A.COL4 AS COL3,
          A.COL5 AS COL4 
          FROM   


(
SELECT 
  RN.UNIT_CODE AS ORDINE,
  RN.NAME AS NUME_ROW,
  
 SUM(CASE WHEN  MR.RIND IN ('061','062') THEN  D.COL2 ELSE NULL END  ) AS COL1,
          
          SUM(CASE WHEN  MR.RIND IN ('061') THEN  D.COL2 ELSE NULL END  ) AS COL2,
          SUM(CASE WHEN  MR.RIND IN ('062') THEN  D.COL2 ELSE NULL END  ) AS COL3,
          SUM(CASE WHEN  MR.RIND IN ('061') THEN  D.COL2 ELSE NULL END  ) AS COL4,
          SUM(CASE WHEN  MR.RIND IN ('062') THEN  D.COL2 ELSE NULL END  ) AS COL5
 
    
    --------------------------------------------------------------------
FROM DATA_ALL_GC D 
                 
                 
                 
                 
                        INNER JOIN CIS2.MD_RIND MR  ON (MR.ID_MD =  D.ID_MD)
                        
                
                        
          
               INNER JOIN REG_UNIT_GC RN
                ON     D.UNIT_CODE = RN.UNIT_CODE
                AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                AND D.NR_GOSP = RN.NR_GOSP
                AND D.NR_MAPS = RN.NR_MAPS
                
                INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL 
  
  ---------------------------------------
  
WHERE


                   -- D.PERIOADA IN (:pPERIOADA )) AND
                   (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   MR.CAPITOL IN (417)
                   
                   AND MR.RIND IN ('061','062')
                   
  
  
   
GROUP BY
 RN.UNIT_CODE,
 RN.NAME
 
 UNION 
 
 
 SELECT 
 0 AS ORDINE,
  'TOTAL' AS NUME_ROW,
  
 SUM(CASE WHEN  MR.RIND IN ('061','062') THEN  D.COL2 ELSE NULL END  ) AS COL1,
          
          SUM(CASE WHEN  MR.RIND IN ('061') THEN  D.COL2 ELSE NULL END  ) AS COL2,
          SUM(CASE WHEN  MR.RIND IN ('062') THEN  D.COL2 ELSE NULL END  ) AS COL3,
          SUM(CASE WHEN  MR.RIND IN ('061') THEN  D.COL2 ELSE NULL END  ) AS COL4,
          SUM(CASE WHEN  MR.RIND IN ('062') THEN  D.COL2 ELSE NULL END  ) AS COL5
    
    --------------------------------------------------------------------
FROM DATA_ALL_GC D 
                 
                 
                 
                 
                        INNER JOIN CIS2.MD_RIND MR  ON (MR.ID_MD =  D.ID_MD)
                        
                
                        
          
               INNER JOIN REG_UNIT_GC RN
                ON     D.UNIT_CODE = RN.UNIT_CODE
                AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                AND D.NR_GOSP = RN.NR_GOSP
                AND D.NR_MAPS = RN.NR_MAPS
                
                INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL 
  
  ---------------------------------------
  
WHERE


                   -- D.PERIOADA IN (:pPERIOADA )) AND
                   (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   MR.CAPITOL IN (417)
                   
                   AND MR.RIND IN ('061','062')
                   
                   ) A 