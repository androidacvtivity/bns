SELECT 
L.RIND_MOD
FROM 
(
SELECT 

  DISTINCT   TO_CHAR(SUBSTR(D.RIND,2)) RIND_MOD

FROM 
  CIS2.VW_DATA_ALL D  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%' AND
  D.FORM IN (49)                 AND 
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
     
       ) )  L LEFT JOIN (SELECT 
 COD_SPEC,
 DENUMIREA 
FROM CIS2.CL_SPEC_2EDU
WHERE 
NIVEL = 4
       
       ) R ON TRIM(R.COD_SPEC) = TRIM(L.RIND_MOD)
       
       WHERE 
       TRIM(R.COD_SPEC)  IS NULL