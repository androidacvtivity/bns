﻿SELECT  
  *
FROM
(
SELECT 
    DISTINCT  
    F.DEN_SHORT,
    D.CUIIO,
    D.CUATM,
    R.DENUMIRE,
    MAX(D.PACHET) AS PACHET,
    MAX(PR.DATA_REG) AS DATA_PRIMIRII,
    MAX(C.DATA_REG) AS DATA_PROCESARII
FROM 
  CIS2.VW_DATA_ALL D --1-auto
  INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND     R.CUIIO_VERS = D.CUIIO_VERS  
  INNER JOIN CIS2.MD_FORM F ON (D.FORM=F.FORM AND D.FORM_VERS=F.FORM_VERS)
  INNER JOIN USER_EREPORTING.DATA_ALL_PRIMIT PR ON PR.CUIIO = D.CUIIO AND PR.CUIIO_VERS = D.CUIIO_VERS AND D.PERIOADA=PR.PERIOADA AND D.FORM=PR.FORM AND PR.ID_SCHEMA IN (2)
  INNER JOIN CIS2.CONTROL C ON (D.PERIOADA=C.PERIOADA AND D.CUIIO=C.CUIIO AND D.CUIIO_VERS=C.CUIIO_VERS)
WHERE 
  D.PERIOADA = :pPERIOADA_LUNARA AND
  D.FORM IN (4,16)AND
  D.CUATM LIKE '01%'
GROUP BY
  F.DEN_SHORT,
  D.CUIIO,
  D.CUATM,
  R.DENUMIRE
--ORDER BY 
--  F.DEN_SHORT,
--  D.CUIIO
  )
  ORDER BY
    DEN_SHORT,
    CUIIO;