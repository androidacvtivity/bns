SELECT 
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
  D.RIND
  