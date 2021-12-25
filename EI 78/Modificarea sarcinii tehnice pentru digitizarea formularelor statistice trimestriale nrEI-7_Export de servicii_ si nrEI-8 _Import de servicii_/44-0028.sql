SELECT 

'Rind. '||L.RIND||' - nu exista asa cod in clasificatorul tarilor = ['||CIS2.NVAL(L.COL3)||']'
 AS REZULTAT


FROM
(
SELECT   
D.RIND,
D.COL3
   FROM
  CIS2.VW_DATA_ALL D  
 

WHERE
  (D.PERIOADA=:PERIOADA         OR :PERIOADA = -1) AND
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
  D.RIND, 
  D.COL3

) L LEFT JOIN (

  SELECT 
    TO_NUMBER(LTRIM(CODUL,'0')) AS CODUL
    
    
  FROM 
    CIS2.CL_TARI 

    WHERE 
   
   CODUL  NOT IN ('555','000','444')

) R ON L.COL3 = R.CODUL
 

WHERE 

R.CODUL IS  NULL;