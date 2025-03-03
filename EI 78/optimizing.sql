﻿DECLARE

  CURSOR C IS

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
    DF.NR_ROW NR_ROW,
    DF.ORDINE,
    DF.DECIMAL_POS,
    DF.NUME_ROW,
    DF.COL1,
    DF.COL2,
    DF.COL3,
    DF.COL4
    
  

   
FROM 
(

     
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
       
     --''||'~'||SSS.ORDINE  AS NR_ROW,
     SSS.CODUL||'~'||SSS.ORDINE  AS NR_ROW,  
     
     SSS.ORDINE  AS ORDINE,  
     
     '1111' AS DECIMAL_POS,
     SSS.DENUMIRE NUME_ROW,
       --SSS.DENUMIRE||'~'||SSS.FULL_CODE NUME_ROW,  
       
      
     ROUND((SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))/1000,1)
    AS COL1,
  
     ROUND((SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END ))/1000,1)
    AS COL2,
    
     ROUND((SUM(CASE WHEN  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))/1000,1)
    AS COL3,
    
   ROUND((SUM(CASE WHEN  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END ))/1000,1)
    AS COL4
     
     
     
          
    FROM
    
     CIS2.VW_DATA_ALL D 
     
    INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 ) 
   INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )   
 
     INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
   
     
  WHERE 
  (D.PERIOADA =:pPERIOADA) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (405,406,407,408)
 
 -- AND SSS.CODUL LIKE '%00000'
  
    
    GROUP BY 
    SSS.CODUL,
    SSS.FULL_CODE,
    SSS.DENUMIRE,
    SSS.ORDINE
    
    ORDER BY 
    
    SSS.FULL_CODE,
    SSS.ORDINE
      ) DF
  
  ;
   
    BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO   USER_BANCU.TABLE_OUT_TEST 
    
   --  CIS2.TABLE_OUT
    (
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
       
      COL1, COL2, COL3,  COL4
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
       
      CR.COL1, CR.COL2, CR.COL3, CR.COL4
    );
  END LOOP;
END;
  
--  