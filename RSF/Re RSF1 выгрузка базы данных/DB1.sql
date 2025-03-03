SELECT
  *
FROM
(
SELECT
  D.CUIIO AS KEYID,
  'F1' AS SECT,
  D.RIND AS NSTR,
  D.COL1 AS GR1,
  D.COL2 AS GR2,
  NULL AS XFILES,
  D.ANUL
  
FROM
  VW_DATA_ALL_FR D
WHERE
  D.PERIOADA IN (2007) AND
  D.FORM IN (57) AND
  D.CAPITOL IN (1090)
--ORDER BY
--  D.CUIIO,
--  D.RIND
UNION ALL
SELECT
  D.CUIIO AS KEYID,
  'F2' AS SECT,
  D.RIND AS NSTR,
  D.COL1 AS GR1,
  D.COL2 AS GR2,
  NULL AS XFILES,
  D.ANUL
  
FROM
  VW_DATA_ALL_FR D
WHERE
  D.PERIOADA IN (2007) AND
  D.FORM IN (57) AND
  D.CAPITOL IN (1092)
--ORDER BY
--  D.CUIIO,
--  D.RIND
UNION ALL
SELECT
  D.CUIIO AS KEYID,
  'F4' AS SECT,
  D.RIND AS NSTR,
  D.COL1 AS GR1,
  D.COL2 AS GR2,
  NULL AS XFILES,
  D.ANUL
  
FROM
  VW_DATA_ALL_FR D
WHERE
  D.PERIOADA IN (2007) AND
  D.FORM IN (57) AND
  D.CAPITOL IN (1094)
--ORDER BY
--  D.CUIIO,
--  D.RIND
)
ORDER BY
  KEYID,
  SECT,
  NSTR