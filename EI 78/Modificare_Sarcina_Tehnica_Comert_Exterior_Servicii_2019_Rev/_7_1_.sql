
SELECT
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE, 
    SUM(COL1) AS COL1,
    SUM(COL2) AS COL2,
    SUM(COL3) AS COL3,
    SUM(COL4) AS COL4,
    NULL AS COL5,
    NULL AS COL6
   

FROM
(

SELECT
    D.PERIOADA, 
    CC.CODUL,
    CC.FULL_CODE,
    CC.DENUMIRE DENUMIRE_CUATM,
    D.CUIIO,
    R.DENUMIRE DENUMIRE_CUIIO, 
    MR.RIND,
    SS.DENUMIRE,
    7||'_'||D.COL1 AS ORDINE, 
    D.COL1 AS COL1,
    NULL AS COL2,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) COL3,
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 END) / CR.COL1 COL4,
    NULL AS COL5,
    
    NULL AS COL6

FROM CIS2.DATA_ALL D 
        
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
        INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
        INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
        INNER  JOIN VW_CL_CUATM CT ON R.CUATM = CT.CODUL
        INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
        
        
        -------------------------------------------------------------------------------
        LEFT JOIN (
         SELECT
            D.PERIOADA, 
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN CIS2.MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND              
                              D.FORM IN (101)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10002)
                              AND MR.RIND IN ('01') 
                              
                              GROUP BY
                              D.PERIOADA
                              
                              ) CR ON (D.PERIOADA=CR.PERIOADA)
        ------------------------------------------------------------------------------   
        INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
        
        
   WHERE 
 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND     
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44) AND
  MR.CAPITOL IN (406)
  AND MR.RIND NOT  IN ('1')
  -------------------------------------------------
  GROUP BY 
  D.PERIOADA,
  CC.CODUL,
  CC.FULL_CODE,
  CC.DENUMIRE, 
  D.CUIIO,
  R.DENUMIRE,
  MR.RIND,
  SS.DENUMIRE,
 
  D.COL1,
  D.COL3,
  CR.COL1
  
  )
  
  GROUP BY 
    CODUL,
    FULL_CODE,
    DENUMIRE_CUATM,
    CUIIO,
    DENUMIRE_CUIIO, 
    RIND,
    DENUMIRE,
    ORDINE