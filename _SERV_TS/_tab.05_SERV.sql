﻿









SELECT


        MAX(DISTINCT CASE WHEN  D.FORM IN (4) AND MC.CAPITOL IN (0)   THEN  D.CUIIO  END) CUIIO, 
        RN.DENUMIRE,
        RN.CAEM2,
        RN.CUATM,
        D.PACHET,
        
        SUM(CASE WHEN  (D.PERIOADA =:pPERIOADA-2) AND  D.FORM IN (4) AND MC.CAPITOL IN (4) AND MR.RIND IN ('10') THEN D.COL1  ELSE  NULL END) COL1,
        SUM(CASE WHEN  (D.PERIOADA =:pPERIOADA-1) AND  D.FORM IN (4) AND MC.CAPITOL IN (4) AND MR.RIND IN ('10') THEN D.COL1  ELSE  NULL END) COL2,
        SUM(CASE WHEN  (D.PERIOADA =:pPERIOADA)   AND  D.FORM IN (4) AND MC.CAPITOL IN (4) AND MR.RIND IN ('10') THEN D.COL1  ELSE  NULL END) COL3


FROM CIS.DATA_ALL D
          INNER JOIN CIS.RENIM RN
             ON D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS
          INNER  JOIN CIS.VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
          INNER  JOIN CIS.MD_RIND MR ON D.ID_MD = MR.ID_MD
          INNER  JOIN CIS.MD_CAPITOL MC
             ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
             
             
              WHERE 
  (D.PERIOADA IN (:pPERIOADA, :pPERIOADA - 1, :pPERIOADA - 2, :pPERIOADA -3)) AND 
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (4) AND MC.CAPITOL IN (0,4)
  
  
  GROUP BY 
   D.CUIIO,
   RN.DENUMIRE,
   D.PACHET,
   RN.CAEM2,
   RN.CUATM,
   CT.FULL_CODE
--   
--   ORDER BY 
--   
--   CT.FULL_CODE,
--   D.CUIIO