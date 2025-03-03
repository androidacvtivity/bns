﻿SELECT
  B.REZULTAT*A.NR_ZILE ||' < '|| A.REZULTAT AS REZULTAT
FROM
(SELECT DISTINCT
  D.CUIIO,
  NVAL(SUM(CASE WHEN D.RIND IN('000') THEN D.COL2 ELSE 0 END)) AS REZULTAT,
 
 NVAL(EXTRACT(DAY FROM LAST_DAY('01.'||CASE WHEN P.NUM=1 THEN 'Jan'
                                        WHEN P.NUM=2 THEN 'Apr'
                                        WHEN P.NUM=3 THEN 'Jul'
                                        WHEN P.NUM=4 THEN 'Oct' END||'.'||P.ANUL)))
  AS NR_ZILE
  ----------------------------------------------------------------------------------------

  FROM
  USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE D
  INNER JOIN CIS2.MD_PERIOADA P ON (D.PERIOADA=P.PERIOADA)
WHERE
  (:PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO              OR :CUIIO = -1) AND
  (:CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (:FORM = :FORM               OR :FORM = -1) AND
  (:FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (:CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (:ID_MD=:ID_MD               OR :ID_MD = -1) AND 
   
 
   D.FORM||'.'||D.CAPITOL||'.'||D.RIND IN ('19.1017.000')
   
   GROUP BY
   P.PERIOADA,
   P.ANUL,
   P.NUM,
   D.CUIIO) A
INNER JOIN
  (
  SELECT DISTINCT
  CUIIO,
  ANUL,
  NVAL(SUM(CASE WHEN D.RIND IN('201') THEN D.COL3 ELSE 0 END)) AS REZULTAT
  
FROM
  CIS2.VW_DATA_ALL D
  
WHERE
  D.FORM IN 20 AND
  D.CAPITOL IN 1011 AND
  D.RIND IN '201' AND
  D.CUIIO=:CUIIO AND
  D.ANUL IN (SELECT ANUL FROM CIS2.MD_PERIOADA WHERE PERIOADA IN (:PERIOADA))

GROUP BY
  CUIIO,
  ANUL
  
  ) B ON (A.CUIIO=B.CUIIO)
GROUP BY
  B.REZULTAT,
  A.REZULTAT,
  A.NR_ZILE
HAVING
  B.REZULTAT*A.NR_ZILE < A.REZULTAT