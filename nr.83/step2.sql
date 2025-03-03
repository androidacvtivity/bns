



SELECT 
   DISTINCT  D.CUIIO 
FROM
  VW_DATA_ALL D
  INNER JOIN  MD_RIND RD ON (D.ID_MD=RD.ID_MD)
  INNER JOIN RENIM R ON (R.CUIIO= D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
  
  WHERE 
  RD.RIND IN ('04') AND RD.CAPITOL IN ('4') AND  R.TIP_INV NOT IN('71','72','73','80') 
  
  AND 

  R.CUATM LIKE '96%'
  AND D.COL1 IS NOT NULL
  