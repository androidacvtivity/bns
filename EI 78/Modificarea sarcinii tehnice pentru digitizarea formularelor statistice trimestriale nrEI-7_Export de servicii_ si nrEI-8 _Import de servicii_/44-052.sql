SELECT            
         'Daca exista CS AEE(7122) in Export I atunci exista CS AEE (7122) Import I si invers. '

   
 AS REZULTAT

FROM
  CIS2.VW_DATA_ALL D  
 

WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL<>:CAPITOL) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (44)  AND
  D.CAPITOL IN (405,406,407,408) 
  
  
 

GROUP BY 
    D.CUIIO

    
    HAVING 
    
    
    (
    
    (SUM(CASE WHEN D.CAPITOL IN (405) AND CIS2.NVAL(D.COL1) = 7122 THEN  1 ELSE 0  END) +    

    SUM(CASE WHEN D.CAPITOL IN (406) AND CIS2.NVAL(D.COL1) = 7122 THEN  1 ELSE 0  END))) >  0
       

    
    AND 
     
    (
     
     (SUM(CASE WHEN D.CAPITOL IN (407) AND CIS2.NVAL(D.COL1) = 7122 THEN  1 ELSE 0  END)   + 
     SUM(CASE WHEN D.CAPITOL IN (408) AND CIS2.NVAL(D.COL1) = 7122  THEN  1 ELSE 0  END))   = 0
     
     )
    
    


    OR 
    
    
     
    (
    
    (SUM(CASE WHEN D.CAPITOL IN (405) AND CIS2.NVAL(D.COL1) = 7122 THEN  1 ELSE 0  END) +    

    SUM(CASE WHEN D.CAPITOL IN (406) AND CIS2.NVAL(D.COL1) = 7122 THEN  1 ELSE 0  END))) =  0
       

    
    AND 
     
    (
     
     (SUM(CASE WHEN D.CAPITOL IN (407) AND CIS2.NVAL(D.COL1) = 7122 THEN  1 ELSE 0  END)   + 
      SUM(CASE WHEN D.CAPITOL IN (408) AND CIS2.NVAL(D.COL1) = 7122  THEN  1 ELSE 0  END))   >  0
     
     )