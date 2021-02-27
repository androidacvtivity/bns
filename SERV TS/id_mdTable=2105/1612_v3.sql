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
--  COL1, COL2, COL3, COL4, COL5, COL6, COL7 , COL8, COL9
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

   R.CUIIO||'~'||SUM(ROWNUM)/0.13 AS NR_ROW,
     
   R.CUIIO AS ORDINE,
   '000000111' AS DECIMAL_POS,
   R.DENUMIRE||'CUATM '||R.CUATM ||' CAEM: '||R.CAEM2||')' AS NUME_ROW,
   
 TO_NUMBER(R.CUATM) AS COL1,
 SUBSTR(R.CAEM2,2,4) AS COL2,
 SUM(L.COL3) AS COL3,
 SUM(L.COL4) AS COL4,
 SUM(L.COL5) AS COL5,
 SUM(L.COL6) AS COL6,
 SUM(L.COL7) AS COL7,
 SUM(L.COL8) AS COL8,
 SUM(L.COL9) AS COL9
           
      FROM

(

SELECT     
           R.CUIIO,
           R.CUIIO_VERS,
           R.DENUMIRE,
           FC.FORM,
           R.CUATM,
           R.CFP,
           R.CFOJ,
           R.CAEM2
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (4) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (4) AND FC.STATUT <> '3') FC
             
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
                INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = R.CUATM
               
    WHERE
    1=1
     
     AND  C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' 
     
     ) R  LEFT JOIN (
     
     
SELECT DISTINCT
 
   R.CUIIO AS CUIIO,
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
     
     ) L ON R.CUIIO = L.CUIIO 
     
     
     
     GROUP BY 
     
      R.CUIIO,
          
           R.DENUMIRE,
         
           R.CUATM,
         
           R.CAEM2