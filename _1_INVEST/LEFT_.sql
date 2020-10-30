
SELECT 

 DISTINCT  SUBSTR(MR.RIND, 1, 3) AS RIND, 
  DD.CUIIO, 
  
  NVAL(DD.COL1) AS TARA,
  NVAL(DD.COL4) AS COL4 
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
  
