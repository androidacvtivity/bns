SELECT
 
 
        'Trebuie de completeat cap. II col.2 rînd. 201'  AS REZULTAT
  

FROM 
 VW_DATA_ALL D
 
WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL <> :CAPITOL) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  (D.FORM IN (58)  AND  D.CAPITOL IN (417)   AND D.RIND IN ('200','201')) 
   
 
  

 HAVING



(
    SUM(CASE  WHEN  (D.CAPITOL IN (417)   AND D.RIND IN ('200')) THEN NVAL(D.COL2)  ELSE 0  END)   >  0 
     
      
    
 )  
 
 
  
    
 AND 
  
  (
   
   SUM(CASE  WHEN  D.CAPITOL IN (417)   AND D.RIND IN ('201') THEN NVAL(D.COL2)  ELSE 0  END ) =   0
   
  )