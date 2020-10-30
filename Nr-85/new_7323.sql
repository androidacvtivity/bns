DECLARE

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
 A.RIND AS NR_ROW,
 A.RIND AS ORDINE,
'0000000000' AS DECIMAL_POS, 
 A.DENUMIRE AS NUME_ROW,
              B.COL1,  
              B.COL2,
              B.COL3,
              B.COL4,
              B.COL5,
              B.COL6,
              B.COL7,
              B.COL8,
              B.COL9,
              B.COL10
              
              FROM 
              
              (
                  SELECT 
                            R.RIND          RIND,
                            R.RIND_VERS     RIND_VERS,
                            R.DENUMIRE      DENUMIRE
                               
                            FROM CIS2.MD_RIND R
                            
                            INNER JOIN (                  
                            SELECT 
                            R.RIND,
                            MAX(R.RIND_VERS) AS RIND_VERS
                            
                            FROM CIS2.MD_RIND R 
                            
                            WHERE 
                            R.RIND_VERS <=:pPERIOADA
                            AND  (R.FORM =:pFORM) AND 
                            (R.FORM_VERS =:pFORM_VERS) AND
                            (:pID_MDTABLE=:pID_MDTABLE) AND 
                             R.FORM = 17  AND 
                             R.CAPITOL IN (1001) AND 
                             ASCII(R.RIND) <> 45   
                            
                            
                            GROUP BY 
                            R.RIND
                            
                            
                             
                            
                             ) RR   ON (    RR.RIND      = R.RIND
                                       AND  RR.RIND_VERS = R.RIND_VERS)
                                       
                                       
                            WHERE
                            
                           (R.FORM =:pFORM) AND 
                           (R.FORM_VERS =:pFORM_VERS) AND
                           (:pID_MDTABLE=:pID_MDTABLE) AND 
                           R.FORM = 17  AND 
                           R.CAPITOL IN (1001) AND 
                           ASCII(R.RIND) <> 45  
                                             
                           
                           
                           GROUP BY
                           R.RIND,
                           R.RIND_VERS,
                           R.DENUMIRE
                           
                             
                           
                           
                           ) A LEFT JOIN (
                           
          SELECT 
                 MR.RIND,
                 MR.RIND_VERS,
                 MR.DENUMIRE,
                 SUM(D.COL1)  AS COL1,
                 SUM(D.COL2)  AS COL2,
                 SUM(D.COL3)  AS COL3,
                 SUM(D.COL4)  AS COL4,
                 SUM(D.COL5)  AS COL5,
                 SUM(D.COL6)  AS COL6,
                 SUM(D.COL7)  AS COL7,
                 SUM(D.COL8)  AS COL8,
                 SUM(D.COL9)  AS COL9,
                 SUM(D.COL10) AS COL10 
            
            
              FROM CIS2.DATA_ALL  D
                  
                            
                  INNER JOIN CIS2.RENIM R ON (R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
                  INNER JOIN CIS2.VW_CL_CUATM C ON (R.CUATM = C.CODUL)
                  
                  INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)  
                  
                  
                                                                 
                  
              
    WHERE
    (D.PERIOADA =:pPERIOADA) AND    
    (D.FORM =:pFORM) AND 
    (D.FORM_VERS =:pFORM_VERS) AND
    (:pID_MDTABLE=:pID_MDTABLE) AND 
    (C.FULL_CODE LIKE '%' ||:pCOD_CUATM||';%') AND
    MR.FORM = 17  AND 
    MR.CAPITOL IN (1001)  
    AND  ASCII(MR.RIND) <> 45   
               
               
                 
   GROUP BY 
   MR.RIND,
   MR.RIND_VERS,
   MR.DENUMIRE 
                           
                           ) B ON A.RIND = B.RIND AND A.RIND_VERS = B.RIND_VERS 
  ) DF
   ;
   
   
   BEGIN

  FOR CR IN C
  
  LOOP
    INSERT INTO --TABLE_OUT_TEST
    
      CIS2.TABLE_OUT
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