
SELECT 

    ID_MDTABLE,
    PERIOADA,
    COD_CUATM,
    NR_SECTIE,
    NR_SECTIE1,
    NR_SECTIE2,
    NR_ROW

FROM 
(


SELECT DISTINCT 
  :pPERIOADA AS PERIOADA,                                                    
  :pFORM AS FORM,                                                            
  :pFORM_VERS AS FORM_VERS,                                                  
  :pID_MDTABLE AS ID_MDTABLE,                                                
  :pCOD_CUATM AS COD_CUATM,                                                  
  '0' AS NR_SECTIE,                                                         
  '0' AS NUME_SECTIE,                                                        
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
   FC.CUIIO AS NR_ROW,  
   FC.CUIIO AS ORDINE,
   
   FC.DENUMIRE||'CUATM '||FC.CUATM ||' CAEM: '||FC.CAEM2||')' AS NUME_ROW,
   SUBSTR(FC.CAEM2,2,4) AS COL1,

 SUM(CASE WHEN D.PERIOADA IN :pPERIOADA AND D.CUIIO = FC.CUIIO AND D.CAPITOL IN (0) AND D.RIND IN ('01','02','03','04','05','06','07') THEN TO_NUMBER(D.RIND) ELSE 0 END) AS COL2,
 SUM(CASE WHEN D.PERIOADA IN :pPERIOADA AND D.CUIIO = FC.CUIIO AND D.CAPITOL IN (0) AND D.RIND IN ('CD','(CD)') THEN D.COL1 ELSE 0 END) AS COL3,
 SUM(DISTINCT CASE WHEN D.PERIOADA IN :pPERIOADA AND D.CUIIO = FC.CUIIO AND D.CAPITOL IN (0) THEN D.PACHET ELSE 0 END) AS COL4,
  
   SUM(CASE WHEN D.CUIIO = FC.CUIIO AND D.CAPITOL IN (4) AND D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA AND D.RIND IN '10' THEN D.COL1 ELSE 0 END) AS COL5,
  
   SUM(CASE WHEN D.CUIIO = FC.CUIIO AND D.CAPITOL IN (4) AND D.PERIOADA IN :pPERIOADA AND D.RIND IN '10' THEN D.COL1 ELSE 0 END) AS COL6,
    
   SUM(CASE WHEN D.CUIIO = FC.CUIIO AND D.CAPITOL IN (4) AND D.PERIOADA IN :pPERIOADA-1 AND D.RIND IN '10' THEN D.COL1 ELSE 0 END) AS COL7
 
 

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
               ) FC
               
               LEFT JOIN CIS.VW_DATA_ALL D ON (D.FORM =  FC.FORM AND D.CUIIO = FC.CUIIO AND D.CUIIO_VERS  = FC.CUIIO_VERS)
               
               
WHERE
  (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
  D.FORM = 4 AND
  
  (  D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA-1 )
AND 
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.CAPITOL IN (0,4)
  
 GROUP BY
  FC.DENUMIRE,
  FC.CUATM,
  FC.CUIIO,
  FC.CAEM2
  
  )
  
  
  GROUP BY 
  
    ID_MDTABLE,
    PERIOADA,
    COD_CUATM,
    NR_SECTIE,
    NR_SECTIE1,
    NR_SECTIE2,
    NR_ROW
  
  HAVING 
  
  COUNT (DISTINCT ID_MDTABLE||PERIOADA||COD_CUATM||NR_SECTIE||NR_SECTIE1||NR_SECTIE2||NR_ROW ) > 1