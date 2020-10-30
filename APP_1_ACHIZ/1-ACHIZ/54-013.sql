--Col 3(rind10…rind115)=(col.4(rind10…rind115)+col.5(rind10…rind115)+col.6 (rind10…rind115))
SELECT
  'Rind - '||D.RIND||' Col3 - '||SUM(NVAL(COL3))||' <> ' ||' (Col4+Col5+Col6) - '||SUM(NVAL(COL4) + NVAL(COL5) +NVAL(COL6) )
  AS REZULTAT

FROM
  VW_DATA_ALL D

WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL) AND
  (:CAPITOL_VERS=:CAPITOL_VERS) AND
  (:ID_MD=:ID_MD) AND 
  D.FORM IN (54) AND 
  
  D.CAPITOL IN (1076)
  
GROUP BY
  D.RIND
  
HAVING
SUM(NVAL(COL3)) <>

  SUM(NVAL(COL4) + NVAL(COL5) +NVAL(COL6) )
  
  ORDER BY
  D.RIND 
  