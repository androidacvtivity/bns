DECLARE -- ====================================================================

  CURSOR C IS
  SELECT
    :pCOD_CUATM AS pCOD_CUATM
  FROM
    DUAL;

BEGIN -- ======================================================================
  FOR CR IN C
  LOOP
   IF CR.pCOD_CUATM = '0000000' THEN
   
   
   INSERT INTO  TABLE_OUT
    (
      
  PERIOADA,
  FORM,
  FORM_VERS,
  ID_MDTABLE,
  COD_CUATM,
  NR_SECTIE,
  NUME_SECTIE,
  NR_SECTIE1,
  NUME_SECTIE1,
  NR_SECTIE2,
  NUME_SECTIE2,
  NR_ROW,
  ORDINE,
  DECIMAL_POS,
  NUME_ROW,  
  COL1,COL2, COL3, COL4
  
    )

SELECT 
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
          A.COL1 ||'~'||ROWNUM AS NR_ROW, 
          ROWNUM ORDINE,
          '0001' AS DECIMAL_POS,                     
          A.DENUMIRE NUME_ROW,
          A.COL2 AS COL1,
          A.COL3 AS COL2 ,
          A.COL4 AS COL3,
          A.COL5 AS COL4 
          FROM   

          (  
          SELECT 
          
          CTT.CODUL,
          CTT.DENUMIRE,
          SUM(CASE WHEN  MR.CAPITOL IN (416) THEN  D.COL1 ELSE NULL END  ) AS COL1,
          SUM(CASE WHEN  MR.CAPITOL IN (416) THEN   D.COL16 ELSE NULL END  ) AS COL2,
          
         -- (SUM(D.COL1) + SUM(D.COL16))/2 AS COL3,
          
          SUM(CASE WHEN  MR.CAPITOL IN (416) THEN  (NVAL(D.COL16) + NVAL(D.COL1)) /2   ELSE NULL END  ) AS COL3,
          
          SUM(CASE WHEN  MR.CAPITOL IN (417) THEN D.COL2 ELSE NULL END  ) AS COL4,
          
          ROUND(SUM(D.COL2)  / ((SUM(D.COL1) + SUM(D.COL16))/2),1) AS COL5 
          
          
              
        FROM DATA_ALL_GC D 
                 
                 
                 
                 
                        INNER JOIN CIS2.MD_RIND MR  ON (MR.ID_MD =  D.ID_MD)
                        
                
                        
          
               INNER JOIN REG_UNIT_GC RN
                ON     D.UNIT_CODE = RN.UNIT_CODE
                AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                AND D.NR_GOSP = RN.NR_GOSP
                AND D.NR_MAPS = RN.NR_MAPS
                
                INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL 
                INNER JOIN CIS2.VW_CL_CUATM CTT ON CT.FULL_CODE LIKE '%'||CTT.CODUL||';%'   
                    

            WHERE 
                        
                   -- D.PERIOADA IN (:pPERIOADA )) AND
                   (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   MR.CAPITOL IN (417,416)
                   
                   AND MR.RIND IN ('061')
                   
                   
                   
                   
                   AND CTT.PRGS IN (2)
                   
       --            AND CTT.CODUL IN ('6700000')
                   
                   GROUP BY 
                  CTT.CODUL,
                  CTT.DENUMIRE, 
                  CTT.FULL_CODE
                  
                  ORDER BY 
                  CTT.FULL_CODE
                  ) A
                           

;
   ELSE
     INSERT INTO TABLE_OUT
(
  PERIOADA,
  FORM,
  FORM_VERS,
  ID_MDTABLE,
  COD_CUATM,
  NR_SECTIE,
  NUME_SECTIE,
  NR_SECTIE1,
  NUME_SECTIE1,
  NR_SECTIE2,
  NUME_SECTIE2,
  NR_ROW,
  ORDINE,
  DECIMAL_POS,
  NUME_ROW,  
COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, COL10, COL11
)

SELECT
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
ORDINE  AS NR_ROW,
ORDINE,
'00000000000' AS DECIMAL_POS, 
NUME_ROW,

COL1,
COL2,
COL3,
COL4,
COL5,
COL6,
COL7,
COL8,
COL9,
COL10,
COL11



FROM
(
SELECT 
  RE.CUIIO AS ORDINE,
  RE.DENUMIRE AS NUME_ROW,
  SUM(CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL3))  AS COL1,
    SUM(CIS2.NVAL(D.COL4) + CIS2.NVAL(D.COL2) )  AS COL2,
    ROUND(SUM(CIS2.NVAL(D.COL4) + CIS2.NVAL(D.COL2)) / CIS2.NOZERO(SUM(CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL3))),2) AS COL3,  
    SUM( CIS2.NVAL(D.COL1))  AS COL4,
    SUM( CIS2.NVAL(D.COL2))  AS COL5, 
    ROUND(SUM( CIS2.NVAL(D.COL2)) / CIS2.NOZERO(SUM(CIS2.NVAL(D.COL1))),2) AS COL6, 
    SUM(CIS2.NVAL(D.COL3))  AS COL7,
    SUM(CIS2.NVAL(D.COL4))  AS COL8, 
    ROUND(SUM(CIS2.NVAL(D.COL4)) / CIS2.NOZERO(SUM(CIS2.NVAL(D.COL3))),2) AS COL9, 
    SUM( CIS2.NVAL(D.COL5) )  AS COL10, 
    SUM(CIS2.NVAL(D.COL6) )  AS COL11 
FROM 
  CIS2.VW_DATA_ALL D
  INNER JOIN CIS2.RENIM RE ON (D.CUIIO=RE.CUIIO AND D.CUIIO_VERS=RE.CUIIO_VERS)
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (53)                 AND 
  D.CAPITOL IN (1074) AND
  D.RIND IN ('183') 
GROUP BY
  RE.CUIIO,
  RE.DENUMIRE
  
  UNION
SELECT 
  0 AS ORDINE,
  'TOTAL' AS NUME_ROW,
  SUM(CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL3))  AS COL1,
    SUM(CIS2.NVAL(D.COL4) + CIS2.NVAL(D.COL2) )  AS COL2,
    ROUND(SUM(CIS2.NVAL(D.COL4) + CIS2.NVAL(D.COL2)) / CIS2.NOZERO(SUM(CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL3))),2) AS COL3,  
    SUM( CIS2.NVAL(D.COL1))  AS COL4,
    SUM( CIS2.NVAL(D.COL2))  AS COL5, 
    ROUND(SUM( CIS2.NVAL(D.COL2)) / CIS2.NOZERO(SUM(CIS2.NVAL(D.COL1))),2) AS COL6, 
    SUM(CIS2.NVAL(D.COL3))  AS COL7,
    SUM(CIS2.NVAL(D.COL4))  AS COL8, 
    ROUND(SUM(CIS2.NVAL(D.COL4)) / CIS2.NOZERO(SUM(CIS2.NVAL(D.COL3))),2) AS COL9, 
    SUM( CIS2.NVAL(D.COL5) )  AS COL10, 
    SUM( ROUND(CIS2.NVAL(D.COL6),2)   )  AS COL11 
FROM 
  CIS2.VW_DATA_ALL D
 -- INNER JOIN CIS2.RENIM RE ON (D.CUIIO=RE.CUIIO AND D.CUIIO_VERS=RE.CUIIO_VERS)
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
 D.FORM IN (53)                 AND 
  D.CAPITOL IN (1074) AND
  D.RIND IN ('183') 
  )
;
   END IF;
  END LOOP;
END; -- =======================================================================