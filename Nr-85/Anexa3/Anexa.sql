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
--  ORDINE,
--  NR_ROW,
--  NUME_ROW,
--  DECIMAL_POS,
--  COL1,
--  COL2,
--  COL3,
--  COL4,
--  COL5,
--  COL6,
--  COL7,
--  COL8,
--  COL9,
--  COL10,
--  COL11,
--  COL12,
--  COL13,
--  COL14,
--  COL15,
--  COL16,
--  COL17
--
-- 
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
  ROWNUM AS ORDINE,
  D.NR_ROW,
  D.NUME_ROW,
  '00000000000000000' AS DECIMAL_POS,
  CASE WHEN D.COL1 = 0 THEN NULL ELSE D.COL1  END COL1,
  CASE WHEN D.COL2 = 0 THEN NULL ELSE D.COL2  END COL2,
  CASE WHEN D.COL3 = 0 THEN NULL ELSE D.COL3  END COL3,
  CASE WHEN D.COL4 = 0 THEN NULL ELSE D.COL4  END COL4,
  CASE WHEN D.COL5 = 0 THEN NULL ELSE D.COL5  END COL5,
  CASE WHEN D.COL6 = 0 THEN NULL ELSE D.COL6  END COL6,
  CASE WHEN D.COL7 = 0 THEN NULL ELSE D.COL7  END COL7,
  CASE WHEN D.COL8 = 0 THEN NULL ELSE D.COL8  END COL8,
  CASE WHEN D.COL9 = 0 THEN NULL ELSE D.COL9 END COL9,
  CASE WHEN D.COL10 = 0 THEN NULL ELSE D.COL10 END COL10,
  CASE WHEN D.COL11 = 0 THEN NULL ELSE D.COL11 END COL11,
  CASE WHEN D.COL12 = 0 THEN NULL ELSE D.COL12  END COL12,
  CASE WHEN D.COL13 = 0 THEN NULL ELSE D.COL13 END COL13,
  CASE WHEN D.COL14 = 0 THEN NULL ELSE D.COL14 END COL14,
  CASE WHEN D.COL15 = 0 THEN NULL ELSE D.COL15  END COL15,
  CASE WHEN D.COL16 = 0 THEN NULL ELSE D.COL16  END COL16,
  CASE WHEN D.COL17 = 0 THEN NULL ELSE D.COL17  END COL17


