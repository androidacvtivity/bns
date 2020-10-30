INSERT INTO TABLE_OUT
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
         COL1,
         COL2
       
         
       )
--



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
  '000000000' AS DECIMAL_POS, 
   B.DENUMIRE AS NUME_ROW,
  ROUND(A.COL1,0) AS COL1,
  ROUND(A.COL2,0) AS COL2
 
 

FROM 

( 

SELECT
    MR.RIND,
    MR.RIND_VERS,
    MR.DENUMIRE,
   
    SUM(D.COL1)   AS COL1,
    SUM(D.COL2)   AS COL2
  
    
FROM   CIS2.VW_DATA_ALL D

         INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD) 
  WHERE 
  (D.PERIOADA =:pPERIOADA) AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE)  AND 
  (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
  D.FORM = 54 AND 
  D.CAPITOL IN (1077) 
   
  
  GROUP BY
   
  MR.RIND,
  MR.RIND_VERS,
  MR.DENUMIRE,
  MR.ORDINE
  
  ORDER BY 
  MR.ORDINE


  
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
                             R.CAPITOL IN (1077) AND 
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
                           R.CAPITOL IN (1077) AND 
                           ASCII(R.RIND) <> 45  
                                     
                           
                           
                           GROUP BY
                           R.RIND,
                           R.RIND_VERS,
                           R.DENUMIRE
                           
                           ORDER BY
                           R.RIND 
                           
                           ) B ON (B.RIND=A.RIND  AND B.RIND_VERS=A.RIND_VERS)

   
