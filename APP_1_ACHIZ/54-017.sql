SELECT
      'RIND:'||B.RIND||'.Capitol II = '||
      A.REZULTAT||' , '|| 'RIND:'||B.RIND||'.Capitol I = '
      
      
      || B.REZULTAT   AS REZULTAT 

FROM 


(
SELECT
    D.CUIIO,
    D.RIND,
    SUM(NVAL(D.COL2))  AS REZULTAT

FROM
  VW_DATA_ALL D

WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL=:CAPITOL) AND
  (:CAPITOL_VERS=:CAPITOL_VERS  OR :CAPITOL_VERS <>:CAPITOL_VERS) AND
  (:ID_MD=:ID_MD) AND 
  D.FORM IN (54) AND 
  
  D.CAPITOL IN (1076)
  

   GROUP BY 
   D.RIND,
   D.CUIIO 
   
   
   
   ) A RIGHT JOIN (
   
   SELECT
    D.CUIIO,
    D.RIND,
    SUM(NVAL(D.COL1)+NVAL(D.COL7))  AS REZULTAT
  
 
FROM
  VW_DATA_ALL D

WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  (D.CUIIO_VERS=:CUIIO_VERS     OR :CUIIO_VERS = -1) AND
  (D.FORM = :FORM               OR :FORM = -1) AND
  (D.FORM_VERS=:FORM_VERS       OR :FORM_VERS = -1) AND
  (:CAPITOL=:CAPITOL            OR :CAPITOL=:CAPITOL) AND
  (:CAPITOL_VERS=:CAPITOL_VERS  OR :CAPITOL_VERS <>:CAPITOL_VERS) AND
  (:ID_MD=:ID_MD) AND 
  D.FORM IN (54) AND 
  
  D.CAPITOL IN (1075)  
  AND D.RIND NOT IN ('15','50','60','82','83','84','85','86','87','88','89','90','91','92','100','113') 
  

   GROUP BY 
   D.CUIIO,
   D.RIND
   
   
   
   
   )  B  ON  (A.CUIIO = B.CUIIO  AND A.RIND = B.RIND)
    
    GROUP BY
           B.RIND,
           A.RIND,
           A.REZULTAT,
           B.REZULTAT
   
           HAVING 
           NVAL(A.REZULTAT) <> NVAL(B.REZULTAT)