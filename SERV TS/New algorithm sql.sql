        SELECT 
            D.*
            
            
                FROM DATA_ALL D
                                                
                    INNER JOIN MD_RIND MR ON MR.ID_MD  = D.ID_MD
                    INNER JOIN RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS   
                    INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = R.CUATM
                

                   RIGHT JOIN (
                   
                   SELECT     
           R.CUIIO,
           R.CUIIO_VERS,
           R.DENUMIRE,
           FC.FORM,
           R.CUATM,
           R.CFP,
           R.CFOJ,
           R.CAEM2
           
      FROM (SELECT FC.CUIIO,
                   FC.CUIIO_VERS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
              FROM CIS.FORM_CUIIO  FC
                   INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                   FROM CIS.FORM_CUIIO
                                  WHERE FORM IN (4) AND CUIIO_VERS <= :pPERIOADA
                               GROUP BY CUIIO) BB
                       ON (    BB.CUIIO = FC.CUIIO
                           AND BB.CUIIO_VERS = FC.CUIIO_VERS)
             WHERE FC.FORM IN (4) AND FC.STATUT <> '3') FC
             
           INNER JOIN CIS.RENIM R
               ON (R.CUIIO = FC.CUIIO AND R.CUIIO_VERS = FC.CUIIO_VERS)
               
                INNER JOIN CIS.VW_CL_CUATM C ON C.CODUL = R.CUATM
               
    WHERE
    1=1
     
     AND  C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' 
               ) FC ON (D.FORM =  FC.FORM AND D.CUIIO = FC.CUIIO AND D.CUIIO_VERS  = FC.CUIIO_VERS)
                   

            

                WHERE
  (D.FORM=:pFORM) AND
 (D.FORM_VERS=:pFORM_VERS) AND
 (:pID_MDTABLE=:pID_MDTABLE) AND
  D.FORM = 4 AND
  
  (  D.PERIOADA BETWEEN FLOOR(:pPERIOADA/12)*12 AND :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA OR
     D.PERIOADA IN :pPERIOADA-1 )
AND 
  C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%' AND
  MR.CAPITOL IN (0,4)








                