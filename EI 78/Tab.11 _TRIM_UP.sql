SELECT 
       '1' ORDINE,
  --   TTT.ORDINE AS ORDINE_TARA,
  --   TTT.CODUL,
  --   SSS.CODUL CODUL,
  
     TTT.ORDINE  ORDINE_CL, 
     TTT.DENUMIRE,
     TTT.CODUL CODUL,
     TTT.FULL_CODE,
     --SS.FULL_CODE,
    ROUND((SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))/1000,1)
    AS COL1,
  
     ROUND((SUM(CASE WHEN  D.CAPITOL IN (405)  AND D.RIND NOT IN ('1','2','-') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.CAPITOL IN (406)  AND D.RIND NOT IN ('1','-') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END ))/1000,1)
    AS COL2,
    
     ROUND((SUM(CASE WHEN  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL4 IS NOT NULL THEN D.COL4 ELSE 0 END ))/1000,1)
    AS COL3,
    
   ROUND((SUM(CASE WHEN  D.CAPITOL IN (407)  AND D.RIND NOT IN ('1','2','-') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END )  
    +
    SUM(CASE WHEN  D.CAPITOL IN (408)  AND D.RIND NOT IN ('1','-') AND D.COL5 IS NOT NULL THEN D.COL5 ELSE 0 END ))/1000,1)
    AS COL4
     
       
      FROM CIS2.VW_DATA_ALL D 
       
       
       INNER JOIN   (SELECT c.codul,
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
                    INNER JOIN 
                    
                    (
                    
    SELECT 
    
  RIND    CODUL, 
  DENUMIRE, 
  RINDOUT  GRUPA,
  ORDINE
  
 
    
    FROM  CIS2.MD_RIND_OUT
    
    
        WHERE 
        
        ID_MDTABLE IN (8170) 
        
       
                    )
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
   ORDER BY c.ordine, c.full_code) TT  ON (TT.CODUL=D.COL3)
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
                    INNER JOIN 
                    
                    (
                    
    SELECT 
    
  RIND    CODUL, 
  DENUMIRE, 
  RINDOUT  GRUPA,
  ORDINE
  
 
    
    FROM  CIS2.MD_RIND_OUT
    
    
        WHERE 
        
        ID_MDTABLE IN (8170) 
        
      
                    )
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
       
    -- INNER JOIN   CIS2.VW_CL_SERVICII SS ON ((REPLACE (SS.CODUL,'0') )=D.COL1)     
    -- INNER JOIN   CIS2.VW_CL_SERVICII SSS ON (SS.FULL_CODE LIKE '%' ||SSS.CODUL||';%' )    
         INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
       
             
   WHERE 
 (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (405,406,407,408)

  AND TTT.CODUL NOT IN ('555','444')
  
  --AND SSS.CODUL NOT IN ('0000000')
     
  
  GROUP BY
--  TTT.CODUL
  
  TTT.DENUMIRE,
  TTT.CODUL,
  TTT.FULL_CODE,
 -- SS.FULL_CODE,
  TTT.ORDINE