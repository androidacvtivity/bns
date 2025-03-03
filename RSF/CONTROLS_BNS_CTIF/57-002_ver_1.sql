SELECT DISTINCT

SUM(CASE WHEN D.PERIOADA IN (:PERIOADA)   THEN NVAL(D.COL1) ELSE 0 END) ||'<>'||
SUM(CASE WHEN D.PERIOADA IN (:PERIOADA-1) THEN NVAL(D.COL1) ELSE 0 END)
AS REZULTAT 
FROM
(
SELECT DISTINCT 
  SUM(D.COL2) AS COL1,
  D.PERIOADA
FROM 
  CIS2.VW_DATA_ALL_FR D
WHERE   
  (D.PERIOADA IN(:PERIOADA-1))AND 
  (D.CUIIO           = :CUIIO          OR :CUIIO= -1)        AND 
  (:CUIIO_VERS       = :CUIIO_VERS     OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM           OR :FORM = -1)        AND 
  (D.FORM_VERS       = :FORM_VERS      OR :FORM_VERS = -1)   AND 
  (:CAPITOL          = :CAPITOL        OR :CAPITOL = -1  )   AND 
  (:CAPITOL_VERS     = :CAPITOL_VERS   OR :CAPITOL_VERS = -1) 
  AND D.FORM = 57 
 -- AND D.ID_MD IN (44593,44594,44595,44596)
  AND D.RIND IN ('550','560','570','580')

  GROUP BY D.PERIOADA
--  
UNION

SELECT DISTINCT 

 SUM(DD.COL1) AS COL1,
 DD.PERIOADA
 FROM
-- CIS2.VW_DATA_ALL_FR DD
 USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE_FR DD 
WHERE
  (DD.PERIOADA IN(:PERIOADA))AND 
  (DD.CUIIO           = :CUIIO          OR :CUIIO= -1)        AND 
  (:CUIIO_VERS        = :CUIIO_VERS     OR :CUIIO_VERS = -1)  AND 
  (DD.FORM            = :FORM           OR :FORM = -1)        AND 
  (DD.FORM_VERS       = :FORM_VERS      OR :FORM_VERS = -1)   AND 
  (DD.CAPITOL         = :CAPITOL        OR :CAPITOL = -1  )   AND 
  (DD.CAPITOL_VERS    = :CAPITOL_VERS   OR :CAPITOL_VERS = -1) 
  AND DD.FORM = 57 
  AND DD.CAPITOL = 1090              
  AND DD.ID_SCHEMA IN (2) 
  AND DD.RIND IN ('560')
  GROUP BY DD.PERIOADA
  
  
  )D
  
  HAVING
 
SUM(CASE WHEN D.PERIOADA IN (:PERIOADA)   THEN D.COL1 ELSE NULL END) <> 
SUM(CASE WHEN D.PERIOADA IN (:PERIOADA-1) THEN D.COL1 ELSE NULL END)


 