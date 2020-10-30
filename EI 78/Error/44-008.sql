SELECT  
D.CUIIO, 
'Rind.'||D.RIND||' - nu exista asa cod in clasificatorul tarilor = ['||CIS2.NVAL(D.COL3)||']'

   
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
  D.CAPITOL IN (405) 
  
  AND 
  
  D.COL3 NOT IN 
  (
  SELECT 
    CODUL
  FROM 
    CIS2.CL_TARI 
    
    WHERE 
    
    CODUL IN ('051','031','112','398','417','643','762','795','860','998','804') 
  )
 

GROUP BY 
  D.CUIIO,
  D.RIND, 
  D.COL3
