SELECT
  CASE WHEN REZULTAT = 0 THEN 'GRESEALA' END AS REZULTAT
FROM
(
SELECT DISTINCT
  COUNT(D.CUIIO)
  AS REZULTAT
FROM
  CIS.VW_DATA_ALL D                                       
WHERE
  (D.PERIOADA=(SELECT
                  PERIOADA
                FROM
                  CIS.MD_PERIOADA
                WHERE
                ANUL IN (
                SELECT
                  ANUL
                FROM
                  CIS.MD_PERIOADA
                WHERE
                  PERIOADA IN (:PERIOADA)) AND
                  TIP_PERIOADA IN (4) AND NUM IN (12))         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  ( :CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  ( :FORM = :FORM               OR :FORM = -1) AND
  ( :FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  ( :CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  ( :CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  ( :ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (5))
GROUP BY REZULTAT
HAVING REZULTAT=0