--INSERT INTO  TABLE_OUT
--    (
--      
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
--  COL1,COL2, COL3, COL4
--  
--    )

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
         '0002002002' AS DECIMAL_POS,                 
          A.DENUMIRE NUME_ROW,
          A.COL2 AS COL1,
          A.COL3 AS COL2 ,
          A.COL4 AS COL3,
          A.COL5 AS COL4,
          A.COL6 AS COL5,
          A.COL7 AS COL6,
          A.COL8 AS COL7,
          A.COL9 AS COL8,
          A.COL10 AS COL9,
          A.COL11 AS COL10
           
          FROM   

          (  
          SELECT 
          
          CTT.CODUL,
          CTT.DENUMIRE,
          SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011','031','041') THEN  D.COL2 ELSE NULL END ) AS COL1,
          
          SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011','031','041') THEN  NVAL(D.COL2) ELSE NULL END) / 
          NOZERO(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011','031','041') THEN  NVAL(D.COL2) ELSE NULL END )) AS COL2,
          
          SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011') THEN  D.COL1 ELSE NULL END ) AS COL3,
          
          
          SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011') THEN  D.COL2 ELSE NULL END ) AS COL4,
          
          ROUND(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011') THEN  D.COL2 ELSE NULL END ) /
          
          SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011') THEN  D.COL1 ELSE NULL END ),2) AS COL5,
          
          
           SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('041') THEN  D.COL1 ELSE NULL END ) AS COL6,
          
          
          SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('041') THEN  D.COL2 ELSE NULL END ) AS COL7,
          
          ROUND(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('041') THEN  D.COL2 ELSE NULL END ) /
          
          SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('041') THEN  D.COL1 ELSE NULL END ),2) AS COL8,
          
          
          
           SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('031') THEN  D.COL1 ELSE NULL END ) AS COL9,
          
          
          SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('031') THEN  D.COL2 ELSE NULL END ) AS COL10,
          
          ROUND(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('031') THEN  D.COL2 ELSE NULL END ) /
          
          SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('031') THEN  D.COL1 ELSE NULL END ),2) AS COL11
          
          
          
          

          
          
              
        FROM DATA_ALL_GC D 
                 
                 
                 
                 
                        INNER JOIN CIS2.MD_RIND MR  ON (MR.ID_MD =  D.ID_MD)
                        
                
                        
          
               INNER JOIN REG_UNIT_GC RN
                ON     D.UNIT_CODE = RN.UNIT_CODE
                AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                AND D.NR_GOSP = RN.NR_GOSP
                AND D.NR_MAPS = RN.NR_MAPS
                
                INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL 
                INNER JOIN CIS2.VW_CL_CUATM CTT ON CT.FULL_CODE LIKE '%'||CTT.CODUL||';%'   
                    

            WHERE 
                        
                    D.PERIOADA IN (:pPERIOADA,  :pPERIOADA -1 ) AND
                  -- (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   MR.CAPITOL IN (417,416)
                   
              --     AND MR.RIND IN ('061')
                   
                   
                   
                   
                   AND CTT.PRGS IN (2)
                   
       --            AND CTT.CODUL IN ('6700000')
                   
                   GROUP BY 
                  CTT.CODUL,
                  CTT.DENUMIRE, 
                  CTT.FULL_CODE
                  
                  ORDER BY 
                  CTT.FULL_CODE
                
       
         ) A