FROM
  (
    SELECT * FROM
    (


SELECT 
ORDINE,
DATA_LEVEL,
NR_ROW,
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
COL11,
COL12,
COL13,
COL14,
COL15,
COL16,
COL17

        
FROM 
(
SELECT
        C.FULL_CODE AS ORDINE,
        2 AS DATA_LEVEL,
        C.CODUL||'~2' AS NR_ROW,
        '....'||C.DENUMIRE AS NUME_ROW,
       COUNT (DISTINCT D.CUIIO) AS  COL1,
        SUM(D.COL2) AS COL2,
        SUM(D.COL3) AS COL3,
        SUM(D.COL4) AS COL4,
        SUM(D.COL5) AS COL5,
        SUM(D.COL6) AS COL6,
        SUM(D.COL7) AS COL7,
        SUM(D.COL8) AS COL8,
        SUM(D.COL9) AS COL9,
        SUM(D.COL10) AS COL10,
        SUM(D.COL11) AS COL11,
        SUM(D.COL12) AS COL12,
        SUM(D.COL13) AS COL13,
        SUM(D.COL14) AS COL14,
        SUM(D.COL15) AS COL15,
        SUM(D.COL16) AS COL16,
        SUM(D.COL17) AS COL17
        
       
      FROM
        (


     SELECT D.PERIOADA,
            D.CUIIO,
            MAX (D.CUATM) AS CUATM,
            MAX (COL1) AS COL1,
            MAX (COL2) AS COL2,
            MAX (COL3) AS COL3,
            MAX (COL4) AS COL4,
            MAX (COL5) AS COL5,
            MAX (COL6) AS COL6,
            MAX (COL7) AS COL7,
            MAX (COL8) AS COL8,
            MAX (COL9) AS COL9,
            MAX (COL10) AS COL10,
            MAX (COL11) AS COL11,
            MAX (COL12) AS COL12,
            MAX (COL13) AS COL13,
            MAX (COL14) AS COL14,
            MAX (COL15) AS COL15,
            MAX (COL16) AS COL16,
            MAX (COL17) AS COL17
            
           
   

FROM 

(

               SELECT 
                      D.PERIOADA,
                      D.CUIIO,
                      D.CUATM,
                      NULL COL1,
                     ----------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1031 AND D.RIND IN ('01') THEN D.COL1 ELSE NULL END) AS COL2, -- COL1
                     -----------------------------------------------------------    
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1031 AND D.RIND IN ('02') THEN D.COL1 ELSE NULL END) AS COL3, --COL2
                      ---------------------------------------------------------
                    SUM ( CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1031 AND D.RIND IN ('03') THEN D.COL1 ELSE NULL END) AS COL4, --COL3
                      ----------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1031 AND D.RIND IN ('16') THEN D.COL1 ELSE NULL END) AS COL5,  --COL4
                    ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN D.COL14 ELSE NULL END) AS COL6,  --COL6
                      ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL3) + CIS2.NVAL(D.COL4) + CIS2.NVAL(D.COL5)  ELSE NULL END) AS COL7,  --COL6
                    ---------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN CIS2.NVAL(D.COL6) + CIS2.NVAL(D.COL7) + CIS2.NVAL(D.COL8) + CIS2.NVAL(D.COL9) + CIS2.NVAL(D.COL10) ELSE NULL END)AS COL8,  --COL7
                     ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN CIS2.NVAL(D.COL11) + CIS2.NVAL(D.COL12) ELSE NULL END) AS COL9,  --COL8
                    ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN D.COL13 ELSE NULL END)  AS COL10, --COL9
                    ----------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19')  THEN D.COL2 ELSE  NULL END) AS COL11,  --COL11
                    ---------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('20') THEN D.COL14 ELSE NULL END) AS COL12, --COL11
                    -----------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('21')  THEN CIS2.NVAL(D.COL14) ELSE NULL END) AS COL13, --COL12
                    ----------------------------------------------------------- 
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') AND R.NTII IN (40)    THEN  CIS2.NVAL(D.COL14) ELSE NULL END) AS COL14,
                    ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1026 AND D.RIND IN ('18')  THEN CIS2.NVAL(D.COL9) + CIS2.NVAL(D.COL12) ELSE NULL END) AS COL15,
                    ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1026 AND D.RIND IN ('18') THEN D.COL9 ELSE NULL END) AS COL16,
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1026 AND D.RIND IN ('18') THEN D.COL12 ELSE NULL END) AS COL17
                       
                      
                 FROM CIS2.VW_DATA_ALL D
                      INNER JOIN CIS2.RENIM R
                      
                         ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS AND  D.CUIIO NOT IN (7002551,37785680,3901743601,702899380))
                       
                       --ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS AND R.NTII NOT IN (50,60))
                         
                         
                WHERE 
                D.FORM IN (40) 
                AND (D.PERIOADA =:pPERIOADA)
              
            
             
             GROUP BY D.PERIOADA, D.CUIIO, D.CUATM
             
             ) D
             
             
             
             
             
             

   GROUP BY D.PERIOADA, D.CUIIO
   
   
   



) D
        INNER JOIN CIS2.VW_CL_CUATM C ON(D.CUATM=C.CODUL)
      WHERE 
        (D.PERIOADA =:pPERIOADA) AND 
        (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%')
        
        
         AND 
         
         (C.PRGS NOT IN ('4')
         AND  C.CODUL <>  '0101000')
         
         
      GROUP BY
        C.FULL_CODE,
        C.CODUL,
        C.DENUMIRE
        
        
       UNION ALL 
       
       SELECT
         '0000000;0100000;0101000;' AS ORDINE,
         2 AS DATA_LEVEL,
        '0101000'||'~2' AS NR_ROW,
        '....'||'OR.CHISINAU' AS NUME_ROW,
        COUNT (DISTINCT D.CUIIO) AS COL1,
        SUM(D.COL2) AS COL2,
        SUM(D.COL3) AS COL3,
        SUM(D.COL4) AS COL4,
        SUM(D.COL5) AS COL5,
        SUM(D.COL6) AS COL6,
        SUM(D.COL7) AS COL7,
        SUM(D.COL8) AS COL8,
        SUM(D.COL9) AS COL9,
        SUM(D.COL10) AS COL10,
        SUM(D.COL11) AS COL11,
        SUM(D.COL12) AS COL12,
        SUM(D.COL13) AS COL13,
        SUM(D.COL14) AS COL14,
        SUM(D.COL15) AS COL15,
        SUM(D.COL16) AS COL16,
        SUM(D.COL17) AS COL17
        
       
      FROM
        (


     SELECT D.PERIOADA,
            D.CUIIO,
            MAX (D.CUATM) AS CUATM,
            MAX (COL1) AS COL1,
            MAX (COL2) AS COL2,
            MAX (COL3) AS COL3,
            MAX (COL4) AS COL4,
            MAX (COL5) AS COL5,
            MAX (COL6) AS COL6,
            MAX (COL7) AS COL7,
            MAX (COL8) AS COL8,
            MAX (COL9) AS COL9,
            MAX (COL10) AS COL10,
            MAX (COL11) AS COL11,
            MAX (COL12) AS COL12,
            MAX (COL13) AS COL13,
            MAX (COL14) AS COL14,
            MAX (COL15) AS COL15,
            MAX (COL16) AS COL16,
            MAX (COL17) AS COL17
            
           
   

FROM 

(

               SELECT 
                      D.PERIOADA,
                      D.CUIIO,
                      D.CUATM,
                      NULL COL1,
                     ----------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1031 AND D.RIND IN ('01') THEN D.COL1 ELSE NULL END) AS COL2, -- COL1
                     -----------------------------------------------------------    
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1031 AND D.RIND IN ('02') THEN D.COL1 ELSE NULL END) AS COL3, --COL2
                      ---------------------------------------------------------
                    SUM ( CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1031 AND D.RIND IN ('03') THEN D.COL1 ELSE NULL END) AS COL4, --COL3
                      ----------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1031 AND D.RIND IN ('16') THEN D.COL1 ELSE NULL END) AS COL5,  --COL4
                    ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN D.COL14 ELSE NULL END) AS COL6,  --COL6
                      ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL3) + CIS2.NVAL(D.COL4) + CIS2.NVAL(D.COL5)  ELSE NULL END) AS COL7,  --COL6
                    ---------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN CIS2.NVAL(D.COL6) + CIS2.NVAL(D.COL7) + CIS2.NVAL(D.COL8) + CIS2.NVAL(D.COL9) + CIS2.NVAL(D.COL10) ELSE NULL END)AS COL8,  --COL7
                     ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN CIS2.NVAL(D.COL11) + CIS2.NVAL(D.COL12) ELSE NULL END) AS COL9,  --COL8
                    ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN D.COL13 ELSE NULL END)  AS COL10, --COL9
                    ----------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19')  THEN D.COL2 ELSE  NULL END) AS COL11,  --COL11
                    ---------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('20') THEN D.COL14 ELSE NULL END) AS COL12, --COL11
                    -----------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('21')  THEN CIS2.NVAL(D.COL14) ELSE NULL END) AS COL13, --COL12
                    ----------------------------------------------------------- 
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') AND R.NTII IN (40)    THEN  CIS2.NVAL(D.COL14) ELSE NULL END) AS COL14,
                    ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1026 AND D.RIND IN ('18')  THEN CIS2.NVAL(D.COL9) + CIS2.NVAL(D.COL12) ELSE NULL END) AS COL15,
                    ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1026 AND D.RIND IN ('18') THEN D.COL9 ELSE NULL END) AS COL16,
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1026 AND D.RIND IN ('18') THEN D.COL12 ELSE NULL END) AS COL17
                       
                      
                 FROM CIS2.VW_DATA_ALL D
                      INNER JOIN CIS2.RENIM R
                      
                         ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS AND  D.CUIIO NOT IN (7002551,37785680,3901743601,702899380))
                       
                       --ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS AND R.NTII NOT IN (50,60))
                         
                         
                WHERE 
                D.FORM IN (40) 
                AND (D.PERIOADA =:pPERIOADA)
              
            
             
             GROUP BY D.PERIOADA, D.CUIIO, D.CUATM
             
             ) D
             
             
             
             
             
             

   GROUP BY D.PERIOADA, D.CUIIO
   
   
   



) D
        INNER JOIN CIS2.VW_CL_CUATM C ON(D.CUATM=C.CODUL)
      WHERE 
        (D.PERIOADA =:pPERIOADA) AND 
        (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%')
        
         AND 
         
         (C.PRGS IN ('4')
         OR C.CODUL = '0101000'
         
         )
          
      

ORDER BY 
ORDINE

)
        
        
       UNION ALL 

