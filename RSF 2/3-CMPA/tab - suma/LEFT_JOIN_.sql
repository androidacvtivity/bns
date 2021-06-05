
             SELECT 
             
             
             L.UNIT_CODE UNIT_CODE_L,
             R.UNIT_CODE UNIT_CODE_R    
            
              FROM

            (
            
            SELECT 
              D.UNIT_CODE,
          
              SUM(D.COL1) COL1  
              
              
                FROM CIS2.VW_DATA_ALL_GC D
                
                WHERE
            --  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND 
             
             (D.PERIOADA IN (:pPERIOADA))  AND   
             (D.FORM =:pFORM) AND
             (D.FORM_VERS =:pFORM_VERS) AND 
             (:pID_MDTABLE =:pID_MDTABLE) AND 
             (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
              D.FORM IN (62)  AND
              D.CAPITOL IN (1118)  
              AND D.RIND NOT IN ('0', 'TIP2','TIP3','CA','-')
              
              GROUP BY 
                 D.UNIT_CODE
                 
                 
                 
              ) L LEFT JOIN (
                

 SELECT 

              DISTINCT  D.UNIT_CODE,
         
              SUM(D.COL1) COL1  
              
              
                FROM CIS2.VW_DATA_ALL_GC D
                
                WHERE
           --  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND 
             (D.PERIOADA IN (:pPERIOADA))  AND   
             
             (D.FORM =:pFORM) AND
             (D.FORM_VERS =:pFORM_VERS) AND 
             (:pID_MDTABLE =:pID_MDTABLE) AND 
             (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
              D.FORM IN (62)  AND
              D.CAPITOL NOT  IN (1118)  
             
             AND   D.UNIT_CODE = 686643
              GROUP BY 
           
              D.UNIT_CODE

              
              ORDER BY
              
           
             D.UNIT_CODE
             
             
                 
                 ) R ON R.UNIT_CODE = L.UNIT_CODE 
                 
                 WHERE
                 
                 R.UNIT_CODE IS NOT NULL 