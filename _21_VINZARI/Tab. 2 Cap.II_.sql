﻿SELECT 
  :pPERIOADA AS PERIOADA,
  :pFORM AS FORM,
  :pFORM_VERS AS FORM_VERS,
  :pID_MDTABLE AS ID_MDTABLE,
  :pCOD_CUATM AS COD_CUATM,
  '0' AS NR_SECTIE,
  '0' AS NUME_SECTIE,
  '0' AS NR_SECTIE1,
  '0' AS NUME_SECTIE1,
  '0' AS NR_SECTIE2,
  '0' AS NUME_SECTIE2,
  
 
                MR.RIND AS NR_ROW,
                MR.ORDINE AS ORDINE,
                '00000000000' AS DECIMAL_POS, 
                REPLACE(REPLACE(REPLACE(MR.DENUMIRE,'<br>'),'nbsp'),'&;') AS NUME_ROW,
                SUM(D.COL1)  AS COL1,
                SUM(D.COL2)  AS COL2
                
                
                      
                
               
                
               FROM CIS2.DATA_ALL D
                      
                       INNER JOIN CIS2.RENIM RR ON (RR.CUIIO = D.CUIIO AND RR.CUIIO_VERS = D.CUIIO_VERS)
                       INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = RR.CUATM
                       RIGHT JOIN CIS2.MD_RIND MR ON (MR.ID_MD=D.ID_MD 
                       -----------------------------------------------------------
                       AND  (D.FORM=:pFORM) AND
                       (D.FORM_VERS=:pFORM_VERS) AND
                       (:pID_MDTABLE=:pID_MDTABLE) AND
                       (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND   
                       D.PERIOADA IN :pPERIOADA AND
                       D.FORM = 54 
                       
                        
                     )
                       -----------------------------------------------------------
                                            
                   WHERE 
                    1=1
                    AND MR.CAPITOL = 1077
                    
                         
           
           
         GROUP BY
          MR.DENUMIRE,
          MR.RIND,
          MR.ORDINE
          
          ORDER BY 
          MR.ORDINE