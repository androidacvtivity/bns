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

             R.RIND AS NR_ROW,
             R.ORDINE AS ORDINE,
             '11111111111' AS DECIMAL_POS,
             R.DENUMIRE AS NUME_ROW,
             ---------------------------------------------------------------------------------------------------------------------------
             SUM(CASE WHEN MR.RIND = R.RIND  THEN CIS2.NVAL(D.COL1) ELSE 0 END) AS COL1,
             -----------------------------------------------------------------------------------------------------------------------
             SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (12,13) THEN CIS2.NVAL(D.COL1) ELSE NULL END) AS COL2,
            -----------------------------------------------------------------------------------------------------------------------------
             ROUND(((SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (12,13) THEN CIS2.NVAL(D.COL1) ELSE 0 END)  /
             CIS2.NOZERO(SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (12,13) THEN CIS2.NVAL(D.COL3) ELSE 0 END))) / P.COL1) * 100,1) AS COL3,
             
            -----------------------------------------------------------------------------------------------------------------------------
             
             SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (15,16,17,18,19) THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL END) AS COL4,
             
             ----------------------------------------------------------------------------------------------------------
             
             ROUND(((SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (15,16,17,18,19) THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE 0 END)  /
             CIS2.NOZERO(SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (15,16,17,18,19) THEN CIS2.NVAL(D.COL3)+CIS2.NVAL(D.COL4) ELSE 0 END))) / P.COL1) * 100,1) AS COL5,
             
             -------------------------------------------------------------
             
             SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (20) THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL END) AS COL6,
             -------------------------------------------------------------------------------------------------------------
             
             ROUND(((SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (20) THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE 0 END)  /
             CIS2.NOZERO(SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (20) THEN CIS2.NVAL(D.COL3)+CIS2.NVAL(D.COL4) ELSE 0 END))) / P.COL1) * 100,1) AS COL7,
             -----------------------------------------------
             
             SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (24,26) THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL END) AS COL8,
             
             ---------------------------------------------------------------------------------------------------------------------
             
             ROUND(((SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (24,26)  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE 0 END)  /
             CIS2.NOZERO(SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (24,26)  THEN CIS2.NVAL(D.COL3)+CIS2.NVAL(D.COL4) ELSE 0 END))) / P.COL1) * 100,1) AS COL9,
             --------------------------------------------------------------------------------------------------------------------------
             
             SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (28) THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE NULL END) AS COL10,
             -----------------------------------------------------------------------------------------
             ROUND(((SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (28)  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE 0 END)  /
             CIS2.NOZERO(SUM(CASE WHEN MR.RIND = R.RIND  AND RR.CFP IN (28)  THEN CIS2.NVAL(D.COL3)+CIS2.NVAL(D.COL4) ELSE 0 END))) / P.COL1) * 100,1) AS COL11
             --------------------------------------------------------------------------------------------------------------------------
             
             
            FROM CIS2.DATA_ALL D
                       INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
                       INNER JOIN CIS2.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                       INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = RR.CUATM
                       INNER JOIN CIS2.VW_CL_CFP CF ON CF.CODUL = RR.CFP
            -------------------------------------------------------------------------------------
            CROSS JOIN (
                           SELECT
                             DENUMIRE,
                             RIND,
                             ORDINE
  
                           FROM  CIS2.MD_RIND
  
    WHERE
    
     CAPITOL = 323 AND
     RIND_VERS >= 2006 AND
     STATUT = '1' 
      
     AND RIND IN ('100','200','210','220','230','240','300','400','460','500','600','700','710','720','810','820','830','840','850','860','870','880','890') 
      
  
     ) R            
            -------------------------------------------------------------------------------------
            
            CROSS JOIN (
     
          SELECT 
                  
                    SUM(CASE WHEN MR.RIND IN ('01') THEN   D.COL1 ELSE NULL END)  AS COL1
                  
                     FROM CIS2.DATA_ALL D
                
                       INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
                       INNER JOIN CIS2.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                 
                     WHERE 
                     D.FORM=100 AND
                     D.PERIOADA IN :pPERIOADA AND
                     MR.CAPITOL = 330 AND   
                     D.CUIIO = 2 
                   
     ) P
            
            ------------------------------------------------------------------------------------           
                       
                       
                        WHERE 
                
           (D.FORM=:pFORM) AND
           (D.FORM_VERS=:pFORM_VERS) AND
           (:pID_MDTABLE=:pID_MDTABLE) AND
           (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND   
           D.PERIOADA IN :pPERIOADA AND
           D.FORM = 8 AND
           MR.CAPITOL = 323
           
           
           GROUP BY
           R.DENUMIRE,
           R.RIND,
           R.ORDINE,
           P.COL1