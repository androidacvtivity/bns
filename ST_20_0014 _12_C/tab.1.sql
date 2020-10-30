--DECLARE
--
--  CURSOR C IS
--
--SELECT 
--    DF.PERIOADA,
--    DF.FORM,
--    DF.FORM_VERS,
--    DF.ID_MDTABLE,
--    DF.COD_CUATM,
--    DF.NR_SECTIE,
--    DF.NUME_SECTIE,
--    DF.NR_SECTIE1,
--    DF.NUME_SECTIE1,
--    DF.NR_SECTIE2,
--    DF.NUME_SECTIE2,
--    DF.NR_ROW  NR_ROW,
--    DF.ORDINE,
--    DF.DECIMAL_POS,
--    DF.NUME_ROW,
--    DF.COL1,
--    DF.COL2,
--    DF.COL3,
--    DF.COL4,
--    DF.COL5, DF.COL6, DF.COL7,DF. COL8, DF.COL9, DF.COL10, DF.COL11
--   
--    
--    
--FROM 
--(



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
  '00000000000' AS DECIMAL_POS, 
   B.DENUMIRE AS NUME_ROW,
  ROUND(A.COL1,0) AS COL1,
  ROUND(A.COL2,0) AS COL2,
  ROUND(A.COL3,0) AS COL3,
  ROUND(A.COL4,0) AS COL4,
  ROUND(A.COL5,0) AS COL5,
  ROUND(A.COL6,0) AS COL6,
  ROUND(A.COL7,0) AS COL7,
  ROUND(A.COL8,0) AS COL8,
  ROUND(A.COL9,0) AS COL9,
  ROUND(A.COL10,0) AS COL10,
  ROUND(A.COL11,0) AS COL11

FROM 

( 




SELECT
    MR.RIND,
    MR.RIND_VERS,
    MR.DENUMIRE,
    SUM(D.COL1) + SUM(D.COL3)  AS COL1,
    SUM(D.COL2) + SUM(D.COL4)  AS COL2,
    (SUM(D.COL2) + SUM(D.COL4)) / (SUM(D.COL1) + SUM(D.COL3))  AS COL3, 
    SUM(D.COL1)  AS COL4,
    SUM(D.COL2)  AS COL5,
    ROUND(SUM(D.COL2) / SUM(D.COL1),1)  AS COL6,
    SUM(D.COL3)  AS COL7,
    SUM(D.COL4)  AS COL8,
    ROUND(SUM(D.COL4) / SUM(D.COL3),1)  AS COL9,
    SUM(D.COL2) AS COL10,
    ROUND(SUM(D.COL2) / SUM(D.COL1),1) AS COL11
    
FROM   CIS2.VW_DATA_ALL D

         INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD) 
  WHERE 
  (D.PERIOADA =:pPERIOADA) AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE)  AND 
  (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
  D.FORM = 54 AND 
  D.CAPITOL IN (1075) 
 
  
  GROUP BY
   
  MR.RIND,
  MR.RIND_VERS,
  MR.DENUMIRE
  
  ORDER BY 
  MR.RIND
  
   ) A RIGHT JOIN (
  
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
                             R.FORM = 54  AND 
                             R.CAPITOL IN (1075) AND 
                             ASCII(R.RIND) <> 45   
                           
                            
                            GROUP BY 
                            R.RIND
                              
                            
                             ) RR   ON (    RR.RIND      = R.RIND
                                       AND  RR.RIND_VERS = R.RIND_VERS)
                                       
                                       
                            WHERE
                            
                           (R.FORM =:pFORM) AND 
                           (R.FORM_VERS =:pFORM_VERS) AND
                           (:pID_MDTABLE=:pID_MDTABLE) AND 
                           R.FORM = 54  AND 
                           R.CAPITOL IN (1075) AND 
                           ASCII(R.RIND) <> 45  
                                     
                           
                           
                           GROUP BY
                           R.RIND,
                           R.RIND_VERS,
                           R.DENUMIRE
                           
                           ORDER BY
                           R.RIND 
                           
                           ) B ON (B.RIND=A.RIND  AND B.RIND_VERS=A.RIND_VERS)

   
--)DF;
--   
--   
--   
--    
--  BEGIN
--
--  FOR CR IN C
--  
--  LOOP
    INSERT INTO 
              
       TABLE_OUT_TEST
   -- CIS2.TABLE_OUT
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
  COL1,COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11
  
    )
--    VALUES
--    (
--  CR.PERIOADA,
--  CR.FORM,
--  CR.FORM_VERS,
--  CR.ID_MDTABLE,
--  CR.COD_CUATM,
--  CR.NR_SECTIE,
--  CR.NUME_SECTIE,
--  CR.NR_SECTIE1,
--  CR.NUME_SECTIE1,
--  CR.NR_SECTIE2,
--  CR.NUME_SECTIE2,
--  CR.NR_ROW,
--  CR.ORDINE,
--  CR.DECIMAL_POS,
--  CR.NUME_ROW,  
--  CR.COL1, CR.COL2, CR.COL3, CR.COL4, CR.COL5, CR.COL6, CR.COL7, CR.COL8, CR.COL9, CR.COL10, CR.COL11
--  
--    );
--  END LOOP;
--END;
  