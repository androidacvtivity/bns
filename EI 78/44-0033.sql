        
       SELECT            
       ' Capitol - '||CA.DEN_SHORT||' Codul: '||D.COL31 ||CASE 
         WHEN TRIM(CA.DEN_SHORT) = 'Export de servicii' THEN  ' ,Import de servicii Codul nu este completat' 
         WHEN TRIM(CA.DEN_SHORT) = 'Import de servicii' THEN  ' ,Export de servicii Codul nu este completat'
         ELSE  TRIM(CA.DEN_SHORT) END 
         AS REZULTAT




FROM
  CIS2.VW_DATA_ALL D  
            INNER JOIN CIS2.MD_CAPITOL CA ON CA.CAPITOL = D.CAPITOL
                                               AND  CA.CAPITOL_VERS = D.CAPITOL_VERS  

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
    D.CAPITOL,
    CA.DEN_SHORT,
    D.COL31 


    
    HAVING 
    
    
    (
    
    SUM(CASE WHEN D.CAPITOL IN (405) AND TRIM(D.COL31) IN  ('49.41.1') THEN  1 ELSE 0  END) +    

    SUM(CASE WHEN D.CAPITOL IN (405) AND TRIM(D.COL31) IN  ('49.42.1') THEN  1 ELSE 0  END)) >  0
       

    
    AND 
     
    (
     SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('55.1')      THEN  1 ELSE 0  END)   + 
     SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('55.2')      THEN  1 ELSE 0  END)   +
     SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('55.3')  THEN  1 ELSE 0  END)   +
     SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('55.9')  THEN  1 ELSE 0  END)   +
     SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('52.21.24')  THEN  1 ELSE 0  END)   +
     SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('52.21.21')  THEN  1 ELSE 0  END)   +
     SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('52.21.22')   THEN  1 ELSE 0  END)   + 
     SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('52.21.23')   THEN  1 ELSE 0  END) +
     SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('52.21.24')   THEN  1 ELSE 0  END) +
     SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('52.21.25')   THEN  1 ELSE 0  END) +
     SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('52.21.29')   THEN  1 ELSE 0  END) +
    SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('52.29')   THEN  1 ELSE 0  END)  +
     SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('61.20.11')   THEN  1 ELSE 0  END) 
    = 0
 
     
     )
    
    


--Daca exista CS AEE((49.4,49.41.1) in Export  atunci exista 
--CS AEE(55.1,sau  56,sau  52.21.2, sau 52.21.21.,sau 52.21.23,sau  52.21.24,sau  52.21.25,sau  52.21.29, sau 52.29, sau 61.2) Import I sau Import II