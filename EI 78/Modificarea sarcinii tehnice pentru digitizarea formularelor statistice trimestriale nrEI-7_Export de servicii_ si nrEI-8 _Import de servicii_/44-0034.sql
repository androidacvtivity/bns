SELECT            
        'Conditia nu este satisfacuta'

   
 AS REZULTAT

FROM
  CIS2.VW_DATA_ALL D  
 

WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL<>:CAPITOL) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (44)  AND
  D.CAPITOL IN (405,407) 
  
  
 

GROUP BY 
    D.CUIIO

    
    HAVING 
    
    
    (
    
    SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('79') THEN  1 ELSE 0  END)    

    
    
    ) >  0
       

    
    AND 
     
    (
     SUM(CASE WHEN D.CAPITOL IN (405) AND TRIM(D.COL31) IN  ('79')  THEN  1 ELSE 0  END)   
     
    = 0
     
     )
    
    


--Daca exista CS AEE((49.4,49.41.1) in Export  atunci exista 
--CS AEE(55.1,sau  56,sau  52.21.2, sau 52.21.21.,sau 52.21.23,sau  52.21.24,sau  52.21.25,sau  52.21.29, sau 52.29, sau 61.2) Import I sau Import II