






        SELECT 
        
            D.UNIT_CODE,
         --   D.RIND,
            COUNT (D.UNIT_CODE) AS CNT
            --SUBSTR (D.UNIT_CODE||D.RIND,2,7 ) AS CNT

     FROM CIS2.VW_DATA_ALL_GC D 
     
     
         WHERE 
                        
               
                   (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                 --  (D.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   D.CAPITOL IN (419)
                   
                   AND  D.RIND IN ('TIP2','TIP3') 
                   
                   
                   
                   
                   
                   GROUP BY 
                   
                     D.UNIT_CODE
                  --   D.RIND
            
                  
                   
                   
                   
                   
                   
                   HAVING 
                   
                  
                   
                 COUNT ( D.UNIT_CODE) =  1
                   
                   ORDER BY 
                   
                   D.UNIT_CODE