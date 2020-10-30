SELECT DISTINCT
'Rind.'||SUBSTR(A.RIND, 1, 3)||', Tara. '||A.TARA||':  '||

MAX(CASE WHEN DD.CAPITOL IN (337)  AND DD.PERIOADA= :PERIOADA   AND SUBSTR(DD.RIND,1,3) IN (A.RIND) AND NVAL(DD.COL1) IN (NVAL(A.TARA)) THEN DD.COL4 ELSE 0 END) ||'< '||
MAX(CASE WHEN D.CAPITOL IN (337)   AND D.PERIOADA = :PERIOADA-1 AND SUBSTR(D.RIND,1,3)  IN (A.RIND) AND NVAL(D.COL1)  IN (NVAL(A.TARA)) THEN D.COL4 ELSE 0 END)


AS REZULTAT 

 ---------------------

FROM
(
SELECT
  DISTINCT
  RIND,
  TARA
FROM
(

SELECT DISTINCT 
  SUBSTR(MR.RIND, 1, 3) AS RIND, 
  D.COL1 AS TARA
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
  
-----------------------------------------------------------  
----------------------------------------------------------
    --VERIFICARE  LIPSA CUIIO IN CIS PERIOADA -1  --
   AND
  (
  
--------------------------------------
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
  
  UNION
  
SELECT DISTINCT 
  SUBSTR(MR.RIND, 1, 3) AS RIND, 
  DD.COL1 AS TARA
 FROM 
     USER_EREPORTING.DATA_ALL_FOR_VALIDATE DD
                                        INNER JOIN USER_EREPORTING.MD_RIND MR ON (MR.ID_MD =  DD.ID_MD)       
WHERE
  (DD.PERIOADA IN(:PERIOADA))AND 
  (DD.CUIIO           = :CUIIO          OR :CUIIO= -1)        AND 
  (DD.CUIIO_VERS      = :CUIIO_VERS     OR :CUIIO_VERS = -1)  AND 
  (DD.FORM            = :FORM           OR :FORM = -1)        AND 
  (DD.FORM_VERS       = :FORM_VERS      OR :FORM_VERS = -1)   AND 
  (MR.CAPITOL         = :CAPITOL        OR :CAPITOL = -1  )   AND 
  (MR.CAPITOL_VERS    = :CAPITOL_VERS   OR :CAPITOL_VERS = -1) 
  AND DD.FORM = 13 
  AND MR.CAPITOL = 337              
  AND  DD.ID_SCHEMA IN (2) 
  
  
  )
  ) A  LEFT JOIN (SELECT D.CUIIO,
                   D.PERIOADA, 
                   D.CUIIO_VERS,
                   D.FORM,
                   D.FORM_VERS,
                   D.COL1,
                   D.COL4,
                     
                   MR.CAPITOL,
                   MR.CAPITOL_VERS,
                   MR.RIND
            
                    FROM CIS2.DATA_ALL D 
                            INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD ) D ON (A.RIND=SUBSTR(D.RIND,1,3) AND (D.PERIOADA IN(:PERIOADA-1))AND 
  (D.CUIIO           = :CUIIO          OR :CUIIO= -1)        AND 
  (D.CUIIO_VERS      = :CUIIO_VERS     OR :CUIIO_VERS = -1)  AND 
  (D.FORM            = :FORM           OR :FORM = -1)        AND 
  (D.FORM_VERS       = :FORM_VERS      OR :FORM_VERS = -1)   AND 
  (D.CAPITOL         = :CAPITOL        OR :CAPITOL = -1  )   AND 
  (D.CAPITOL_VERS    = :CAPITOL_VERS   OR :CAPITOL_VERS = -1) 
  AND D.FORM = 13 
  AND D.CAPITOL = 337) 


LEFT JOIN (
-------------------------------------
SELECT D.CUIIO,
                   D.PERIOADA, 
                   D.CUIIO_VERS,
                   D.FORM,
                   D.FORM_VERS,
                   D.COL1,
                   D.COL4,
                   D.ID_SCHEMA,
                   D.NUM,
                     
                   MR.CAPITOL,
                   MR.CAPITOL_VERS,
                   MR.RIND
            
                   FROM USER_EREPORTING.VW_DATA_ALL_FOR_VALIDATE D 
                        
                       INNER JOIN USER_EREPORTING.MD_RIND MR ON MR.ID_MD = D.ID_MD
-------------------------------------




) DD ON (A.RIND=SUBSTR(DD.RIND,1,3) AND
  (DD.PERIOADA IN(:PERIOADA))AND 
  (DD.CUIIO           = :CUIIO          OR :CUIIO= -1)        AND 
  (DD.CUIIO_VERS      = :CUIIO_VERS     OR :CUIIO_VERS = -1)  AND 
  (DD.FORM            = :FORM           OR :FORM = -1)        AND 
  (DD.FORM_VERS       = :FORM_VERS      OR :FORM_VERS = -1)   AND 
  (DD.CAPITOL         = :CAPITOL        OR :CAPITOL = -1  )   AND 
  (DD.CAPITOL_VERS    = :CAPITOL_VERS   OR :CAPITOL_VERS = -1) 
  AND DD.FORM = 13 
  AND DD.CAPITOL = 337              
  AND  DD.ID_SCHEMA IN (2) )
  
  GROUP BY
  A.RIND,
  A.TARA,
  DD.NUM
  
  HAVING
  MAX(CASE WHEN D.CAPITOL IN (337)   AND D.PERIOADA = :PERIOADA-1 AND SUBSTR(D.RIND,1,3)  IN (A.RIND) AND NVAL(D.COL1)  IN (NVAL(A.TARA)) THEN D.COL4 ELSE 0 END) >
  MAX(CASE WHEN DD.CAPITOL IN (337)  AND DD.PERIOADA= :PERIOADA   AND SUBSTR(DD.RIND,1,3) IN (A.RIND) AND NVAL(DD.COL1) IN (NVAL(A.TARA)) THEN DD.COL4 ELSE 0 END)
  AND DD.NUM IN (2,3,4)
   AND
  (
 
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
  
  
  ) IS NOT NULL
  
  