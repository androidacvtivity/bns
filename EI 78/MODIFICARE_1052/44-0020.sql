SELECT            
          'Rind '||D.RIND||' Cod AEE ['|| MAX(CASE WHEN 1=1 THEN  
          
          (CASE WHEN D.COL31 IS NULL THEN 'Nu este completat' ELSE D.COL31 END)  
          
          
          ELSE NULL  END )  ||'] <> [' ||  
            MAX(CASE WHEN 1=1 THEN  
            
            (CASE 
            
            WHEN TO_CHAR(D.COL3) IS NULL   THEN 'Nu este completat' ELSE TO_CHAR(D.COL3) END 
            
            )  
            
            
            ELSE TO_CHAR(NULL)  END)  || '] Cod ?SPM' 

   
 AS REZULTAT,
 D.COL31,
 D.COL33 

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
  AND D.RIND NOT IN ('1','-') 
  
  
 

GROUP BY 
    D.RIND,
    D.COL31,
    D.COL33
    
    
    HAVING 
   
    
    (D.COL31 IS NOT NULL  AND  D.COL33 IS NULL) 
     OR 
     (D.COL31 IS  NULL  AND  D.COL33 IS NOT  NULL)
     
    
    
    
