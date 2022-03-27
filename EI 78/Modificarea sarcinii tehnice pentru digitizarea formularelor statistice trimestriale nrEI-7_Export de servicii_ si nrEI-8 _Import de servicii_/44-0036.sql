SELECT            
        'Capitol - '||C.DEN_SHORT||' Rind  - '||D.RIND||' - CSPM -  '||D.COL31

   
 AS REZULTAT

FROM
  CIS2.VW_DATA_ALL D  
  
  
                     INNER JOIN CIS2.MD_CAPITOL C ON C.CAPITOL = D.CAPITOL AND C.CAPITOL_VERS = D.CAPITOL_VERS
                     INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)                    
 

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
    D.CUIIO,
    D.CAPITOL,
    C.DEN_SHORT,
    D.RIND,
    D.COL31

    
    HAVING 
    
    
   ( SUM(CASE WHEN D.CAPITOL IN (405)  AND TRIM(D.COL31) IN  ('50.10.1') THEN  1 ELSE 0  END) +    

    
    
    SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('50.10.1') THEN  1 ELSE 0  END) 
    
    
    
    >  0 )
    
    OR 
    
     ( SUM(CASE WHEN D.CAPITOL IN (405)  AND TRIM(D.COL31) IN  ('50.20.2') THEN  1 ELSE 0  END) +    

    
    
    SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('50.20.2') THEN  1 ELSE 0  END) 
    
    
    
    >  0 )
    
    
    OR 
    
     ( SUM(CASE WHEN D.CAPITOL IN (405)  AND TRIM(D.COL31) IN  ('50.20.1') THEN  1 ELSE 0  END) +    

    
    
    SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('50.20.1') THEN  1 ELSE 0  END) 
    
    
    
    >  0 )
    
    
    
     OR 
    
     ( SUM(CASE WHEN D.CAPITOL IN (405)  AND TRIM(D.COL31) IN  ('50.20.2') THEN  1 ELSE 0  END) +    

    
    
    SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('50.20.2') THEN  1 ELSE 0  END) 
    
    
    
    >  0 )
    
    OR 
    
     ( SUM(CASE WHEN D.CAPITOL IN (405)  AND TRIM(D.COL31) IN  ('50.40.2') THEN  1 ELSE 0  END) +    

    
    
    SUM(CASE WHEN D.CAPITOL IN (407) AND TRIM(D.COL31) IN  ('50.40.2') THEN  1 ELSE 0  END) 
    
    
    
    >  0 )
    
    