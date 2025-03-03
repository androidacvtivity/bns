SELECT
D.CUIIO,
 D.RIND ||': nu ati introdus CAEM2'

  AS REZULTAT

FROM
 CIS2.VW_DATA_ALL D
         
WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
 -- (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1)AND 
  D.CAPITOL IN(1127) AND D.RIND NOT IN ('400')

GROUP BY
 D.RIND,
 D.CUIIO
--  
  HAVING  
  
 (MAX(TO_CHAR(CASE WHEN D.CAPITOL IN(1127)  THEN D.COL31 END))) IS NULL AND
 SUM( CASE WHEN D.CAPITOL IN(1127)  THEN  CIS2.NVAL(D.COL3)+ CIS2.NVAL(D.COL4)+ CIS2.NVAL(D.COL5) ELSE 0 END) >0
---- 
---- 37450229