SELECT 
        D.UNIT_CODE,
        D.CAPITOL,
        D.RIND,
        MR.ID_MD,
        D.COL1,
    D.COL2,
    D.COL3,
    D.COL4,
    D.COL5,
    D.COL6,
    D.COL7,
    D.COL8,
    D.COL9,
    D.COL10,
    D.COL11,
    D.COL12,
    D.COL13,
    D.COL14,
    D.COL15,
    D.COL16,
    D.COL17,
    D.COL18,
    D.COL19
         
               
FROM
  VW_DATA_ALL_GC  D
            INNER JOIN MD_RIND MR ON MR.ID_MD = D.ID_MD 
WHERE
  (D.PERIOADA IN (:pPERIOADA))  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND 
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') 
  
  AND
  D.FORM IN (62)  
 -- D.CAPITOL IN (416)
  
  --AND D.UNIT_CODE =  168386 

  
  
  GROUP BY
 D.UNIT_CODE,
        D.CAPITOL,
        D.RIND,
         MR.ID_MD,
        D.COL1,
    D.COL2,
    D.COL3,
    D.COL4,
    D.COL5,
    D.COL6,
    D.COL7,
    D.COL8,
    D.COL9,
    D.COL10,
    D.COL11,
    D.COL12,
    D.COL13,
    D.COL14,
    D.COL15,
    D.COL16,
    D.COL17,
    D.COL18,
    D.COL19
 
 HAVING 
  D.COL1 = 'NaN'  OR D.COL2 = 'NaN' OR 
  D.COL3 = 'NaN'  OR D.COL4 = 'NaN' OR 
  D.COL5 = 'NaN'  OR D.COL6 = 'NaN' OR 
  D.COL7 = 'NaN'  OR  D.COL8 = 'NaN'  

  OR 
  
  D.COL9 = 'NaN'
  OR
  D.COL10 = 'NaN'
  
  OR 
  
  D.COL11 = 'NaN'
  
  OR 
  D.COL12 = 'NaN'
  
  OR 
  D.COL13 = 'NaN'
  
  OR 
  D.COL14 = 'NaN'

  
  

  
  OR 

   D.COL16 = 'NaN'
 
   OR 
   
   D.COL15 = 'NaN'



 
  OR 

   D.COL17 = 'NaN'
 
   OR 
   
   D.COL18 = 'NaN'
   
   
   OR 
   
   D.COL19 = 'NaN'
   
 
 ORDER BY 
 D.COL16
