SELECT 
--               :pPERIOADA AS PERIOADA,
--               :pFORM AS FORM,
--               :pFORM_VERS AS FORM_VERS,
--               :pID_MDTABLE AS ID_MDTABLE,
--               :pCOD_CUATM AS COD_CUATM,    
--               '0' AS NR_SECTIE,
--               '0' AS NUME_SECTIE,
--               '0' AS NR_SECTIE1,
--               '0' AS NUME_SECTIE1,
--               '0' AS NR_SECTIE2,
--               '0' AS NUME_SECTIE2,


                  D.NR_ROW,
                  D.ORDINE,
                   '111' AS DECIMAL_POS,
                  D.NUME_ROW,
                  
                  
                  D.COL1,
                 
                  
                  CASE 
               
               
               WHEN D.NR_ROW  NOT IN ('410','420','430','440','441','450','-')
               
               THEN
               ROUND((D.COL2 / P.COL1) * 100,1)
               
               
               WHEN D.NR_ROW IN ('440','441','450')
               
               THEN
               ROUND((D.COL2 / P.COL3) * 100,1)
               
               
               WHEN D.NR_ROW IN ('410','420','430')
               
               THEN
               
               ROUND((D.COL2 / P.COL2) * 100,1)
               
               
--               WHEN D.NR_ROW IN ('441','442','450')
--               
--               THEN
--               
--               ROUND((D.COL2 / P.COL1) * 100,1)
               
               ELSE NULL
               
               END AS COL2,
               
               D.COL3           
               
               
               
               
               
               
               
               
               
               
               
               
               
                  FROM
 (
 SELECT 
 R.RIND AS NR_ROW,
 
             R.ORDINE AS ORDINE,
         
             R.DENUMIRE AS NUME_ROW,
              (SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND R.RIND =  MR.RIND THEN D.COL1 ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND R.RIND =  MR.RIND THEN D.COL2 ELSE 0 END))  AS COL1,
  
              (
              
              SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND R.RIND =  MR.RIND THEN NVAL(D.COL1) + NVAL(D.COL2)  ELSE 0 END)
 
  
  )  AS COL1_1,
  
  
    ROUND((((
    
    SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND R.RIND =  MR.RIND  THEN NVAL(D.COL1) + NVAL(D.COL2) ELSE 0 END)
  
  
  
  )/
 CIS.NOZERO(SUM(CASE WHEN D.PERIOADA BETWEEN (FLOOR(:pPERIOADA/4)*4)-4 AND :pPERIOADA-4 AND R.RIND =  MR.RIND THEN NVAL(D.COL1) + NVAL(D.COL2) ELSE 0 END)
 
 
  
  
  ))),1) AS COL2_2,
  
  
  
  
      ROUND((((SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND R.RIND =  MR.RIND  THEN D.COL1 ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND R.RIND =  MR.RIND THEN D.COL2 ELSE 0 END))/
 CIS.NOZERO(SUM(CASE WHEN D.PERIOADA BETWEEN (FLOOR(:pPERIOADA/4)*4)-4 AND :pPERIOADA-4 AND R.RIND =  MR.RIND THEN D.COL1 ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA BETWEEN (FLOOR(:pPERIOADA/4)*4)-4 AND :pPERIOADA-4 AND R.RIND =  MR.RIND THEN D.COL2 ELSE 0 END)))),1) AS COL2,
  
  CASE WHEN R.RIND IN '100' THEN 100 ELSE
 
 ROUND(((SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND R.RIND =  MR.RIND THEN D.COL1 ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND R.RIND =  MR.RIND THEN D.COL2 ELSE 0 END))*100)/
  
 (SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND MR.RIND IN '100' THEN D.COL1 ELSE 0 END)+
  SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND MR.RIND IN '100' THEN D.COL2 ELSE 0 END)),1) END AS COL3,
  
     ROUND( CASE WHEN    R.RIND IN '100' THEN 100 ELSE 
             ( SUM(CASE WHEN D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND  MR.RIND = R.RIND   THEN CIS2.NVAL(D.COL1)+(CIS2.NVAL(D.COL2)) ELSE 0 END)  * 100 )  /
             CIS2.NOZERO(SUM(CASE WHEN  D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA AND  MR.RIND IN '100'  THEN CIS2.NVAL(D.COL1)+CIS2.NVAL(D.COL2) ELSE 0 END))  END,1)  AS COL3_NEW
  
  
  
  

FROM CIS.DATA_ALL D
                       INNER JOIN CIS.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
                       INNER JOIN CIS.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                       INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = RR.CUATM
                      



CROSS JOIN (


SELECT
                             DENUMIRE,
                             RIND,
                             ORDINE
  
                           FROM  CIS.MD_RIND
  
    WHERE
    
     CAPITOL = 31 AND
     RIND_VERS >= 1040 AND
     STATUT = '1' 
     
     
       AND RIND NOT IN ('-')     

) R

WHERE 

 (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND

  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND   
 ((D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA) OR (D.PERIOADA BETWEEN (FLOOR(:pPERIOADA/4)*4)-4 AND :pPERIOADA-4))  AND
  D.FORM = 6 AND
  MR.CAPITOL = 31
  
           GROUP BY
           R.DENUMIRE,
           R.RIND,
           R.ORDINE
           
             
  ORDER BY 
  R.ORDINE
  ) D
  
  CROSS JOIN (
  
  SELECT DISTINCT 
 
 SUM(CASE WHEN D.RIND IN ('01') THEN   D.COL1 ELSE NULL END)  AS COL1,
                   SUM(CASE WHEN D.RIND IN ('02') THEN   D.COL1 ELSE NULL END)  AS COL2,
                   SUM(CASE WHEN D.RIND IN ('03') THEN   D.COL1 ELSE NULL END)  AS COL3,
                   SUM(CASE WHEN D.RIND IN ('04') THEN   D.COL1 ELSE NULL END)  AS COL4 
    
    FROM 
      CIS.VW_DATA_ALL D
      INNER JOIN (
        
        SELECT DISTINCT
          D.ANUL,
          SUM(CASE 
          WHEN D.NUM IN 1 THEN DD.COL1
          WHEN D.NUM IN 2 THEN DD.COL2
          WHEN D.NUM IN 3 THEN DD.COL3
          WHEN D.NUM IN 4 THEN DD.COL4 END) AS JIP
  
  
  
       FROM 
         CIS.MD_PERIOADA D
         INNER JOIN (
  
       SELECT DISTINCT
         ANUL,
         CASE WHEN NUM IN 3  THEN PERIOADA ELSE 0 END AS COL1,
         CASE WHEN NUM IN 6  THEN PERIOADA ELSE 0 END AS COL2,
         CASE WHEN NUM IN 9  THEN PERIOADA ELSE 0 END AS COL3,
         CASE WHEN NUM IN 12 THEN PERIOADA ELSE 0 END AS COL4
  
      FROM 
        CIS.MD_PERIOADA
  
      WHERE 
        TIP_PERIOADA = 4


  ) DD ON DD.ANUL = D.ANUL
  
WHERE
  PERIOADA = :pPERIOADA

GROUP BY
  D.ANUL
) P ON P.ANUL = D.ANUL
  
WHERE 
  D.PERIOADA = P.JIP AND
  D.CAPITOL = 37  AND
  D.RIND IN ('01','02','03','04') 
  
  ) P 
  