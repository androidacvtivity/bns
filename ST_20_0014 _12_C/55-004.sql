SELECT

  '(Rînd.100)(Col.1) =  numai 1 sau 2 sua 3' ||'  COL1 = '||D.COL1 
   
  
 AS REZULTAT


FROM CIS2.VW_DATA_ALL D
         



WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  
  D.FORM IN (55)  
  AND D.CAPITOL IN (1079)
  AND D.RIND IN ('100')
  
 
  GROUP  BY 
  
  D.COL1,
  D.CUIIO
 
  HAVING 
  
  (CASE WHEN  D.COL1 = 1       THEN  1
       WHEN   D.COL1 = 2       THEN  1
       WHEN   D.COL1 = 3       THEN  1

       
       
       ELSE 0 END )  <> 1  
       
       
       
        