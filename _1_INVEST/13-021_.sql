SELECT 

  D.CUIIO,   
  SUBSTR(MR.RIND, 1, 3) AS RIND, 
  MAX(D.COL1) AS TARA,
  MAX(D.COL4) AS COL4
FROM 
  CIS2.DATA_ALL D
  ---------------------
                INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
WHERE   
  (D.PERIOADA IN(:PERIOADA-1))AND 
  (D.CUIIO           = :CUIIO          OR :CUIIO= -1)        AND 
  (D.CUIIO_VERS      = :CUIIO_VERS     OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM           OR :FORM = -1)        AND 
  (D.FORM_VERS       = :FORM_VERS      OR :FORM_VERS = -1)   AND 
  (MR.CAPITOL         = :CAPITOL        OR :CAPITOL = -1  )   AND 
  (MR.CAPITOL_VERS    = :CAPITOL_VERS   OR :CAPITOL_VERS = -1) 
  AND D.FORM = 13 
  AND MR.CAPITOL = 337
  

   AND
  (
  
------------------------------------
SELECT
  DISTINCT
  D.CUIIO
FROM
  CIS2.DATA_ALL D
        INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)
        
WHERE
  (D.PERIOADA IN (:PERIOADA-1)) AND
  (D.CUIIO=:CUIIO               OR :CUIIO = -1) AND
  D.FORM  IN(13) AND     
  MR.CAPITOL IN(337)

-----------------------------------  

  
  ) IS NOT NULL
  
  
  GROUP BY 
  --D.COL1,
  D.CUIIO,   
  SUBSTR(MR.RIND, 1, 3)