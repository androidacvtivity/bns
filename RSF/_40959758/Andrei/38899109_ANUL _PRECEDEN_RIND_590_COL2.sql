

SELECT
CUIIO,
RIND, 
COL2
FROM CIS2.VW_DATA_ALL_FR
WHERE

CUIIO = 38899109  AND 
PERIOADA = 2008
AND FORM = 57
AND RIND IN ('590')
AND CAPITOL =   1090;

SELECT
CUIIO,
RIND, 
COL1
FROM USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE_FR
WHERE

CUIIO = 38899109 

AND PERIOADA = 2009
AND FORM = 57

AND RIND IN ('880');

