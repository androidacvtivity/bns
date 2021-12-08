SELECT DISTINCT
'Ancheta: '||D.FILIAL||'; Rind  '||D.RIND||': '||
ROUND(
   NVAL(SUM(CASE WHEN D.CAPITOL IN('303') THEN  D.COL8 ELSE 0 END))*100/
   NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('303') THEN  D.COL2 ELSE 0 END))-
           nval(SUM(CASE WHEN D.CAPITOL IN('303') THEN  D.COL7 ELSE 0 END))
          
           
           
           ),2)
    
 
  ||' nu apartine intervalului [1%-13%]'  
  
  AS REZULTAT

FROM
  VW_DATA_ALL D      
WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (D.CAPITOL_VERS=:CAPITOL_VERS OR :CAPITOL_VERS = -1) AND
  (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
  (D.CAPITOL=:CAPITOL           OR :CAPITOL=-1)  AND
  
   D.CAPITOL=303 and
  (:FORM = :FORM) AND D.FORM IN (3) 
  
 GROUP BY D.RIND,D.FILIAL

  
HAVING
( 

 ROUND(
   NVAL(SUM(CASE WHEN D.CAPITOL IN('303') THEN  D.COL9 ELSE 0 END))*100/
   NOZERO( 
   
   nval(SUM(CASE WHEN D.CAPITOL IN('303') THEN  D.COL2 ELSE 0 END))-
           nval(SUM(CASE WHEN D.CAPITOL IN('303') THEN  D.COL7 ELSE 0 END))
           
       
           
           
           
          ),2) >13)
  
  OR
  
  ( ROUND(
   NVAL(SUM(CASE WHEN D.CAPITOL IN('303') THEN  D.COL9 ELSE 0 END))*100/
   NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('303') THEN  D.COL2 ELSE 0 END))-
           nval(SUM(CASE WHEN D.CAPITOL IN('303') THEN  D.COL7 ELSE 0 END))
           
        

           
           
           ),2) <1)
  
  AND
  ( 

 ROUND(
   NVAL(SUM(CASE WHEN D.CAPITOL IN('303') THEN  D.COL9 ELSE 0 END))*100/
   NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('303') THEN  D.COL2 ELSE 0 END))-
           nval(SUM(CASE WHEN D.CAPITOL IN('303') THEN  D.COL7 ELSE 0 END))
           
      
           
           
           ),2) >0)