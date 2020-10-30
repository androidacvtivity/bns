--INSERT INTO TABLE_OUT_TEST
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
-- COL1, COL2, COL3
--)
SELECT
--  :pPERIOADA AS PERIOADA,
--  :pFORM AS FORM,
--  :pFORM_VERS AS FORM_VERS,
--  :pID_MDTABLE AS ID_MDTABLE,
--  :pCOD_CUATM AS COD_CUATM,    
--   CC.CODUL AS NR_SECTIE,
--   CC.DENUMIRE AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   R.RIND AS NR_ROW,
   R.ORDINE AS ORDINE,
  '000' AS DECIMAL_POS,
   R.DENUMIRE AS NUME_ROW,
    
  
   SUM(CASE WHEN R.RIND = D.RIND  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE 0 END) AS COL1,
  
   
  
   ROUND((((SUM(CASE WHEN R.RIND =  D.RIND  THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE 0 END)) / 
   
       CIS2.NOZERO(SUM(CASE WHEN R.RIND =  D.RIND  THEN CIS2.NVAL(D.COL3) + CIS2.NVAL(D.COL4) ELSE 0 END) ))/  
      (P.COL1))*100,1) AS COL2,
    
    
    
  CASE WHEN R.RIND IN '100' THEN 100 ELSE
 
  ROUND(((
          
         SUM(CASE WHEN R.RIND =  D.RIND  THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE 0 END)
          
          
          )*100)/  
         (
          
          SUM(CASE WHEN D.RIND IN '100' THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2) ELSE 0 END)
          
          
          
          ),1) END AS COL3
FROM 
  CIS2.VW_DATA_ALL D


CROSS JOIN (
    SELECT
      DENUMIRE,
      RIND,
      ORDINE
  
    FROM 
     CIS2.MD_RIND
  
   WHERE
     
     RIND  IN ('100','200','210','220','230','240','300','400','460','500','600','700','710','720','810','820','830','840','850','860','870','880','890') 
     AND CAPITOL = 323 AND
     RIND_VERS >= 2006 AND
     STATUT = 1  ) R
     
CROSS JOIN (
    
    
              SELECT 
                  
                   SUM(D.COL1)  AS COL1
                   
                     
                   
                     FROM CIS2.DATA_ALL D
                
                       INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
                       INNER JOIN CIS2.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                 
                     WHERE 
                     D.FORM=100 AND
                     D.PERIOADA IN :pPERIOADA AND
                     MR.CAPITOL = 330 AND   
                     D.CUIIO = 2 
                     AND MR.RIND IN ('01')
  

  ) P
     
  
                     INNER JOIN CIS2.VW_CL_CFP C ON D.CFP = C.CODUL
                     INNER JOIN CIS2.VW_CL_CFP CC ON C.FULL_CODE LIKE '%'||CC.CODUL||';%'
WHERE
 (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
 (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND   
  D.PERIOADA IN :pPERIOADA AND
  D.FORM = 8 AND
  D.CAPITOL = 323 
  --AND
 -- D.RIND  IN ('100','200','210','220','230','240','300','400','460','500','600','700','710','720','810','820','830','840','850','860','870','880','890')  
  AND CC.CODUL IN ('00')
  
GROUP BY
  CC.CODUL,
  CC.DENUMIRE,
  R.DENUMIRE,
  R.RIND,
  R.ORDINE,
  P.COL1
  
ORDER BY
  R.ORDINE