SELECT

     
     17.1 ORDINE,             
     '030+040' RIND,
     
     'Ovine si Caprine - total 'AS NUME_ROW,
     ROUND(SUM(D.COL18),2) AS COL1,
     ROUND(SUM(D.COL4),2)  AS COL2,
     ROUND(SUM(D.COL18) / SUM(D.COL4),2) AS COL3,
     ROUND(SUM(D.COL18),2) AS COL4, 
     ROUND(SUM(D.COL5),2) AS COL5,     
     ROUND(SUM(D.COL18) / SUM(D.COL5),2) AS COL6,
     -----------------------------------------------
     ROUND(SUM(D.COL19),2) AS COL7, 
     ROUND(SUM(D.COL9),2) AS COL8,     
     ROUND(SUM(D.COL19) / SUM(D.COL9),2) AS COL9,
    -----------------------------------------------
     ROUND(SUM(D.COL19),2) AS COL10, 
     ROUND(SUM(D.COL10),2) AS COL11,     
     ROUND(SUM(D.COL19) / SUM(D.COL10),2) AS COL12   
  
     
     
     
     
     
     
FROM
  VW_DATA_ALL_GC  D
  INNER JOIN MD_RIND R ON D.ID_MD = R.ID_MD
WHERE
  (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (58)  AND
  D.CAPITOL IN (416)
  AND D.RIND IN ('030','040')


  
