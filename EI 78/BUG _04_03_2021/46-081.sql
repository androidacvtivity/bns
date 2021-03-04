SELECT
  'Cap. SR Export si Cap. SR Import nu are date.' AS REZULTAT
FROM
  DUAL DL LEFT JOIN
  (
    SELECT
      D.CUIIO
    FROM
      CIS2.VW_DATA_ALL D
    WHERE
      (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
      (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
      (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
      (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
      (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
      (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
      (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
      :FORM = :FORM AND
       D.FORM IN (46)  AND
      D.CAPITOL IN(1,404)
  ) D ON(1=1)
WHERE
  D.CUIIO IS NULL