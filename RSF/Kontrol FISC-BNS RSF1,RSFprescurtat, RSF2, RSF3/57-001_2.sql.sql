SELECT
--L.RIND L_RIND,
--R.RIND R_RIND,
--SUM(L.COL1) L_COL1,
--SUM(R.COL1) R_COL1
-- --R.CUIIO R_CUIIO  
 
 'Rind.'||R.RIND||':   '|| SUM(R.COL1) ||' <> '|| SUM(L.COL1) AS REZULTAT
 
FROM 


(
SELECT 
D.CUIIO,
D.RIND,
SUM(CASE WHEN D.CAPITOL IN (1090)  AND D.RIND NOT IN ('550','560','570','580') THEN  D.COL2 ELSE NULL END ) AS COL1 
FROM

     CIS2.VW_DATA_ALL_FR D 
      
WHERE
  
  (D.PERIOADA        = :PERIOADA -1          OR :PERIOADA = -1) AND
  (D.CUIIO           =:CUIIO             OR :CUIIO = -1) AND
  (D.CUIIO_VERS      = :CUIIO_VERS       OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM             OR :FORM = -1)        AND 
  (D.FORM_VERS       = :FORM_VERS        OR :FORM_VERS = -1)   AND 
  (D.CAPITOL         = :CAPITOL          OR :CAPITOL = -1  )   AND 
  (D.CAPITOL_VERS    = :CAPITOL_VERS     OR :CAPITOL_VERS = -1  ) 
  AND D.FORM = 57 
  
  AND D.CAPITOL IN 1090            

  AND D.RIND NOT IN ('550','560','570','580')
 
  GROUP BY
  D.CUIIO, 
  D.RIND ) L LEFT JOIN (
  SELECT 
D.CUIIO,
D.RIND,
SUM(D.COL1) AS COL1 
FROM

     USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE_FR D 
      
WHERE
  
  (D.PERIOADA        =:PERIOADA          OR :PERIOADA = -1) AND
  (D.CUIIO           =:CUIIO             OR :CUIIO = -1) AND
  (D.CUIIO_VERS      = :CUIIO_VERS       OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM             OR :FORM = -1)        AND 
  (D.FORM_VERS       = :FORM_VERS        OR :FORM_VERS = -1)   AND 
  (D.CAPITOL         = :CAPITOL          OR :CAPITOL = -1  )   AND 
  (D.CAPITOL_VERS    = :CAPITOL_VERS     OR :CAPITOL_VERS = -1  ) 
  AND D.FORM=57 
  AND D.CAPITOL IN 1090            
  AND D.ID_SCHEMA IN (2) 
  AND D.RIND NOT IN ('550','560','570','580')
 
  GROUP BY
  D.CUIIO, 
  D.RIND
  
  
  ) R ON (R.CUIIO = L.CUIIO   AND L.RIND = R.RIND) -- AND L.COL1 = R.COL1)   
   
  
  WHERE 
  1=1
  
  GROUP BY
  L.RIND,
  R.RIND
  
  HAVING 
  NVAL(SUM(L.COL1)) =    NVAL(SUM(R.COL1))
  
  
 
  
  
  
  