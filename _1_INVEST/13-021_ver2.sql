
SELECT 

   'Rind.'||L.COL1||', Tara. '||L.COL2||': '||L.REZULTAT ||' <= '|| R.REZULTAT  AS REZULTAT 
   
   FROM
---------------------
(

SELECT 
 
  DD.CUIIO, 
  SUBSTR(MR.RIND, 1, 3) AS COL1, 
  NVAL(DD.COL1) AS COL2,
  MAX(CASE WHEN DD.PERIOADA IN (:PERIOADA) AND  MP.NUM IN (2,3,4)  THEN NVAL(DD.COL4) ELSE 0 END)  AS REZULTAT
 FROM 
     USER_EREPORTING.DATA_ALL_FOR_VALIDATE DD
                                        INNER JOIN USER_EREPORTING.MD_RIND MR ON (MR.ID_MD =  DD.ID_MD) 
                                        INNER JOIN USER_EREPORTING.MD_PERIOADA MP ON MP.PERIOADA = DD.PERIOADA AND  MP.TIP_PERIOADA = 5    
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
  -----------------------------

  
  GROUP BY 
  DD.CUIIO, 
  SUBSTR(MR.RIND, 1, 3), 
  DD.COL1
  )  L LEFT JOIN (
  
  SELECT 

   D.CUIIO,  
  SUBSTR(MR.RIND, 1, 3) AS COL1, 
  NVAL(D.COL1) AS COL2,
 MAX(CASE WHEN D.PERIOADA IN (:PERIOADA-1)   THEN NVAL(D.COL4) ELSE 0 END)  AS REZULTAT
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
  
  
  
 GROUP BY 
 D.CUIIO, 
  SUBSTR(MR.RIND, 1, 3), 
  D.COL1
  
  )   R ON (R.COL1 = L.COL1  AND R.COL2 = L.COL2  AND L.CUIIO = R.CUIIO)  
  
   GROUP BY 
        L.COL1,
        R.COL1,
        L.COL2,
        L.COL2,
        L.REZULTAT,
        R.REZULTAT,
        R.CUIIO 
        
        HAVING 
        1=1
        
        AND L.REZULTAT < R.REZULTAT
        
        AND R.CUIIO IS NOT NULL 
        
       