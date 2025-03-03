﻿DECLARE

  CURSOR C IS

-- FINAL SELECT ===============================================================
SELECT 
    DF.PERIOADA,
    DF.FORM,
    DF.FORM_VERS,
    DF.ID_MDTABLE,
    DF.COD_CUATM,
    DF.NR_SECTIE,
    DF.NUME_SECTIE,
    DF.NR_SECTIE1,
    DF.NUME_SECTIE1,
    DF.NR_SECTIE2,
    DF.NUME_SECTIE2,
    DF.NR_ROW,
    DF.ORDINE,
    DF.DECIMAL_POS,
    DF.NUME_ROW,
    DF.COL1,
    DF.COL2,
    DF.COL3,
    DF.COL4,
    DF.COL5,
    DF.COL6,
    DF.COL7,
    DF.COL8,
    DF.COL9,
    DF.COL10    
FROM 
(
---ORDER SELECT 
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
 B.RIND AS NR_ROW,
 B.RIND AS ORDINE,
'0000000000' AS DECIMAL_POS, 
 B.DENUMIRE AS NUME_ROW,
      A.COL1,
      A.COL2,
      A.COL3,
      A.COL4,
      A.COL5,
      A.COL6,
      A.COL7,
      A.COL8,
      A.COL9,
      A.COL10 
     
FROM
(
SELECT
  R.RIND,
  R.RIND_VERS,
  R.DENUMIRE,
     CIS2.NVAL(SUM(COL1))  AS COL1,
     CIS2.NVAL(SUM(COL2))  AS COL2,
     CIS2.NVAL(SUM(COL3))  AS COL3,
     CIS2.NVAL(SUM(COL4))  AS COL4,
     CIS2.NVAL(SUM(COL5))  AS COL5,
     CIS2.NVAL(SUM(COL6))  AS COL6,
     CIS2.NVAL(SUM(COL7))  AS COL7,
     CIS2.NVAL(SUM(COL8))  AS COL8,
     CIS2.NVAL(SUM(COL9))  AS COL9,
     CIS2.NVAL(SUM(COL10)) AS COL10 
    
FROM
  CIS2.VW_DATA_ALL D
  INNER JOIN CIS2.MD_RIND R ON (R.RIND = D.RIND AND R.CAPITOL=D.CAPITOL AND R.CAPITOL_VERS=D.CAPITOL_VERS AND R.RIND_VERS=D.RIND_VERS
                                       AND   R.FORM=D.FORM) 
 
  
    WHERE
    (D.PERIOADA =:pPERIOADA) AND    
    (R.FORM =:pFORM) AND 
    (R.FORM_VERS =:pFORM_VERS) AND
    (:pID_MDTABLE=:pID_MDTABLE) AND 
    (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
    R.FORM = 17  AND 
    R.CAPITOL IN (1001)  
    AND  ASCII(R.RIND) <> 45 
    
   
  
  GROUP BY 
  R.RIND,
  R.RIND_VERS,
  R.DENUMIRE
  
  
  ) A
RIGHT JOIN
(
SELECT
  R.RIND,
  R.RIND_VERS,
  R.DENUMIRE
  
FROM
  CIS2.MD_RIND R,CIS2.VW_DATA_ALL D
  

  
  WHERE
    (D.PERIOADA =:pPERIOADA) AND    
    (R.FORM =:pFORM) AND 
    (R.FORM_VERS =:pFORM_VERS) AND
    (:pID_MDTABLE=:pID_MDTABLE) AND 
    (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
    R.FORM = 17  AND 
    R.CAPITOL IN (1001) AND 
    ASCII(R.RIND) <> 45 

  
  
  GROUP BY 
  R.RIND,
  R.RIND_VERS,
  R.DENUMIRE
  
  
  
  
  ) B ON (  A.RIND=B.RIND
            AND A.RIND_VERS=B.RIND_VERS
  )
  
 
  ORDER BY 
  B.RIND
  ) DF
   ;
   
   
   BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO TABLE_OUT_TEST
    (
      --CIS2.TABLE_OUT
    
      PERIOADA,
      FORM,
      FORM_VERS,
      ID_MDTABLE,
      COD_CUATM,
      NR_SECTIE,
      NUME_SECTIE,
      NR_SECTIE1,
      NUME_SECTIE1,
      NR_SECTIE2,
      NUME_SECTIE2,
      NR_ROW,
      ORDINE,
      DECIMAL_POS,
      NUME_ROW,
       
      COL1, COL2, COL3,  COL4, COL5, COL6, COL7, COL8, COL9, COL10
    )
    VALUES
    (
      CR.PERIOADA,
      CR.FORM,
      CR.FORM_VERS,
      CR.ID_MDTABLE,
      CR.COD_CUATM,
      CR.NR_SECTIE,
      CR.NUME_SECTIE,
      CR.NR_SECTIE1,
      CR.NUME_SECTIE1,
      CR.NR_SECTIE2,
      CR.NUME_SECTIE2,
      CR.NR_ROW,
      CR.ORDINE,
      CR.DECIMAL_POS,
      CR.NUME_ROW,
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8, CR.COL9, CR.COL10
    );
  END LOOP;
END;