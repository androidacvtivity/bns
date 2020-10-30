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
         COL1,
         COL2,
         COL3,
         COL4,
         COL5,
         COL6,
         COL7,
         COL8,
         COL9,
         COL10,
         COL11,
         COL12


)

SELECT
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
    A.NR_ROW   AS NR_SECTIE,
    A.NR_ROW||'-'||NUME_ROW AS NUME_SECTIE,
   '0' AS NR_SECTIE1,
   '0' AS NUME_SECTIE1,
   '0' AS NR_SECTIE2,
   '0' AS NUME_SECTIE2,
    A.RIND||'~'||ROWNUM NR_ROW,
    ROWNUM AS ORDINE,
   '000000000000' AS DECIMAL_POS, 
    A.DENUMIRE AS NUME_ROW,  
    A.COL1,
    A.COL2,
    A.COL3,
    A.COL4,
    A.COL5,
    A.COL6,
    A.COL7,
    A.COL8,
    A.COL9,
    A.COL10,
    A.COL11,
    A.COL12
    
FROM 

(
SELECT 
 
     CD.NR_ROW,
     CD.NUME_ROW,
     MR.RIND,
     MR.ORDINE,
     MR.DENUMIRE,
     SUM(CASE WHEN CD.TIP_INV LIKE '%'||R.NTII||'%'  THEN  D.COL1 END )   COL1,
     SUM(CASE WHEN CD.TIP_INV LIKE '%'||R.NTII||'%'  THEN  D.COL2 END )   COL2,
     SUM(CASE WHEN CD.TIP_INV LIKE '%'||R.NTII||'%'  THEN  D.COL3 END )   COL3,
     SUM(CASE WHEN CD.TIP_INV LIKE '%'||R.NTII||'%'  THEN  D.COL4 END )   COL4,
     SUM(CASE WHEN CD.TIP_INV LIKE '%'||R.NTII||'%'  THEN  D.COL5 END )   COL5, 
     SUM(CASE WHEN CD.TIP_INV LIKE '%'||R.NTII||'%'  THEN  D.COL6 END )   COL6,
     SUM(CASE WHEN CD.TIP_INV LIKE '%'||R.NTII||'%'  THEN  D.COL7 END )   COL7,
     SUM(CASE WHEN CD.TIP_INV LIKE '%'||R.NTII||'%'  THEN  D.COL8 END )   COL8,
     SUM(CASE WHEN CD.TIP_INV LIKE '%'||R.NTII||'%'  THEN  D.COL9 END )   COL9,
     SUM(CASE WHEN CD.TIP_INV LIKE '%'||R.NTII||'%'  THEN  D.COL10 END )  COL10,
     SUM(CASE WHEN CD.TIP_INV LIKE '%'||R.NTII||'%'  THEN  D.COL11 END )  COL11, 
     SUM(CASE WHEN CD.TIP_INV LIKE '%'||R.NTII||'%'  THEN  D.COL12 END )  COL12
     
     
     
FROM   CIS2.VW_DATA_ALL D 

       INNER JOIN CIS2.RENIM R ON (D.CUIIO = R.CUIIO AND D.CUIIO_VERS = R.CUIIO_VERS) 
       INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)
     INNER JOIN 
      
       (
          SELECT  '1'  CODUL,  'Școală  profesională' DENUMIRE  FROM DUAL UNION        
          SELECT  '2'  CODUL,  'Centrul de excelenăî'  DENUMIRE  FROM  DUAL UNION        
          SELECT  '3'  CODUL,  'Colegii'              DENUMIRE  FROM DUAL  
             
                 )  CL_INV ON (CL_INV.CODUL = R.NTII)
       
       
       CROSS JOIN 
       
       (
    SELECT 'Total pe instituții de invățămînt'  AS NUME_ROW, '01' AS NR_ROW, '0-1-2-3' AS TIP_INV FROM DUAL UNION
    SELECT 'Şcoala profesională'              AS NUME_ROW, '02' AS NR_ROW, '1'       AS TIP_INV FROM DUAL UNION    
    SELECT 'Centrul de excelenţă'              AS NUME_ROW, '03' AS NR_ROW, '2'       AS TIP_INV FROM DUAL    
     
       ) CD 
       
       
       
WHERE 
  (D.PERIOADA =:pPERIOADA) AND
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE)  AND 
  (D.CUATM_FULL LIKE '%' ||:pCOD_CUATM||';%') AND
  D.FORM = 49 AND 
  D.CAPITOL IN (1052)
  
 

  GROUP BY 
  CD.NR_ROW,   
  CD.NUME_ROW,
  MR.RIND,
  MR.DENUMIRE,
  MR.ORDINE

   ORDER BY 
   MR.ORDINE,
   CD.NR_ROW  

   
  ) A