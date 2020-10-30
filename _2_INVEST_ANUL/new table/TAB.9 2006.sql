SELECT 
                 
--               :pPERIOADA AS PERIOADA,
--               :pFORM AS FORM,
--               :pFORM_VERS AS FORM_VERS,
--               :pID_MDTABLE AS ID_MDTABLE,
--             
--               :pCOD_CUATM AS COD_CUATM,    
--               '0' AS NR_SECTIE,
--               '0' AS NUME_SECTIE,
--               '0' AS NR_SECTIE1,
--               '0' AS NUME_SECTIE1,
--               '0' AS NR_SECTIE2,
--               '0' AS NUME_SECTIE2,
                  D.NR_ROW,
                  D.ORDINE,
                  '0000001' AS DECIMAL_POS,
                  D.NUME_ROW,
                  D.COL1,
                  D.COL2,
                  D.COL3,
                  D.COL4,
                  D.COL5,
                  D.COL6,
                  
               CASE 
               
               
               WHEN D.NR_ROW IN ('100','200','210','220','230','240','300','400','460','500','600','700','710','720','810','820','830','840','850','860','870','880','890') 
               
               THEN
               ROUND((D.COL7 / P.COL1) * 100,1)
               
               
               WHEN D.NR_ROW IN ('410','420','430') 
               
               THEN
               ROUND((D.COL7 / P.COL2) * 100,1)
               
               
               WHEN D.NR_ROW IN ('440')
               
               THEN
               
               ROUND((D.COL7 / P.COL3) * 100,1)
               
               
               WHEN D.NR_ROW IN ('441','442','450')
               
               THEN
               
               ROUND((D.COL7 / P.COL4) * 100,1)
               
               ELSE NULL
               
               END AS COL7  
               
                  
                  
                 FROM  
                
                (            
                SELECT  
                R.RIND  AS NR_ROW,
                R.ORDINE AS ORDINE,
                R.DENUMIRE AS NUME_ROW,
                SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2)  ELSE NULL END) AS COL1,
                SUM(CASE WHEN R.RIND =  MR.RIND THEN  D.COL1   ELSE NULL END) AS COL2,
                SUM(CASE WHEN R.RIND =  MR.RIND THEN  D.COL2   ELSE NULL END) AS COL3,
                SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL3) + CIS2.NVAL(D.COL4)  ELSE NULL END) AS COL4,
                SUM(CASE WHEN R.RIND =  MR.RIND THEN  D.COL3   ELSE NULL END) AS COL5,
                SUM(CASE WHEN R.RIND =  MR.RIND THEN  D.COL4   ELSE NULL END) AS COL6,
                      
               ((SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2)  ELSE NULL END)  /
               CIS2.NOZERO(SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL3) + CIS2.NVAL(D.COL4)  ELSE NULL END))) )   AS COL7
                
               
                
               FROM CIS2.DATA_ALL D
                      INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
                       INNER JOIN CIS2.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                       INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = RR.CUATM
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
     -- AND 
   --  RIND NOT IN ('440','441','442','450','-')      
      
  
     ) R     
     
     
                 
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
          R.ORDINE
          
         
          )  D        
      
            
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
     
    
     ORDER BY 
      D.ORDINE