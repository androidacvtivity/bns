﻿SELECT 
    D.CUIIO CUIIO,
    MAX(R.DENUMIRE) DENUMIRE_CUIIO, 
    CASE 
    WHEN D.PERIOADA = TO_CHAR(1032) THEN 'TRIM I' 
    WHEN D.PERIOADA = TO_CHAR(1033) THEN 'TRIM II'
    WHEN D.PERIOADA = TO_CHAR(1034) THEN 'TRIM III'
    WHEN D.PERIOADA = TO_CHAR(1035) THEN 'TRIM IV'
          ELSE NULL END PERIOADA,      
     
    MAX(D.CUATM)   CUATM,
    D.CAEM2,
    D.CFP,
    --MAX(R.DENUMIRE) DENUMIRE_CUIIO, 
    D.COL1 AS COD_SERVICII,
  
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 ELSE NULL END) LEI,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 ELSE NULL END) DOLARI
  
     
     
     FROM CIS2.VW_DATA_ALL D 
          INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
          
            INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
          
           INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
  


   
   WHERE 
  (D.PERIOADA  IN (1032,1033,1034,1035)) AND 

  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  
  (D.CAPITOL IN (407) AND MR.RIND NOT IN ('1','2'))

  
  AND TRIM(D.COL1) IN (851,852,853)
 
  
  GROUP BY 

 D.CUIIO,
 D.PERIOADA,
 --D.CUATM,
 D.CAEM2,
 D.CFP,
 D.COL1
 
 
 UNION 
 
 
 SELECT 
    D.CUIIO CUIIO,
    MAX(R.DENUMIRE) DENUMIRE_CUIIO, 
    CASE 
    WHEN D.PERIOADA = TO_CHAR(1032) THEN 'TRIM I' 
    WHEN D.PERIOADA = TO_CHAR(1033) THEN 'TRIM II'
    WHEN D.PERIOADA = TO_CHAR(1034) THEN 'TRIM III'
    WHEN D.PERIOADA = TO_CHAR(1035) THEN 'TRIM IV'
          ELSE NULL END PERIOADA,      
     
    MAX(D.CUATM)   CUATM,
    D.CAEM2,
    D.CFP,
    --MAX(R.DENUMIRE) DENUMIRE_CUIIO, 
    D.COL1 AS COD_SERVICII,
  
    
    SUM(CASE WHEN D.COL4 IS NOT NULL THEN D.COL4 ELSE NULL END) LEI,
    SUM(CASE WHEN D.COL5 IS NOT NULL THEN D.COL5 ELSE NULL END) DOLARI  
  
     
     
     FROM CIS2.VW_DATA_ALL D 
          INNER JOIN  CIS2.MD_RIND MR ON (MR.ID_MD =  D.ID_MD)
          
            INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
          
           INNER JOIN CIS2.RENIM R ON R.CUIIO=D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS
  


   
   WHERE 
  (D.PERIOADA  IN (1032,1033,1034,1035)) AND 

  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  
  (D.CAPITOL IN (408) AND MR.RIND NOT IN ('1'))

  
  AND TRIM(D.COL1) IN (851,852,853)
 
  
  GROUP BY 

 D.CUIIO,
 D.PERIOADA,
 --D.CUATM,
 D.CAEM2,
 D.CFP,
 D.COL1


 ORDER BY 
  CUIIO,
  PERIOADA,
  CUATM
  