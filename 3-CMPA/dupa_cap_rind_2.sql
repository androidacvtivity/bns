--1040, TRIM I 2019
--1041, TRIM II 2019
--1042, TRIM III 2019
--1043  TRIM IV 2019
--1044, TRIM I 2020
--1045, TRIM II 2020
--1046, TRIM III 2020
--1047  TRIM IV 2020



SELECT 
D.PERIOADA,
 D.UNIT_CODE,
         D.CUATM,
         CASE WHEN D.CAPITOL = 1115 THEN 'Tabelul 1'
              WHEN D.CAPITOL = 1116 THEN 'Tabelul 2'
              WHEN D.CAPITOL = 1117 THEN 'Tabelul 3' END CAPITOL,
          D.RIND,
         SUM(D.COL1)  AS COL1,
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
         SUM(D.COL13) AS COL13

FROM
  VW_DATA_ALL_GC  D
  
  WHERE
  
   (D.PERIOADA IN (1044,1045,1046,1047,1040,1041,1042,1043))  AND   
   (D.FORM = 62) 
  
 
 
   GROUP BY 
   D.PERIOADA,
    D.UNIT_CODE,
         D.CUATM,
         D.CAPITOL,
          D.RIND 
           
         ORDER BY
         D.PERIOADA,
         D.UNIT_CODE,
          D.CAPITOL,
         D.CUATM,
         D.RIND
         
         
       