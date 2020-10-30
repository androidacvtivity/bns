--        SELECT 
--        
--        
--        SUM(COL2) AS COL1
--        
--        FROM
--
--
--
--      (

          SELECT 
          
          RN.UNIT_CODE,
       --   MR.RIND,
          
          
          SUM(CASE WHEN   MR.CAPITOL IN (417) AND MR.RIND IN ('115') THEN  D.COL2 ELSE NULL END )  AS COL1,
          SUM(CASE WHEN   MR.CAPITOL IN (417) AND MR.RIND IN ('010') THEN  D.COL2 ELSE NULL END ) AS COL2,
          SUM(CASE WHEN   MR.CAPITOL IN (417) AND MR.RIND IN ('020') THEN  D.COL2 ELSE NULL END ) AS COL3,
          SUM(CASE WHEN   MR.CAPITOL IN (417) AND MR.RIND IN ('035') THEN  D.COL2 ELSE NULL END ) AS COL4,
          SUM(CASE WHEN   MR.CAPITOL IN (417) AND MR.RIND IN ('065') THEN  D.COL2 ELSE NULL END ) AS COL5,
          SUM(CASE WHEN   MR.CAPITOL IN (417) AND MR.RIND IN ('100') THEN  D.COL2 ELSE NULL END ) AS COL6,
          
          SUM(CASE WHEN   MR.CAPITOL IN (417) AND MR.RIND IN ('100','065','020','035','065') THEN  D.COL2 ELSE NULL END ) AS TOTAL
          
          
          
          
          
          
          

          
          
              
        FROM DATA_ALL_GC D 
                 
                 
                 
                 
                        INNER JOIN CIS2.MD_RIND MR  ON (MR.ID_MD =  D.ID_MD)
                        
                
                        
          
               INNER JOIN REG_UNIT_GC RN
                ON     D.UNIT_CODE = RN.UNIT_CODE
                AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                AND D.NR_GOSP = RN.NR_GOSP
                AND D.NR_MAPS = RN.NR_MAPS
                
                INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL 
            --    INNER JOIN CIS2.VW_CL_CUATM CTT ON CT.FULL_CODE LIKE '%'||CTT.CODUL||';%'   
                    

            WHERE 
                        
                --    D.PERIOADA IN (:pPERIOADA,  :pPERIOADA -1 ) AND
                   (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   MR.CAPITOL IN (417)
                   
               --    AND MR.RIND IN ('115')
                   
                   GROUP BY 
                   RN.UNIT_CODE
              --     MR.RIND,
          
          
        
            HAVING 
            
            
            SUM(CASE WHEN   MR.CAPITOL IN (417) AND MR.RIND IN ('100','065','020','035','065') THEN  NVAL(D.COL2) ELSE 0  END ) <> 
            
            SUM(CASE WHEN   MR.CAPITOL IN (417) AND MR.RIND IN ('115') THEN  NVAL(D.COL2) ELSE 0  END )        
                   
          
          
          
                   
                   
                   
              