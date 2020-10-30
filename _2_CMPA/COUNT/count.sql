
SELECT 

    UNIT_CODE,
    NAME,
    CUATM,

    DENUMIRE,
    FULL_DENUMIRE,
    SUBSTR(FULL_DENUMIRE,15) NAME_TEST,
  
    ADDRESS_1
    
    FROM 
(
SELECT 
    D.UNIT_CODE,
    RN.NAME,
    D.CUATM,
    C.FULL_CODE,
   
    C.DENUMIRE,
    C.FULL_DENUMIRE,  
     D.ADDRESS_1,
    SUM(CASE WHEN D.CAPITOL  = 419 AND D.RIND IN ('0')  THEN 419 END) AS COL1,
    SUM(CASE WHEN D.CAPITOL = 416 THEN 416 END) AS COL2,
    SUM(CASE WHEN D.CAPITOL = 417 THEN 417 END) AS COL3
    
       
            
    FROM CIS2.VW_DATA_ALL_GC D
    
            LEFT JOIN REG_UNIT_GC RN
               ON     D.UNIT_CODE = RN.UNIT_CODE
                  AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                  AND D.NR_GOSP = RN.NR_GOSP
                  AND D.NR_MAPS = RN.NR_MAPS
                  
                  
                  INNER JOIN USER_BANCU.VW_CL_CUATM_DENUMIRE C  ON C.CODUL = D.CUATM
    
    WHERE 
    
    D.FORM = 58
    
    
    AND D.PERIOADA = 1040
    
    AND 
    
    D.CAPITOL IN (419,416,418)
    
    GROUP BY 
    D.UNIT_CODE,
    RN.NAME,
    D.ADDRESS_1,
    D.CUATM,
    C.PRGS,
    C.FULL_CODE,
    C.FULL_DENUMIRE,
    C.DENUMIRE,
    C.CODUL
    
    )
    
    
    GROUP BY 
     UNIT_CODE,
     NAME,
     CUATM,
     FULL_CODE,
     ADDRESS_1,
    FULL_DENUMIRE,
    DENUMIRE,
     COL1,
     COL2,
     COL3
     
     
    HAVING 
    
    COL1 IS NOT NULL
    
    AND 
    
    NVAL(COL2)  + NVAL(COL3) = 0
    
    
    
    AND SUBSTR(FULL_DENUMIRE,15,4) =  'R-UL'