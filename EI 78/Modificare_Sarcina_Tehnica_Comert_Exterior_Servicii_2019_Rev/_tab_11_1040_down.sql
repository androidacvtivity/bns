

SELECT 
     '2' ORDINE,
     ORDINE_CL, 
     DENUMIRE,
     CODUL CODUL,
     FULL_CODE,
     SUM(COL1) AS COL1,
     SUM(COL2) AS COL2,
     SUM(COL3) AS COL3,
     SUM(COL4) AS COL4
     
     FROM 

(

SELECT 
    
      D.PERIOADA,
      TTT.ORDINE  ORDINE_CL, 
     SSS.DENUMIRE,
     2||'_'||SSS.CODUL CODUL,
     TTT.FULL_CODE,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   +
     SUM(CASE WHEN  MC.CAPITOL IN (406)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL1,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (405)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (406)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)) / CR.COL1 )/1000,1) AS COL2,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (408)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL3,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (407)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (408)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END )  ) / CR.COL1)/1000,1) AS COL4
     
     FROM CIS2.DATA_ALL D  
      -------------------------------------------------------------------------------
        LEFT JOIN (
         SELECT
            D.PERIOADA,
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
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
        INNER JOIN   CIS2.VW_CL_TARI TT ON (TT.CODUL=D.COL3)
       INNER JOIN   (
       SELECT c.codul,
            c.denumire,
            c.grupa,
            c.ordine,
            c.full_code
       FROM (SELECT c1.codul,
                    c1.denumire,
                    c1.grupa,
                    c1.ordine,
                       TRIM (TO_CHAR (c3.codul, '000'))
                    || ';'
                    || DECODE (c3.codul,
                               c2.codul, '',
                               TRIM (TO_CHAR (c2.codul, '000')) || ';')
                    || DECODE (c2.codul,
                               c1.codul, '',
                               TRIM (TO_CHAR (c1.codul, '000')) || ';')
                       AS full_code
               FROM (
              SELECT 
              RIND    CODUL, 
              DENUMIRE, 
              RINDOUT  GRUPA,
              ORDINE
   FROM  CIS2.MD_RIND_OUT
         WHERE 
         ID_MDTABLE IN (8170) 
             ) c1
                    INNER JOIN  (
                 SELECT 
                   RIND    CODUL, 
                   DENUMIRE, 
                   RINDOUT  GRUPA,
                   ORDINE
                FROM  CIS2.MD_RIND_OUT
                  WHERE 
               ID_MDTABLE IN (8170) )
                     c2 ON (c1.grupa = c2.codul)
                    INNER JOIN (
          SELECT 
           RIND    CODUL, 
           DENUMIRE, 
           RINDOUT  GRUPA,
           ORDINE
            FROM  CIS2.MD_RIND_OUT
             WHERE 
              ID_MDTABLE IN (8170) 
                      ) c3 ON (c2.grupa = c3.codul)) c
   ORDER BY c.ordine, c.full_code
       
       ) TTT ON (TT.FULL_CODE LIKE '%' ||TTT.CODUL||';%' )    
         
         
        INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
         INNER JOIN CIS2.VW_CL_CUATM C ON R.CUATM = C.CODUL
         INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
         INNER JOIN   CIS2.VW_CL_SERVICII SS ON ((RTRIM(SS.CODUL,'0') )=D.COL1)     
         INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )    
         INNER  JOIN MD_CAPITOL MC ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
       -----------------------------------------------------------------------------
  WHERE 
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)  AND
  MR.CAPITOL IN (405,406,407,408) AND 
  TTT.CODUL NOT IN ('555','444','000') AND 
  SSS.CODUL NOT IN ('0000000')
      GROUP BY
      D.PERIOADA,
      TTT.CODUL, 
      TTT.ORDINE,
      SSS.DENUMIRE,
      SSS.CODUL,
      TTT.FULL_CODE,
      CR.COL1 
      )
       GROUP BY 
  ORDINE_CL, 
  DENUMIRE,
  CODUL,
  FULL_CODE