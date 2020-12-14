SELECT 
  L.CUIIO L_CUIIO  ,
  R.CUIIO R_CUIIO
  
        
--  R.CUIIO_VERS,
--  R.DENUMIRE,
--  R.EDIT_USER,
--  R.STATUT,
--  R.CUATM,
--  R.CFP,
--  R.CFOJ,
--  R.CAEM,
--  R.COCM,
--  R.LANG,
--  R.SPEC,
--  R.TIP_INV,      
--  R.TIP_INV_DEG,
--  R.TIP_LOCAL,
--  R.CUATM4,
--  R.CFP1,
--  R.AP_BUGET, 
--  R.CAEM2     
      FROM 

(

SELECT 
  R.CUIIO,      
  R.CUIIO_VERS,
  R.DENUMIRE,
  R.EDIT_USER,
  R.STATUT,
  R.CUATM,
  R.CFP,
  R.CFOJ,
  R.CAEM,
  R.COCM,
  R.LANG,
  R.SPEC,
  R.TIP_INV,      
  R.TIP_INV_DEG,
  R.TIP_LOCAL,
  R.CUATM4,
  R.CFP1,
  R.AP_BUGET, 
  R.CAEM2     
      FROM 
(
SELECT 
  R.CUIIO,      
  R.CUIIO_VERS,
  R.DENUMIRE,
  R.EDIT_USER,
  R.STATUT,
  R.CUATM,
  R.CFP,
  R.CFOJ,
  R.CAEM,
  R.COCM,
  R.LANG,
  R.SPEC,
  R.TIP_INV,      
  R.TIP_INV_DEG,
  R.TIP_LOCAL,
  R.CUATM4,
  R.CFP1,
  R.AP_BUGET, 
  R.CAEM2     
      FROM 
      
      
      (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM M53.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM M53.FORM_CUIIO
                                  WHERE FORM IN (39) AND CUIIO_VERS <= 310
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (39) AND FC.STATUT <> '3') FC
           
           
           INNER JOIN M53.RENIM R
           
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS) ) R 
               
               WHERE 
               1=1 
              -- AND R.CUATM LIKE '96%' 
               
               ) R RIGHT JOIN (
               
               SELECT 
   DISTINCT  D.CUIIO 
FROM
  VW_DATA_ALL D
  INNER JOIN  MD_RIND RD ON (D.ID_MD=RD.ID_MD)
  INNER JOIN RENIM R ON (R.CUIIO= D.CUIIO AND R.CUIIO_VERS=D.CUIIO_VERS)
  
  
  WHERE 
  RD.RIND IN ('04') AND RD.CAPITOL IN ('4') AND  R.TIP_INV NOT IN('71','72','73','80') 
  AND D.PERIOADA = 310
 -- AND R.CUATM LIKE '96%'
  AND D.COL1 IS NOT NULL
               
               ) L ON L.CUIIO = R.CUIIO 
               
               
               WHERE 
               
               R.CUIIO IS NOT  NULL 
               
             


ORDER BY 
  L.CUIIO,
  R.CUIIO