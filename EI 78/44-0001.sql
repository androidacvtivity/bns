SELECT
DISTINCT 
    'Cap. SR Export si/sau Cap. SR Import nu are date.' AS REZULTAT,
    D.RIND,
    TRIM(REPLACE(D.COL31,'.',''))  AS COL31
    
    
 --   D.COL31  AS COL31_V1
    FROM
      CIS2.VW_DATA_ALL D
    WHERE
      (D.PERIOADA=:PERIOADA          ) AND
      (D.CUIIO=:CUIIO                ) AND
      (D.CUIIO_VERS=:CUIIO_VERS    OR   :CUIIO_VERS = -1) AND
      (D.FORM_VERS=:FORM_VERS        ) AND
      (:CAPITOL_VERS = :CAPITOL_VERS OR :CAPITOL_VERS <>  :CAPITOL_VERS) AND
      (D.ID_MD=:ID_MD               OR :ID_MD = -1) AND
      (:CAPITOL=:CAPITOL            OR CAPITOL <> :CAPITOL) AND
      :FORM = :FORM AND
       D.FORM IN (44)  
       AND  D.CAPITOL = 407 
       AND D.RIND NOT IN ('1')
       
      GROUP BY 
      
         D.RIND,
    TRIM(REPLACE(D.COL31,'.',''))  
       
  
       
 
       
       
  
--HAVING 
--    ( 
--   --  SUM(CASE WHEN D.CAPITOL = 405 THEN NVAL(REPLACE(TRIM(D.COL31),'.','')) + NVAL(REPLACE(D.COL33,'.','')) + NVAL(D.COL4) ELSE 0 END)
--      SUM(CASE WHEN D.CAPITOL = 407 THEN   NVAL(REPLACE(D.COL31,'.','')) ELSE 0 END)      
-- >  0
-- )
-- 
 
   ORDER BY 
    D.RIND
-- AND 
-- 
--  SUM(CASE WHEN D.CAPITOL = 1 THEN NVAL(D.COL1)  ELSE 0 END)
--     + SUM(CASE WHEN D.CAPITOL = 14 THEN NVAL(D.COL1) ELSE 0 END)  =   0
     

     
