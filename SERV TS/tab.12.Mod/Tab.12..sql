--INSERT INTO TABLE_OUT 
--(
--  PERIOADA,
--  FORM,
--  FORM_VERS,
--  ID_MDTABLE,
--  COD_CUATM,
--  NR_SECTIE,
--  NUME_SECTIE,
--  NR_SECTIE1,
--  NUME_SECTIE1,
--  NR_SECTIE2,
--  NUME_SECTIE2,
--  NR_ROW,
--  ORDINE,
--  DECIMAL_POS,
--  NUME_ROW,
--  
--  COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8
--)



SELECT                                                                     
--  :pPERIOADA AS PERIOADA,                                                    
--  :pFORM AS FORM,                                                            
--  :pFORM_VERS AS FORM_VERS,                                                  
--  :pID_MDTABLE AS ID_MDTABLE,                                                
--  :pCOD_CUATM AS COD_CUATM,                                                  
--  '0' AS NR_SECTIE,                                                         
--  '0' AS NUME_SECTIE,                                                        
--  '0' AS NR_SECTIE1,
--  '0' AS NUME_SECTIE1,
--  '0' AS NR_SECTIE2,
--  '0' AS NUME_SECTIE2,
   R.CUIIO||'~'||ROWNUM AS NR_ROW,  
   ROWNUM AS ORDINE,
  '00000000' AS DECIMAL_POS,
    
    R.DENUMIRE||'.'||'CUATM:'||R.CUATM||'.'||'CAEM2:'||R.CAEM2 DENUMIRE,
 
    TO_NUMBER(R.CUATM) AS COL1,
    SUBSTR(R.CAEM2,2,8)  AS COL2,    
    L.COL3 AS COL3,
    L.COL4   AS COL4,
    L.COL5   AS COL5,
    L.COL6   AS COL6,
    L.COL7   AS COL7,
    L.COL8   AS COL8      

FROM

(

SELECT     
           R.CUIIO,
           R.CUIIO_VERS,
           R.DENUMIRE,
           FC.FORM,
           R.CUATM,
           R.CFP,
           R.CFOJ,
           R.CAEM2
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (4) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (4) AND FC.STATUT <> '3') FC
             
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
                INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = R.CUATM
               
    WHERE
    1=1
     
     AND  C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' 
     
     ) R  LEFT JOIN (
     
     


SELECT                                                                     
 
   L.CUIIO,
    
     
    L.PACHET AS COL3,
    L.COL1   AS COL4,
    L.COL2   AS COL5,
    L.COL3   AS COL6,
    L.COL4   AS COL7,
    R.COL5   AS COL8      

FROM

(
SELECT
  MAX(DISTINCT CASE WHEN  D.FORM IN (4) AND D.CAPITOL IN (0)   THEN  D.CUIIO   END) CUIIO,
  MAX(DISTINCT CASE WHEN  D.FORM IN (4) AND D.CAPITOL IN (0)   THEN  R.DENUMIRE   END) DENUMIRE,
  MAX(DISTINCT CASE WHEN  D.FORM IN (4) AND D.CAPITOL IN (0)   THEN  R.CAEM2   END) CAEM2,
  
  MAX(DISTINCT CASE WHEN  D.FORM IN (4) AND D.CAPITOL IN (0)   THEN  R.CUATM   END) CUATM,
  MAX(DISTINCT CASE WHEN  D.FORM IN (4) AND D.CAPITOL IN (0)   THEN  D.PACHET   END) PACHET,
  
  SUM(CASE WHEN  (D.PERIOADA =:pPERIOADA-2) AND  D.FORM IN (4) AND D.CAPITOL IN (4) AND D.RIND IN ('10') THEN D.COL1  ELSE  NULL END) COL1,
  SUM(CASE WHEN  (D.PERIOADA =:pPERIOADA-1) AND  D.FORM IN (4) AND D.CAPITOL IN (4) AND D.RIND IN ('10') THEN D.COL1  ELSE  NULL END) COL2,
  SUM(CASE WHEN  (D.PERIOADA =:pPERIOADA) AND  D.FORM IN (4) AND D.CAPITOL IN (4) AND D.RIND IN ('10') THEN D.COL1  ELSE  NULL END) COL3,
    
  CIS.NVAL(SUM(CASE WHEN  (D.PERIOADA =:pPERIOADA-2) AND  D.FORM IN (4) AND D.CAPITOL IN (4) AND D.RIND IN ('10') THEN D.COL1  ELSE  NULL END)) +
  CIS.NVAL(SUM(CASE WHEN  (D.PERIOADA =:pPERIOADA-1) AND  D.FORM IN (4) AND D.CAPITOL IN (4) AND D.RIND IN ('10') THEN D.COL1  ELSE  NULL END)) + 
  CIS.NVAL(SUM(CASE WHEN  (D.PERIOADA =:pPERIOADA) AND  D.FORM IN (4) AND D.CAPITOL IN (4) AND D.RIND IN ('10') THEN D.COL1  ELSE  NULL END))     AS COL4   
FROM
  CIS.VW_DATA_ALL D 
  
  
       INNER JOIN CIS.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS
       INNER  JOIN CIS.VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        
        
  WHERE 
  
  ((D.PERIOADA IN (:pPERIOADA, :pPERIOADA - 1, :pPERIOADA - 2)) ) 
  
  
  
  AND 
  (D.FORM=:pFORM) AND
  (D.FORM_VERS=:pFORM_VERS) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (4) AND D.CAPITOL IN (0,4))
  
 -- AND D.CUIIO = 40339665

  GROUP BY 
  D.CUIIO

  
  
  ORDER BY
  D.CUIIO
  ) L  LEFT JOIN  (
  
  SELECT 

    D.CUIIO,
    CIS.NVAL(SUM(CASE WHEN  D.FORM IN (1) AND D.CAPITOL IN (2) AND D.RIND IN ('0100') THEN D.COL1  ELSE  NULL END))  AS COL5

FROM
  CIS.VW_DATA_ALL D 
  
            INNER JOIN (
            
            SELECT 
 P.ANUL,
 P.PERIOADA

FROM CIS.MD_PERIOADA P

inner join (
SELECT  
       P.ANUL,   
       P.PERIOADA,
       P.TIP_PERIOADA,
       P.NUM,
       CASE 
       when P.NUM =   9 then 3
       when P.NUM =   1 then 1
       when P.NUM =   6 then 2
       when P.NUM =   12 then 4
                END AS trim_NUM
                
                
           
           FROM CIS.MD_PERIOADA P 
            WHERE 
           P.PERIOADA = :pPERIOADA ) PP ON PP.trim_NUM = P.NUM 
                                    AND PP.ANUL = P.ANUL 
                                    AND P.TIP_PERIOADA = 5
           
           
            
            
            ) PP ON PP.ANUL = D.ANUL 
  
          
  WHERE 
  
  ((D.PERIOADA = PP.PERIOADA)) AND 
  (D.FORM = 1) AND
  (D.FORM_VERS = 1004) AND
  (:pID_MDTABLE=:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  
  (D.FORM IN (1) AND D.CAPITOL IN (2))
  
  
  GROUP BY
  
  D.CUIIO
  
  ) R ON R.CUIIO = L.CUIIO 
     
     ) L ON R.CUIIO = L.CUIIO 
     
     
     
--     GROUP BY 
--     
--      R.CUIIO,
--          
--           R.DENUMIRE,
--         
--           R.CUATM,
--         
--           R.CAEM2,
--           ROWNUM