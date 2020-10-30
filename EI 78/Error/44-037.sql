SELECT   
D.CUIIO,
'Rind.'||D.RIND||' - nu exista asa cod in clasificatorul serviciilor = ['||CIS2.NVAL(D.COL1)||']'

   
 AS REZULTAT

FROM
  CIS2.VW_DATA_ALL D  
 

WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (44)  AND
  D.RIND NOT IN ('1','2') AND 
  D.CAPITOL IN (407) 
  
  AND 
  
  D.COL1 NOT IN 
  (
  SELECT 
    CODUL
  FROM 
    CIS2.CL_SERVICII 
    
    
     WHERE
     LENGTH(CODUL) >=3
  )
 

GROUP BY 
  D.CUIIO,
  D.RIND, 
  D.COL1
