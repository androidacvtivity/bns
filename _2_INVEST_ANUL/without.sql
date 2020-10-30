SELECT 
                R.RIND AS NR_ROW,
                R.ORDINE AS ORDINE,
                R.DENUMIRE AS NUME_ROW,
                SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2)  ELSE NULL END) AS COL1,
                SUM(CASE WHEN R.RIND =  MR.RIND THEN  D.COL1   ELSE NULL END) AS COL2,
                SUM(CASE WHEN R.RIND =  MR.RIND THEN  D.COL2   ELSE NULL END) AS COL3,
                SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL3) + CIS2.NVAL(D.COL4)  ELSE NULL END) AS COL4,
                SUM(CASE WHEN R.RIND =  MR.RIND THEN  D.COL3   ELSE NULL END) AS COL5,
                SUM(CASE WHEN R.RIND =  MR.RIND THEN  D.COL4   ELSE NULL END) AS COL6,  
                NULL   AS COL7
                
                
                FROM CIS2.DATA_ALL D
                
                       INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
                       INNER JOIN CIS2.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                       INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = RR.CUATM
                       CROSS JOIN (
                           SELECT
                             DENUMIRE,
                             RIND,
                             ORDINE
  
                           FROM  CIS2.MD_RIND
  
    WHERE
     RIND IN ('510','520','530','730','740','750','760')  AND 
     CAPITOL = 323 AND
     RIND_VERS >= 2006 AND
    
     STATUT = '1'  ) R     
           
     
     CROSS JOIN (
     
          SELECT 
                  
                     D.COL1  AS COL1

                     FROM CIS2.DATA_ALL D
                
                       INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD=D.ID_MD)
                       INNER JOIN CIS2.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                 
                     WHERE 
                     D.FORM=100 AND
                     D.PERIOADA IN :pPERIOADA AND
                     MR.CAPITOL = 330 AND   
                     D.CUIIO = 2 AND MR.RIND IN ('04')
                   
     ) P
     
     
                 
                WHERE 
                
           (D.FORM=:pFORM) AND
           (D.FORM_VERS=:pFORM_VERS) AND
           (:pID_MDTABLE=:pID_MDTABLE) AND
           (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND   
           D.PERIOADA IN :pPERIOADA AND
           D.FORM = 8 AND
           MR.CAPITOL = 323
       
           
           
           
         GROUP BY
          R.DENUMIRE,
          R.RIND,
          R.ORDINE
         