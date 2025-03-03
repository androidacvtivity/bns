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
--  
--  COL1, COL2, COL3, COL4
--)

SELECT DISTINCT                                                                     
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
   F.CUIIO AS NR_ROW,  
   F.CUIIO AS ORDINE,
  '0000000' AS DECIMAL_POS,
   F.DENUMIRE AS NUME_ROW,
   SUBSTR(F.CAEM2,2,4) AS COL1,
   
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA AND D.CUIIO = F.CUIIO AND D.CAPITOL IN (2) AND D.RIND IN '01' THEN D.PACHET ELSE 0 END) AS COL2,
   
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA AND D.CUIIO = F.CUIIO AND D.CAPITOL IN (2) AND D.RIND IN ('01','02','03','04','05','06','07','10','11','12') THEN TO_NUMBER(D.RIND) ELSE 0 END) AS COL3,
   
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-1 AND D.CUIIO = F.CUIIO AND D.CAPITOL IN (2) AND D.RIND IN ('01','02','03','04','05','06','07','10','11','12') THEN TO_NUMBER(D.RIND) ELSE 0 END) AS COL4
   
  
FROM
  

   (
  
      SELECT R.CUIIO,
    
           R.DENUMIRE,
          
          
           R.CUATM,
           FC.FORM,
           FC.FORM_VERS,
          
       
           R.CAEM2
       
       
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS2.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS2.FORM_CUIIO
                                  WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (:pFORM) AND FC.STATUT <> '3') FC
           INNER JOIN CIS2.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
   INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM
  WHERE
  C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' AND
  FC.FORM IN (5) AND
  FC.STATUT <> '3' 
  
  ) F
  
RIGHT JOIN CIS2.VW_DATA_ALL D ON D.CUIIO = F.CUIIO AND D.FORM = F.FORM AND F.FORM_VERS = D.FORM_VERS
  
 
  
  
WHERE
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
 -- (:pID_MDTABLE=:pID_MDTABLE) AND
   D.FORM IN (5) AND 
   D.CAPITOL IN (2) AND 
   D.PERIOADA IN (:pPERIOADA,  :pPERIOADA-1 )
  
  
  
GROUP BY
  F.DENUMIRE,
  F.CUIIO,
  F.CAEM2
  
  
  HAVING 
  
  F.CUIIO IS NOT NULL