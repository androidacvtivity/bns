SELECT 

    L.CUIIO,
  --  L.CUIIO_VERS,
  --  L.RIND  RIND,
   L.RIND_MOD,
  --  L.ID_MD,
 --   L.RIND_VERS,
    L.COL1
    

  FROM

(
SELECT 
    D.CUIIO,
    D.CUIIO_VERS,
    D.RIND  RIND,
    TO_CHAR(SUBSTR(D.RIND,2)) RIND_MOD,
    D.ID_MD,
    D.RIND_VERS,
    SUM(D.COL1) AS COL1
  
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
     
       )   
  
--
GROUP BY 
    D.CUIIO,
    D.CUIIO_VERS,
    D.RIND,
    TO_CHAR(SUBSTR(D.RIND,2)),
    D.ID_MD,
    D.RIND_VERS
 

)  L



WHERE 

L.RIND_MOD IN  (
'732006',
'732007',
'811005'

)


AND L.COL1 IS NOT NULL