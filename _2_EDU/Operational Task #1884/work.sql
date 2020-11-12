SELECT 
L.RIND_MOD,
L.DENUMIRE


FROM 


(
SELECT 
DISTINCT RIND_MOD,
DENUMIRE
FROM 
(
SELECT 
  
    TO_CHAR(SUBSTR(TRIM(D.RIND),2)) RIND_MOD,
    D.ID_MD,
    D.RIND_VERS,
    D.DENUMIRE
  
FROM 
  CIS2.MD_RIND D  
  
WHERE
 D.DENUMIRE NOT IN ('-') AND 
  D.CAPITOL IN (1049) AND     
    
  (
  
  D.RIND NOT IN 
       
       (
       
        SELECT 
        CODUL
        
        FROM CIS2.CL_TARI_CS
        
       )
        
     AND 
     
     D.RIND NOT IN ('010','020','030','035','040','050','060','070')
     
       )  
       
       )
       
       
       ORDER BY 
       RIND_MOD
       
       ) L  LEFT JOIN (
       
       
      
       
       SELECT 
 COD_SPEC,
 DENUMIREA 
FROM CIS2.CL_SPEC_2EDU
WHERE 
NIVEL = 4
       
       ) R ON TRIM(R.COD_SPEC) = TRIM(L.RIND_MOD)
       
       WHERE 
       
       R.COD_SPEC IS NULL 