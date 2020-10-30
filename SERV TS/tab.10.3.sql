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
   R.CUATM||'~'||R.CUIIO AS NR_ROW, 
   0 AS ORDINE,
  '000' AS DECIMAL_POS,  
   R.DENUMIRE||' CAEM: '||R.CAEM2||')' AS NUME_ROW,
   R.CUIIO AS COL1,
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA   THEN D.RIND ELSE NULL END) AS COL2,
   SUM(CASE WHEN D.PERIOADA IN :pPERIOADA-1 THEN D.RIND ELSE NULL END) AS COL3  

FROM
  CIS.VW_DATA_ALL D
  INNER JOIN (

SELECT
  DISTINCT
  R.CUIIO,
  R.CUATM,
  R.CUIIO_VERS,
  R.DENUMIRE,
  F.FORM,
  R.CAEM,
  R.CAEM2
FROM
  CIS.RENIM R
  INNER JOIN CIS.FORM_CUIIO F ON (R.CUIIO=F.CUIIO AND R.CUIIO_VERS=F.CUIIO_VERS)
  INNER JOIN CIS.VW_DATA_ALL J ON F.FORM = J.FORM AND F.CUIIO = J.CUIIO AND F.CUIIO_VERS = J.CUIIO_VERS
  INNER JOIN 
  (
      SELECT
      R.CUIIO,
      MAX(R.CUIIO_VERS) AS CUIIO_VERS
    FROM
      CIS.RENIM R
    WHERE
      R.CUIIO_VERS <= :pPERIOADA
    GROUP BY
      R.CUIIO
  ) D ON (R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
WHERE
  F.FORM IN (4) AND
  F.STATUT <> '3' AND
  (J.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') ORDER BY CAEM2 ) R ON R.FORM = D.FORM AND R.CUIIO = D.CUIIO AND D.CUIIO_VERS <= R.CUIIO_VERS
  
WHERE
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (D.PERIOADA IN (:pPERIOADA, :pPERIOADA-1)) AND
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