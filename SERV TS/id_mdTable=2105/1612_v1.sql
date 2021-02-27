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
--  COL1, COL2, COL3
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
  R.CUATM||'~'||R.CUIIO/ROWNUM AS NR_ROW, 
   ROWNUM AS ORDINE,
  '000' AS DECIMAL_POS,  
   R.DENUMIRE||' CAEM: '||R.CAEM2||')' AS NUME_ROW,
   R.CUIIO AS COL1,
   R.COL2 AS COL2,
   L.COL2 AS COL3

FROM
  
(
  SELECT
  R.CUIIO,
  R.CUATM,
  R.DENUMIRE,
  R.CAEM2,
  
  SUM(CASE WHEN D.PERIOADA IN :pPERIOADA   THEN D.RIND ELSE NULL END) AS COL2
  
  
   
  
  
  FROM   CIS.VW_DATA_ALL D
            INNER JOIN CIS.RENIM R ON D.CUIIO = R.CUIIO AND D.CUIIO_VERS = R.CUIIO_VERS 

  WHERE
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (D.PERIOADA IN (:pPERIOADA)) AND 
   D.FORM IN (4) AND 
   D.CAPITOL IN (0) AND
   D.RIND NOT IN ('CM','CD','(CD)','DIH','ER') 
   
   
   GROUP BY
  R.DENUMIRE,
  R.CUIIO,
  R.CUATM,
  R.CAEM2
  
ORDER BY
  R.CUIIO )  R LEFT JOIN (
  SELECT
  R.CUIIO,
  R.CUATM,
  R.DENUMIRE,
  R.CAEM2,
  
  SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-1   THEN D.RIND ELSE NULL END) AS COL2
  
  
   
  
  
  FROM   CIS.VW_DATA_ALL D
            INNER JOIN CIS.RENIM R ON D.CUIIO = R.CUIIO AND D.CUIIO_VERS = R.CUIIO_VERS 

  WHERE
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (D.PERIOADA IN (:pPERIOADA-1)) AND 
   D.FORM IN (4) AND 
   D.CAPITOL IN (0) AND
   D.RIND NOT IN ('CM','CD','(CD)','DIH','ER') 
   
   
   GROUP BY
  R.DENUMIRE,
  R.CUIIO,
  R.CUATM,
  R.CAEM2
  
ORDER BY
  R.CUIIO
  
  ) L ON L.CUIIO = R.CUIIO
  
  
  WHERE 
  1=1