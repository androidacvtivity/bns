

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
 COL1, COL2, COL3,COL4,COL5,COL6, COL7
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
                NR_ROW||'~'||ROWNUM NR_ROW,
                ROWNUM AS ORDINE,
               '0000000' AS DECIMAL_POS,
                NUME_ROW,
                COL1, 
                COL2, 
                COL3,
                COL4,
                COL5, 
                COL6,
                COL7
                FROM 

    (
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
                ROUND ((((SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2)  ELSE NULL END)  /
               CIS2.NOZERO(SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL3) + CIS2.NVAL(D.COL4)  ELSE NULL END))) ) / P.COL1) * 100,1)  AS COL7
                
                
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
     RIND NOT IN ('-','410','420','430','440','441','442','450','510','520','530') AND
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
                     D.CUIIO = 2 AND MR.RIND IN ('01')
                   
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
          R.ORDINE,
          P.COL1
          
          
          UNION 
          
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
                ROUND ((((SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2)  ELSE NULL END)  /
               CIS2.NOZERO(SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL3) + CIS2.NVAL(D.COL4)  ELSE NULL END))) ) / P.COL1) * 100,1)  AS COL7
                
                
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
     RIND IN ('410','420','430')  AND 
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
                     D.CUIIO = 2 AND MR.RIND IN ('02')
                   
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
          R.ORDINE,
          P.COL1
          
          UNION 
          
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
                ROUND ((((SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2)  ELSE NULL END)  /
               CIS2.NOZERO(SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL3) + CIS2.NVAL(D.COL4)  ELSE NULL END))) ) / P.COL1) * 100,1)  AS COL7
                
                
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
     RIND IN ('440')  AND 
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
                     D.CUIIO = 2 AND MR.RIND IN ('03')
                   
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
          R.ORDINE,
          P.COL1 
          
          
          UNION 
          
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
                ROUND ((((SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL1) + CIS2.NVAL(D.COL2)  ELSE NULL END)  /
               CIS2.NOZERO(SUM(CASE WHEN R.RIND =  MR.RIND THEN CIS2.NVAL(D.COL3) + CIS2.NVAL(D.COL4)  ELSE NULL END))) ) / P.COL1) * 100,1)  AS COL7
                
                
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
     RIND IN ('441','442','450')  AND 
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
          R.ORDINE,
          P.COL1
          
          UNION 
          
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
         
          ORDER BY 
          ORDINE
          )