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
-- COL1, COL2, COL3,COL4,COL5,COL6,COL7,COL8, COL9
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
                  D.NR_ROW,
                  D.ORDINE,
                   '000000000' AS DECIMAL_POS,
                  D.NUME_ROW,
                  
                  
                  D.COL1,
                  D.COL2,
                  D.COL3,
                  D.COL4,
                  D.COL5,
                  D.COL6,
                  
                  CASE 
               
               
               WHEN 
                   D.NR_ROW  NOT IN ('410','420','430','440','441','450','-')
               
               THEN
               ROUND((D.COL7 / 1.043) * 100,1)
               
               
               WHEN D.NR_ROW IN ('410','420','430') 
               
               THEN
               
               ROUND((D.COL7 / 0.973) * 100,1)
               
               
               WHEN D.NR_ROW IN ('441','440','450')
               
               THEN
               
               ROUND((D.COL7 / 1.091) * 100,1)
               
               
              
               
               ELSE NULL
               
               END AS COL7,
               
               
               
               CASE 
               
               
               WHEN 
                   D.NR_ROW  NOT IN ('410','420','430','440','441','450','-')
               
               THEN
               ROUND((D.COL8 / 1.043) * 100,1)
               
               
               WHEN D.NR_ROW IN ('410','420','430') 
               
               THEN
               
               ROUND((D.COL8 / 0.973) * 100,1)
               
               
               WHEN D.NR_ROW IN ('441','440','450')
               
               THEN
               
               ROUND((D.COL8 / 1.091) * 100,1)
           
               ELSE NULL
               
               END AS COL8,
               
               CASE 
               
               
               WHEN 
                   D.NR_ROW  NOT IN ('410','420','430','440','441','450','-')
               
               THEN
               ROUND((D.COL9 / 1.043) * 100,1)
               
               
               WHEN D.NR_ROW IN ('410','420','430') 
               
               THEN
               
               ROUND((D.COL9 / 0.973) * 100,1)
               
               
               WHEN D.NR_ROW IN ('441','440','450')
               
               THEN
               
               ROUND((D.COL9 / 1.091) * 100,1)
               
               
               ELSE NULL
               
               END AS COL9
               
               
               
               
               
                  FROM 

(
SELECT 
             R.RIND AS NR_ROW,
             R.ORDINE AS ORDINE,
         
             R.DENUMIRE AS NUME_ROW,

SUM(CASE WHEN D.PERIOADA IN :pPERIOADA AND  R.RIND =  MR.RIND THEN NVAL(D.COL1) + NVAL(D.COL2) ELSE 0 END) AS COL1,
SUM(CASE WHEN D.PERIOADA IN :pPERIOADA AND  R.RIND =  MR.RIND THEN D.COL1 ELSE 0 END) AS COL2,
SUM(CASE WHEN D.PERIOADA IN :pPERIOADA AND  R.RIND =  MR.RIND THEN D.COL2 ELSE 0 END) AS COL3,
SUM(CASE WHEN D.PERIOADA IN :pPERIOADA - 4 AND  R.RIND =  MR.RIND THEN NVAL(D.COL1) + NVAL(D.COL2) ELSE 0 END) AS COL4,



  
SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-4 AND  R.RIND =  MR.RIND THEN D.COL1 ELSE 0 END) AS COL5,
  
SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-4 AND  R.RIND =  MR.RIND THEN D.COL2 ELSE 0 END) AS COL6,


SUM(CASE WHEN D.PERIOADA IN :pPERIOADA AND  R.RIND =  MR.RIND THEN NVAL(D.COL1) + NVAL(D.COL2) ELSE 0 END)  /
 CIS.NOZERO(SUM(CASE WHEN D.PERIOADA IN :pPERIOADA - 4 AND  MR.RIND =  R.RIND THEN NVAL(D.COL1) + NVAL(D.COL2) ELSE 0 END)) AS COL7,
 NULL AS COL8,
 NULL AS COL9
  

             
             

FROM 
  CIS.DATA_ALL D
   INNER JOIN CIS.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
   INNER JOIN CIS.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
   INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = RR.CUATM
  CROSS JOIN (
  SELECT   
    
     DENUMIRE,
     RIND,
     ORDINE
    FROM 
     CIS.MD_RIND
  
   WHERE
     CAPITOL = 31 AND    
      RIND NOT IN ('-') AND
      RIND_VERS =  1040 AND
      STATUT = '1'  
    
      ) R     
      
           
WHERE
 (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
 (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND   
  D.PERIOADA IN (:pPERIOADA, :pPERIOADA-4) AND
  D.FORM = 6 AND
  MR.CAPITOL = 31
  GROUP BY
    R.DENUMIRE,
    R.RIND,
    R.ORDINE 
    
    
  UNION 
  
  SELECT 
             R.RIND AS NR_ROW,
             R.ORDINE AS ORDINE,
         
             R.DENUMIRE AS NUME_ROW,

NULL AS COL1,
NULL AS COL2,
NULL AS COL3,
NULL AS COL4,
NULL AS COL5,
NULL AS COL6,
NULL AS COL7,
 
SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND R.RIND =  MR.RIND THEN D.COL1 ELSE 0 END)/
   
  NOZERO(SUM(CASE WHEN D.PERIOADA BETWEEN (FLOOR(:pPERIOADA/4)*4)-4 AND :pPERIOADA-4 AND R.RIND =  MR.RIND THEN D.COL1 ELSE 0 END)) AS COL8,
  
  
  SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND R.RIND =  MR.RIND THEN D.COL2 ELSE 0 END)/
   
  NOZERO(SUM(CASE WHEN D.PERIOADA BETWEEN (FLOOR(:pPERIOADA/4)*4)-4 AND :pPERIOADA-4 AND R.RIND =  MR.RIND THEN D.COL2 ELSE 0 END)) AS COL9

FROM 
  CIS.DATA_ALL D
   INNER JOIN CIS.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
   INNER JOIN CIS.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
   INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = RR.CUATM
  CROSS JOIN (
  SELECT   
    
     DENUMIRE,
     RIND,
     ORDINE
    FROM 
     CIS.MD_RIND
  
   WHERE
     CAPITOL = 31 AND    
      RIND NOT IN ('-') AND
      RIND_VERS =  1040 AND
      STATUT = '1'  
    
      ) R     
      
           
WHERE
 (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
 (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND   
  (
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)
  OR 
  (D.PERIOADA BETWEEN (FLOOR(:pPERIOADA/4)*4)-4 AND :pPERIOADA-4)
  )
  
  
  
  
  AND
  D.FORM = 6 AND
  MR.CAPITOL = 31
  GROUP BY
    R.DENUMIRE,
    R.RIND,
    R.ORDINE 
  
      ) D 
    
    