--INSERT INTO TABLE_OUT 
--(
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
-- COL1, COL2, COL3,COL4,COL5,COL6
--)


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
              '00000000001' AS DECIMAL_POS,
                REPLACE(DENUaMIRE,'R-UL ') AS NUME_ROW,
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
                  ROUND((D.COL11 / P.COL1) * 100,1) AS COL11 
                
               
               
                        
               
                  FROM

           ( 
            
            SELECT 


             CC.FULL_CODE,
             CC.DENUMIRE,
             CC.CODUL,
            
             ---------------------------------------------------------------------------------------------------------------------------
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('100')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL1,
             
              SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('810')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL2,
             
              SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('820')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL3,
             ---------------------------------------------------------------------------------
              SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('830')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL4,
             
              SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('840')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL5,
             
              SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('850')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL6,
           
           
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('860')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL7,
             
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('870')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL8,
             
             
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('880')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL9,
             
             
             SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)  AND MR.RIND IN ('890')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL  END) AS COL10,
             
            -----------------------------------------------------------------------------------------------------------------------------
              SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA)   AND MR.RIND IN ('100')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE 0 END)  /
             CIS2.NOZERO(SUM(CASE WHEN D.PERIOADA IN (:pPERIOADA-1)   AND MR.RIND IN ('100')  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE 0 END)) AS COL11
             
             
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
     