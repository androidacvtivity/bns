SELECT            
           
     'Daca exista Rind:'||D.RIND||'. lei ' ||D.COL4|| ' Trebuie sa fie ?SPM, Rev.2 si  codul  CITLT pe rind: '||D.RIND

   
 AS REZULTAT

FROM
  CIS2.VW_DATA_ALL D  
 

WHERE
  (D.PERIOADA=:PERIOADA          ) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (44)  AND
  D.CAPITOL IN (405) 
  AND D.RIND NOT IN ('1')
  
 

GROUP BY 
    D.RIND,
    D.COL4
  
  
    
    
    HAVING 
    
    ( 
       ( SUM(CASE WHEN CIS2.NVAL(D.COL4) = CIS2.NVAL(D.COL4) THEN  CIS2.NVAL(D.COL4) ELSE 0  END)  > 0)   
       
       
       
       AND 
      
       
       (
       
       MAX(CASE WHEN 1=1 THEN  D.COL31 ELSE NULL   END)  IS NULL   
       
       AND SUM(CASE WHEN CIS2.NVAL(D.COL3) = CIS2.NVAL(D.COL3) THEN  CIS2.NVAL(D.COL3) ELSE 0  END) = 0  
       
       )  
      
      )
