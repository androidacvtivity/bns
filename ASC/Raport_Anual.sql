SELECT 
      L.CUIIO,
      L.DENUMIRE,
      L.TIPUL_STRUCTURII,
      R.TIPUL_STRUCTURII  CATEGORIA_STRUCTURII,
      L.CUATM
FROM
(
SELECT
      D.CUIIO,
      D.CUATM,
      C.FULL_CODE, 
      D.CUIIO_VERS,
      R.DENUMIRE,
      MR.DENUMIRE TIPUL_STRUCTURII
      
    
    FROM
      CIS2.VW_DATA_ALL D 
              INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS)
              INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD= D.ID_MD)
              INNER JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = D.CUATM)

    WHERE
      (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
      (D.PERIOADA =:pPERIOADA) AND  
      D.FORM IN (20) AND
      D.CAPITOL IN (1010) AND
      D.RIND NOT IN ('00','--','1','2','3','4','5','6')
       
      ORDER BY 
      C.FULL_CODE 
       
       ) L LEFT JOIN (  
       
       
       SELECT
      D.CUIIO,
      D.CUATM,
      C.FULL_CODE, 
      D.CUIIO_VERS,
      R.DENUMIRE,
      MR.DENUMIRE TIPUL_STRUCTURII
      
    
    FROM
      CIS2.VW_DATA_ALL D 
              INNER JOIN CIS2.RENIM R ON (R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS)
              INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD= D.ID_MD)
              INNER JOIN CIS2.VW_CL_CUATM C ON (C.CODUL = D.CUATM)

    WHERE
      (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
      (D.PERIOADA =:pPERIOADA) AND  
      D.FORM IN (20) AND
      D.CAPITOL IN (1010) AND
      D.RIND IN ('1','2','3','4','5','6')
       
      ORDER BY 
      C.FULL_CODE 
       )  R  ON (R.CUIIO = L.CUIIO AND L.CUIIO_VERS = R.CUIIO_VERS)
       
       
       ORDER BY 
       L.FULL_CODE
      
        ;
       
       
 --------------------------------------------------- 
       
       
       

---------------------------------------------------------------------------------
SELECT
  A.RIND AS RIND_S,
  B.RIND AS RIND_D,
  A.CUIIO,
  CC.CODUL AS CUATM,
  CC.DENUMIRE AS CUATM_DENUMIRE,
  A.CAPITOL,
  A.ID_MD AS ID_MD_S,
  B.ID_MD AS ID_MD_D,
  SUM(A.COL1) AS COL1_S,
  SUM(B.COL1) AS COL1_D
FROM
(
SELECT
      D.CUIIO,
      D.CUATM,
      D.RIND,
      D.ID_MD,
      D.CAPITOL,
      CIS2.NVAL(D.COL1) AS COL1
    FROM
      CIS2.VW_DATA_ALL D

    WHERE
      (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
      (D.PERIOADA =:pPERIOADA) AND  
      D.FORM IN (20) AND
      D.CAPITOL IN (1010) AND
      D.RIND IN ('1','2','3','4','5','6')
) A
INNER JOIN
(      
 SELECT
      D.CUIIO,
      D.CUATM,
      D.RIND,
      D.ID_MD,
      D.CAPITOL,
      CIS2.NVAL(D.COL1) AS COL1
    FROM
      CIS2.VW_DATA_ALL D

    WHERE
      (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
      (D.PERIOADA =:pPERIOADA) AND  
      D.FORM IN (20) AND
      D.CAPITOL IN (1010) AND
      D.RIND NOT IN ('00','--','1','2','3','4','5','6')
) B ON (A.CUIIO=B.CUIIO)
  INNER JOIN CIS2.VW_CL_CUATM C ON (A.CUATM=C.CODUL) 
--  INNER JOIN VW_CL_CUATM CC ON (C.GRUPA=CC.CODUL)
  INNER JOIN CIS2.VW_CL_CUATM CC ON (C.FULL_CODE LIKE '%'||CC.CODUL ||';%' )
WHERE
  CC.PRGS IN (2)
GROUP BY
  A.RIND,
  B.RIND,
  A.ID_MD,
  B.ID_MD,
  A.CUIIO,
  CC.CODUL,
  CC.DENUMIRE,
  A.CAPITOL