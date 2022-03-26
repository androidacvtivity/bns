SELECT  
          

        ' Codul - '||D.COL31||' si codul  '||D.COL3|| ' se repeta.  '        
        
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
  
  D.RIND NOT IN ('1') AND 
  D.CAPITOL IN (407) 
  
  
 

GROUP BY 
  D.COL31,
  D.COL3
 
  
  
 HAVING 
  
  COUNT(D.COL31||D.COL3) > 1
  
   
    
    
    
    
      
   

