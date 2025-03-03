﻿SELECT 
  NVAL(SUM(CASE WHEN D.RIND IN '2001' THEN D.COL1 ELSE 0 END))||' > '|| 
  SUM(DISTINCT J.COL1) AS REZULTAT
  

FROM
  USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE D
  INNER JOIN
(
SELECT DISTINCT
  CUIIO,
  ANUL,
  NVAL(SUM(CASE WHEN D.RIND IN('201') THEN D.COL1 ELSE 0 END)) AS COL1
  
FROM
  CIS2.VW_DATA_ALL D
  
WHERE
  D.FORM IN 20 AND
  D.CAPITOL IN 1011 AND
  D.RIND IN '201' AND
  D.CUIIO=:CUIIO AND
  D.ANUL IN (SELECT CASE WHEN PERIOADA IN (:PERIOADA) THEN ANUL END AS ANUL FROM CIS2.MD_PERIOADA)

GROUP BY
  CUIIO,
  ANUL ) J ON J.CUIIO = D.CUIIO AND J.ANUL = D.ANUL
  
WHERE 
  (D.PERIOADA IN(:PERIOADA)) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (:CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
   
   D.FORM = 19 AND
   D.CAPITOL = 1018
   
HAVING
  NVAL(SUM(CASE WHEN D.RIND IN '2001' THEN D.COL1 ELSE 0 END)) > 
  SUM(DISTINCT J.COL1)