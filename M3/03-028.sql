SELECT DISTINCT


CASE when 
(
(
( ROUND(NVAL(SUM(CASE WHEN D.CAPITOL IN('307') AND D.RIND IN ('2') THEN  D.COL1 ELSE 0 END))*100/
  NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('303') AND D.RIND IN ('00-T') THEN  D.COL2 ELSE 0 END) )),1)>30 
  )  
  OR  
  (  
   ROUND(NVAL(SUM(CASE WHEN D.CAPITOL IN('307') AND D.RIND IN ('2') THEN  D.COL1 ELSE 0 END))*100/
   NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('303') AND D.RIND IN ('00-T') THEN  D.COL2 ELSE 0 END) )),1)<23)
  
)

)

THEN 

NVAL(ROUND( NOZERO(SUM(CASE WHEN D.CAPITOL IN('307') AND D.RIND IN ('2') THEN  D.COL1 ELSE 0 END))*100/
   NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('303') AND D.RIND IN ('00-T') THEN  D.COL2 ELSE 0 END) )),2))
   
 
  ||' nu apartine intervalului [23%-30%]'  
  
  ELSE 
  ROUND( NVAL(SUM(CASE WHEN D.CAPITOL IN('307') AND D.RIND IN ('2') THEN  D.COL1 ELSE 0 END))*100/
   NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('303') AND D.RIND IN ('00-T') THEN  D.COL2 ELSE 0 END) )),2)
   
 
  ||' <0'  
  
  end 
  
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
  D.CAPITOL IN (303,307) AND
  (:FORM = :FORM) AND 
  D.FORM IN (3) AND D.FILIAL IN ('0')
  

HAVING
(
( ROUND(NVAL(SUM(CASE WHEN D.CAPITOL IN('307') AND D.RIND IN ('2') THEN  D.COL1 ELSE 0 END))*100/
  NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('303') AND D.RIND IN ('00-T') THEN  D.COL2 ELSE 0 END) )),1)>30 
  )  
  OR  
  (  
   ROUND(NVAL(SUM(CASE WHEN D.CAPITOL IN('307') AND D.RIND IN ('2') THEN  D.COL1 ELSE 0 END))*100/
   NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('303') AND D.RIND IN ('00-T') THEN  D.COL2 ELSE 0 END) )),1)<23)
  
)

OR 

(
( 

  NVAL(SUM(CASE WHEN D.CAPITOL IN('307') AND D.RIND IN ('2') THEN  D.COL1 ELSE 0 END))*100/
  NOZERO( nval(SUM(CASE WHEN D.CAPITOL IN('303') AND D.RIND IN ('00-T') THEN  D.COL2 ELSE 0 END) ))<0
  ) 
)
