SELECT DISTINCT 

'Daca exista Cap.SR Export rind 07 atunci exista Cap.SR Import 07  invers.'
  
  
  AS REZULTAT
FROM
  CIS2.VW_DATA_ALL_TEMP D 
WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL<>:CAPITOL           OR :CAPITOL=:CAPITOL) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (44)  AND
  D.CAPITOL IN (1,14)
  
  

HAVING
  
 
  (

  SUM(CASE WHEN D.CAPITOL IN (1) AND  D.RIND  IN('07') AND  D.COL1 = 1  THEN D.COL1  ELSE 0 END)  > 0

  )
  

  AND  
  
  (
  
   SUM(CASE WHEN D.CAPITOL IN (14) AND  D.RIND  IN('07') AND  D.COL1 = 1  THEN D.COL1  ELSE 0 END)   = 0
  
  )
-------------------------------------------------------------------------------------------------------   
 OR 
 
 (

  SUM(CASE WHEN D.CAPITOL IN (1) AND  D.RIND  IN('07') AND  D.COL1 = 1  THEN D.COL1  ELSE 0 END)  =  0

  )
  

  AND  
  
  (
  
   SUM(CASE WHEN D.CAPITOL IN (14) AND  D.RIND  IN('07') AND  D.COL1 = 1  THEN D.COL1  ELSE 0 END)  > 0
  
  )  
 
 
 
