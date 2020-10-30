


         SELECT 
--               :pPERIOADA AS PERIOADA,
--               :pFORM AS FORM,
--               :pFORM_VERS AS FORM_VERS,
--               :pID_MDTABLE AS ID_MDTABLE,
--               :pCOD_CUATM AS COD_CUATM,    
--               '0' AS NR_SECTIE,
--               '0' AS NUME_SECTIE,
--               '0' AS NR_SECTIE1,
--               '0' AS NUME_SECTIE1,
--               '0' AS NR_SECTIE2,
--               '0' AS NUME_SECTIE2, 
             D.CODUL||'~'||ROWNUM AS NR_ROW,
   ROWNUM AS ORDINE,
  '1111' AS DECIMAL_POS,
   D.DENUMIRE AS NUME_ROW,
                  D.COL1,
                  D.COL2,
                 
                  ROUND((D.COL3 / P.COL1) * 100,1) AS COL3,
                  
                  NULL COL4
                
               
               
                        
               
                  FROM

           ( 
            
            SELECT 


             CC.FULL_CODE,
             CC.DENUMIRE,
             CC.CODUL,
            
             ---------------------------------------------------------------------------------------------------------------------------
             ---------------------------------------------------------------------------------------------------------------------------
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN  ('100')   THEN CIS.NVAL(D.COL1)+CIS.NVAL(D.COL2) ELSE NULL  END) AS COL1,
             
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND MR.RIND IN  ('100')   THEN CIS.NVAL(D.COL3)+CIS.NVAL(D.COL4)   ELSE NULL  END) AS COL2,
             
            
              SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN  ('100')    THEN CIS.NVAL(D.COL1)+CIS.NVAL(D.COL2) ELSE 0 END)  /
              CIS.NOZERO(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA) AND MR.RIND IN  ('100')   THEN CIS.NVAL(D.COL3)+CIS.NVAL(D.COL4)   ELSE NULL  END)) AS COL3
             
             
            FROM CIS.DATA_ALL D
                       INNER JOIN CIS.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
                       INNER JOIN CIS.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                       INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = RR.CUATM
                       
                      INNER JOIN CIS.VW_CL_CAEM2 CA ON (RR.CAEM2=CA.CODUL)
                      INNER JOIN CIS.VW_CL_CAEM2 CC ON (CA.FULL_CODE LIKE '%'||CC.CODUL||';%')
                      
            
                       
                       
                        WHERE 
                
           (D.FORM=:pFORM) AND
           (D.FORM_VERS=:pFORM_VERS) AND
           (:pID_MDTABLE=:pID_MDTABLE) AND
           (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND   
       
           (D.PERIOADA IN (:pPERIOADA)) AND 
           D.FORM = 6 AND
           MR.CAPITOL = 31
          
           AND MR.RIND IN  ('100')
           
           
           AND
  (CC.CODUL LIKE '%00' OR CC.CODUL LIKE 'C10%0' OR CC.CODUL LIKE 'D%0' OR CC.CODUL LIKE 'A01%0')
           
           
           GROUP BY
         
             CC.FULL_CODE,
             CC.DENUMIRE,
             CC.CODUL
        
           ) D 
           
           CROSS JOIN (
     
          SELECT 
                  
                   SUM(CASE WHEN MR.RIND IN ('04') THEN   D.COL1 ELSE NULL END)  AS COL1
                  
                     FROM CIS.DATA_ALL D
                
                       INNER JOIN CIS.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
                   
                 
                     WHERE 
                     D.FORM=100 AND
                     D.PERIOADA = 386 AND
                     MR.CAPITOL = 37 AND   
                     D.CUIIO = 4
     ) P