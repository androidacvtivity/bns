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
          A.DENUMIRE NUME_ROW,
          A.COL2 AS COL1,
          A.COL3 AS COL2
        
          FROM   

          (  
          SELECT 
          
          CTT.CODUL,
          CTT.DENUMIRE,
          SUM(CASE WHEN  MR.RIND IN ('030') THEN  D.COL2 ELSE NULL END  ) AS COL1,
          
          SUM(CASE WHEN  MR.RIND IN ('032') THEN  D.COL2 ELSE NULL END  ) AS COL2,
          SUM(CASE WHEN  MR.RIND IN ('030') THEN  D.COL2 ELSE NULL  END ) /  
          NOZERO(SUM(CASE WHEN  MR.RIND IN ('032') THEN  D.COL2 ELSE NULL END ))  AS COL3
          
          
          
          
              
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
                        
               
                   (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   MR.CAPITOL IN (417)
                   
                
                   
                   
                   
                   
                   AND CTT.PRGS IN (2)
                   
       --            AND CTT.CODUL IN ('6700000')
                   
                   GROUP BY 
                  CTT.CODUL,
                  CTT.DENUMIRE, 
                  CTT.FULL_CODE
                  
                  ORDER BY 
                  CTT.FULL_CODE
                  
                  ) A 