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
     ROUND(A.COL1,0) ||'~'||ROWNUM AS NR_ROW, 
     ROWNUM ORDINE,
     '2002002002' AS DECIMAL_POS,                 
          A.DENUMIRE NUME_ROW,
          ROUND(A.COL2,2) AS COL1,
          ROUND(A.COL3,0) AS COL2 ,
          ROUND(A.COL4,0) AS COL3,
          ROUND(A.COL5,2) AS COL4,
          ROUND(A.COL6,0) AS COL5,
          ROUND(A.COL7,0) AS COL6,
          ROUND(A.COL8,2) AS COL7,
          ROUND(A.COL9,0) AS COL8,
          ROUND(A.COL10,0) AS COL9,
          ROUND(A.COL11,2) AS COL10
           
          FROM   

          (  
          SELECT 
          
       
          CTT.CODUL,
          CTT.DENUMIRE,
          SUM(CASE WHEN (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)   AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011','031','041') THEN  D.COL2 ELSE NULL END ) AS COL1,
          
--          SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011','031','041') THEN  NVAL(D.COL2) ELSE NULL END) / 
--          NOZERO(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011','031','041') THEN  NVAL(D.COL2) ELSE NULL END )) 
          
          
          NULL AS COL2,
          
          SUM(CASE WHEN  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011') THEN  D.COL1 ELSE NULL END ) AS COL3,
          
          
          SUM(CASE WHEN  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011') THEN  D.COL2 ELSE NULL END ) AS COL4,
          
          ROUND(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011') THEN  D.COL2 ELSE NULL END ) /
          
         SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('011') THEN  D.COL1 ELSE NULL END ),2) AS COL5,
          
          
           SUM(CASE WHEN  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   MR.CAPITOL IN (417) AND MR.RIND IN ('041') THEN  D.COL1 ELSE NULL END ) AS COL6,
          
          
          SUM(CASE WHEN  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   MR.CAPITOL IN (417) AND MR.RIND IN ('041') THEN  D.COL2 ELSE NULL END ) AS COL7,
          
          ROUND(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('041') THEN  D.COL2 ELSE NULL END ) /
          
          SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('041') THEN  D.COL1 ELSE NULL END ),2) AS COL8,
          
          
          
           SUM(CASE WHEN  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   MR.CAPITOL IN (417) AND MR.RIND IN ('031') THEN  D.COL1 ELSE NULL END ) AS COL9,
          
          
          SUM(CASE WHEN  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   MR.CAPITOL IN (417) AND MR.RIND IN ('031') THEN  D.COL2 ELSE NULL END ) AS COL10,
          
          ROUND(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('031') THEN  D.COL2 ELSE NULL END ) /
          
          SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND   MR.CAPITOL IN (417) AND MR.RIND IN ('031') THEN  D.COL1 ELSE NULL END ),2) AS COL11
          
          
          
          

          
          
              
        FROM CIS2.VW_DATA_ALL_GC D 
                 
                 
                 
                 
                        INNER JOIN CIS2.MD_RIND MR  ON (MR.ID_MD =  D.ID_MD)
                        
                
                        
          
                
                INNER  JOIN VW_CL_CUATM CT ON D.CUATM = CT.CODUL 
                INNER JOIN CIS2.VW_CL_CUATM CTT ON CT.FULL_CODE LIKE '%'||CTT.CODUL||';%'   
                    

            WHERE 
                        
                    (D.PERIOADA IN (:pPERIOADA,  :pPERIOADA -1 ) 
                    OR 
                    (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA))  AND
                    
                  
                     
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
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