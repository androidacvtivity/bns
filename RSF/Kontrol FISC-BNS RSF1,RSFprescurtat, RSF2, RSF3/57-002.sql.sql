SELECT 
D.CUIIO,
D.RIND,
SUM(CASE WHEN D.CAPITOL IN (1090)  AND D.RIND NOT IN ('550','560','570','580') THEN  D.COL1 ELSE NULL END ) AS COL1 
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
  D.RIND
  