-- Total, Zone and Raion Level --
      SELECT
        CG.FULL_CODE AS ORDINE,
        1 AS DATA_LEVEL,
        CG.CODUL AS NR_ROW,
        CG.DENUMIRE AS NUME_ROW,
        COUNT (DISTINCT D.CUIIO) AS COL1,
        SUM(D.COL2) AS COL2,
        SUM(D.COL3) AS COL3,
        SUM(D.COL4) AS COL4,
        SUM(D.COL5) AS COL5,
        SUM(D.COL6) AS COL6,
        SUM(D.COL7) AS COL7,
        SUM(D.COL8) AS COL8,
        SUM(D.COL9) AS COL9,
        SUM(D.COL10) AS COL10,
        SUM(D.COL11) AS COL11,
        SUM(D.COL12) AS COL12,
        SUM(D.COL13) AS COL13,
        SUM(D.COL14) AS COL14,
        SUM(D.COL15) AS COL15,
        SUM(D.COL16) AS COL16,
        SUM(D.COL17) AS COL17
      
      
       
      FROM
        (--


     SELECT D.PERIOADA,
            D.CUIIO,
            MAX (D.CUATM) AS CUATM,
            MAX (COL1) AS COL1,
            MAX (COL2) AS COL2,
            MAX (COL3) AS COL3,
            MAX (COL4) AS COL4,
            MAX (COL5) AS COL5,
            MAX (COL6) AS COL6,
            MAX (COL7) AS COL7,
            MAX (COL8) AS COL8,
            MAX (COL9) AS COL9,
            MAX (COL10) AS COL10,
            MAX (COL11) AS COL11,
            MAX (COL12) AS COL12,
            MAX (COL13) AS COL13,
            MAX (COL14) AS COL14,
            MAX (COL15) AS COL15,
            MAX (COL16) AS COL16,
            MAX (COL17) AS COL17
           
           
   

FROM 

(

                    SELECT 
                      D.PERIOADA,
                      D.CUIIO,
                      D.CUATM,
                      NULL COL1,
                     ----------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1031 AND D.RIND IN ('01') THEN D.COL1 ELSE NULL END) AS COL2, -- COL1
                     -----------------------------------------------------------    
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1031 AND D.RIND IN ('02') THEN D.COL1 ELSE NULL END) AS COL3, --COL2
                      ---------------------------------------------------------
                    SUM ( CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1031 AND D.RIND IN ('03') THEN D.COL1 ELSE NULL END) AS COL4, --COL3
                      ----------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1031 AND D.RIND IN ('16') THEN D.COL1 ELSE NULL END) AS COL5,  --COL4
                    ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN D.COL14 ELSE NULL END) AS COL6,  --COL6
                      ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL3) + CIS2.NVAL(D.COL4) + CIS2.NVAL(D.COL5)  ELSE NULL END) AS COL7,  --COL6
                    ---------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN CIS2.NVAL(D.COL6) + CIS2.NVAL(D.COL7) + CIS2.NVAL(D.COL8) + CIS2.NVAL(D.COL9) + CIS2.NVAL(D.COL10) ELSE NULL END)AS COL8,  --COL7
                     ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN CIS2.NVAL(D.COL11) + CIS2.NVAL(D.COL12) ELSE NULL END) AS COL9,  --COL8
                    ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') THEN D.COL13 ELSE NULL END)  AS COL10, --COL9
                    ----------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19')  THEN D.COL2 ELSE  NULL END) AS COL11,  --COL11
                    ---------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('20') THEN D.COL14 ELSE NULL END) AS COL12, --COL11
                    -----------------------------------------------------------
                    SUM (CASE WHEN D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('21')  THEN CIS2.NVAL(D.COL14) ELSE NULL END) AS COL13, --COL12
                    ----------------------------------------------------------- 
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1022 AND D.RIND IN ('19') AND R.NTII IN (40)    THEN  CIS2.NVAL(D.COL14) ELSE NULL END) AS COL14,
                    ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1026 AND D.RIND IN ('18')  THEN CIS2.NVAL(D.COL9) + CIS2.NVAL(D.COL12) ELSE NULL END) AS COL15,
                    ---------------------------------------------------------
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1026 AND D.RIND IN ('18') THEN D.COL9 ELSE NULL END) AS COL16,
                    SUM (CASE WHEN  D.FORM IN (40) AND D.CAPITOL = 1026 AND D.RIND IN ('18') THEN D.COL12 ELSE NULL END) AS COL17
                      
                     
                      
                     
                       
                      
                 FROM CIS2.VW_DATA_ALL D
                      INNER JOIN CIS2.RENIM R
              
                 ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS AND  D.CUIIO NOT IN (7002551,37785680,3901743601,702899380))
               



                         
                         
                WHERE 
                D.FORM IN (40) 
              AND (D.PERIOADA =:pPERIOADA)
            
             
             GROUP BY D.PERIOADA, D.CUIIO, D.CUATM
             

             
             ) D
             
             
             
             
             
             

   GROUP BY D.PERIOADA, D.CUIIO
   
   
   



) D
        INNER JOIN CIS2.VW_CL_CUATM C ON(D.CUATM=C.CODUL)
        INNER JOIN CIS2.VW_CL_CUATM CG ON(C.FULL_CODE LIKE '%'||CG.CODUL||';%')
      WHERE 
        (D.PERIOADA =:pPERIOADA) AND 
        (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%')
        AND 
        (
          (CG.CODUL IN('0000000', '0100000', '0501000', '9600000')) OR
          (CG.CODUL IN('1111111', '2222222', '3333333')) OR
          (CG.FULL_CODE NOT LIKE '%0100000%' AND CG.FULL_CODE NOT LIKE '%9600000%' AND LENGTH(CG.FULL_CODE)=(8*3))
        )
      GROUP BY
        CG.FULL_CODE,
        CG.CODUL,
        CG.DENUMIRE
        
       ) DT
    ORDER BY
      DT.ORDINE,
      DT.DATA_LEVEL
  ) D 
     
        
        
        