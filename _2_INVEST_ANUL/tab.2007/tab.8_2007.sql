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
               CODUL AS NR_ROW,
               ROWNUM AS ORDINE,
               '1111111111' AS DECIMAL_POS,
                REPLACE(DENUMIRE,'R-UL ') AS NUME_ROW,
                  D.COL1,
                  D.COL2,
                  D.COL3,    
                  D.COL4,
                  D.COL5,
                  D.COL6,
                  D.COL7,
                  D.COL8,
                  D.COL9,
                  D.COL10,
                  D.COL11,
                  ROUND((D.COL12 / P.COL1) * 100,1) AS COL10 
                
               
               
                        
               
                  FROM

           ( 
            
            SELECT 


             CC.FULL_CODE,
             CC.DENUMIRE,
             CC.CODUL,
            
             ---------------------------------------------------------------------------------------------------------------------------
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('300')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL1,
             
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('400')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL2,
             
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('410')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL3,
             ---------------------------------------------------------------------------------
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('420')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL4,
             
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('430')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL5,
             
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('440')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL6,
             ---------------------------------------------------------------------------------
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('450')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL7,
             
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('460')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL8,
             
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('500')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL9,
             
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('600')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL10,
             
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('700')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL11,
             
            -----------------------------------------------------------------------------------------------------------------------------
              SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)   AND MR.RIND IN ('300')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE 0 END)  /
             CIS2.NOZERO(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1)   AND MR.RIND IN ('300')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE 0 END)) AS COL12
             
             
            FROM CIS2.DATA_ALL D
                       INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
                       INNER JOIN CIS2.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                       INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = RR.CUATM
                       
                       INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL||';%')
                       INNER JOIN CIS2.VW_CL_CFP CF ON CF.CODUL = RR.CFP
            -------------------------------------------------------------------------------------
           
            ------------------------------------------------------------------------------------           
                       
                       
                        WHERE 
                
           (D.FORM=:pFORM) AND
           (D.FORM_VERS=:pFORM_VERS) AND
           (:pID_MDTABLE=:pID_MDTABLE) AND
           (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND   
          -- D.PERIOADA IN :pPERIOADA AND
           (D.PERIOADA IN (:pPERIOADA , :pPERIOADA-1)) AND 
           D.FORM = 8 AND
           MR.CAPITOL = 323
           
           AND CC.PRGS IN 2
           
           
           GROUP BY
         
             CC.FULL_CODE,
             CC.DENUMIRE,
             CC.CODUL
        
           ) D 
           
           CROSS JOIN (
     
          SELECT 
                  
                   SUM(CASE WHEN MR.RIND IN ('01') THEN   D.COL1 ELSE NULL END)  AS COL1,
                   SUM(CASE WHEN MR.RIND IN ('02') THEN   D.COL1 ELSE NULL END)  AS COL2,
                   SUM(CASE WHEN MR.RIND IN ('03') THEN   D.COL1 ELSE NULL END)  AS COL3,
                   SUM(CASE WHEN MR.RIND IN ('04') THEN   D.COL1 ELSE NULL END)  AS COL4  
                     FROM CIS2.DATA_ALL D
                
                       INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
                       INNER JOIN CIS2.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                 
                     WHERE 
                     D.FORM=100 AND
                     D.PERIOADA IN :pPERIOADA AND
                     MR.CAPITOL = 330 AND   
                     D.CUIIO = 2 
                   
     ) P