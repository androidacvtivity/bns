SELECT
DISTINCT 
  'Rind.'||( CASE WHEN R.RIND IS NULL THEN L.RIND  ELSE R.RIND END) ||':   '|| SUM(NVAL(L.COL1)) ||' <> '|| SUM(NVAL(R.COL1)) AS REZULTAT
 
FROM 


(
SELECT 
D.CUIIO,
D.RIND,
SUM(D.COL2) AS COL1 
FROM

     CIS2.VW_DATA_ALL_FR D 
      
WHERE
  
  (D.PERIOADA IN(:PERIOADA-1))AND 
  (D.CUIIO           = :CUIIO          OR :CUIIO= -1)        AND 
  (:CUIIO_VERS       = :CUIIO_VERS     OR :CUIIO_VERS   <>  :CUIIO_VERS)  AND 
  (:FORM             = :FORM           OR :FORM  <>  :FORM )        AND 
  (:FORM_VERS        = :FORM_VERS      OR :FORM_VERS  <> :FORM_VERS)   AND 
  (:CAPITOL          = :CAPITOL        OR :CAPITOL  <> :CAPITOL  )   AND 
  (:CAPITOL_VERS     = :CAPITOL_VERS   OR :CAPITOL_VERS  <> :CAPITOL_VERS) 
  AND D.FORM = 63 
  AND D.CAPITOL = 1121
  AND D.RIND IN ('010', '020', '040', '050', '060', '070')

 
  GROUP BY
  D.CUIIO, 
  D.RIND 
 
HAVING  
  
 D.CUIIO IS NOT NULL
 
 
  ) L LEFT JOIN (
  
  
  SELECT 
D.CUIIO,
D.RIND,
SUM(D.COL1) AS COL1 
FROM

     USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE_FR D 
     
     -- USER_BANCU.FOR_VALIDATE_FR D
      
WHERE
  
  (D.PERIOADA        =:PERIOADA          OR :PERIOADA = -1) AND
  (D.CUIIO           =:CUIIO             OR :CUIIO = -1) AND
  (D.CUIIO_VERS      = :CUIIO_VERS       OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM             OR :FORM = -1)        AND 
  (D.FORM_VERS       = :FORM_VERS        OR :FORM_VERS = -1)   AND 
  (D.CAPITOL         = :CAPITOL          OR :CAPITOL = -1  )   AND 
  (D.CAPITOL_VERS    = :CAPITOL_VERS     OR :CAPITOL_VERS = -1  ) 
  AND D.FORM=57 
  AND D.CAPITOL IN 1092            
  AND D.ID_SCHEMA IN (2) 
  AND D.RIND IN ('010', '020', '040', '050', '060', '070')
  
 

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
  NVAL(SUM(L.COL1))  <>   NVAL(SUM(R.COL1))
  
  
 
  
  UNION 
  
  SELECT
DISTINCT 
  'Rind.'||(CASE WHEN R.RIND IS NULL THEN L.RIND  ELSE R.RIND END)||':   '|| SUM(NVAL(L.COL1)) ||' <> '|| SUM(NVAL(R.COL1)) AS REZULTAT
 
FROM 


(
SELECT 
D.CUIIO,
D.RIND,
SUM(D.COL2) AS COL1 
FROM

     CIS2.VW_DATA_ALL_FR D 
      
WHERE
  
  (D.PERIOADA IN(:PERIOADA-1))AND 
  (D.CUIIO           = :CUIIO          OR :CUIIO= -1)        AND 
  (:CUIIO_VERS       = :CUIIO_VERS     OR :CUIIO_VERS   <>  :CUIIO_VERS)  AND 
  (:FORM             = :FORM           OR :FORM  <>  :FORM )        AND 
  (:FORM_VERS        = :FORM_VERS      OR :FORM_VERS  <> :FORM_VERS)   AND 
  (:CAPITOL          = :CAPITOL        OR :CAPITOL  <> :CAPITOL  )   AND 
  (:CAPITOL_VERS     = :CAPITOL_VERS   OR :CAPITOL_VERS  <> :CAPITOL_VERS) 
  AND D.FORM = 63 
  AND D.CAPITOL = 1121
  AND D.RIND IN ('010', '020', '040', '050', '060', '070')

 
  GROUP BY
  D.CUIIO, 
  D.RIND 
 
HAVING  
  
 D.CUIIO IS NOT NULL
 
 
  ) L RIGHT JOIN (
  
  
  SELECT 
D.CUIIO,
D.RIND,
SUM(D.COL1) AS COL1 
FROM

     USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE_FR D 
     
     -- USER_BANCU.FOR_VALIDATE_FR D
      
WHERE
  
  (D.PERIOADA        =:PERIOADA          OR :PERIOADA = -1) AND
  (D.CUIIO           =:CUIIO             OR :CUIIO = -1) AND
  (D.CUIIO_VERS      = :CUIIO_VERS       OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM             OR :FORM = -1)        AND 
  (D.FORM_VERS       = :FORM_VERS        OR :FORM_VERS = -1)   AND 
  (D.CAPITOL         = :CAPITOL          OR :CAPITOL = -1  )   AND 
  (D.CAPITOL_VERS    = :CAPITOL_VERS     OR :CAPITOL_VERS = -1  ) 
  AND D.FORM=57 
  AND D.CAPITOL IN 1092            
  AND D.ID_SCHEMA IN (2) 
  AND D.RIND IN ('010', '020', '040', '050', '060', '070')
  
 

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
  NVAL(SUM(L.COL1))  <>   NVAL(SUM(R.COL1))
  
  
 
  
  
  
  
  
  