  SELECT   
           '1' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (1) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (1) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
  
  UNION ALL  
  ---------------------------------------------------------------------------------------
  
  SELECT   
           '2' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (2) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (2) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
  ---------------------------------------------------------------------------------------------
  UNION ALL  
 
  SELECT   
           '3' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (3) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (3) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
  -------------------------------------------------------------------------------------------
  UNION ALL  
 
  SELECT   
           '4' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (4) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (4) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
   UNION ALL  
 
  SELECT   
           '8' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (8) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (8) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE         
  -----------------------------------------------------------------------------------
  UNION ALL  
 
  SELECT   
           '9' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (9) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (9) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE  
            
            
       UNION ALL  
 
  SELECT   
           '10' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (10) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (10) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE      
            
            
            UNION ALL  
 
  SELECT   
           '12' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (12) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (12) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE  
            
            UNION ALL  
 
  SELECT   
           '14' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (14) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (14) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE  
             
            UNION ALL  
 
  SELECT   
           '16' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (16) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (16) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE  
            
            
UNION ALL  
 
  SELECT   
           '17' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (17) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (17) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE  
             
            
            UNION ALL  
 
  SELECT   
           '20' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (20) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (20) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE 
                   
            
            UNION ALL  
 
  SELECT   
           '21' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (21) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (21) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE 
            
            
            
            UNION ALL  
 
  SELECT   
           '22' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (22) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (22) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE 
            
            UNION ALL  
 
  SELECT   
           '23' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (23) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (23) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE 
            
            
            UNION ALL  
 
  SELECT   
           '24' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (24) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (24) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            
            UNION ALL  
 
  SELECT   
           '25' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (25) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (25) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            
            UNION ALL  
 
  SELECT   
           '27' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (27) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (27) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL  
 
  SELECT   
           '28' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (28) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (28) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL  
 
  SELECT   
           '30' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (30) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (30) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL  
 
  SELECT   
           '31' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (31) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (31) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL  
 
  SELECT   
           '32' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (32) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (32) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL  
 
  SELECT   
           '34' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (34) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (34) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL  
 
  SELECT   
           '35' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (35) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (35) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL  
 
  SELECT   
           '36' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (36) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (36) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            
            UNION ALL  
 
  SELECT   
           '38' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (38) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (38) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            
            
            UNION ALL  
 
  SELECT   
           '39' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (39) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (39) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL  
 
  SELECT   
           '40' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (40) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (40) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL  
 
  SELECT   
           '41' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (41) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (41) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
  UNION ALL 
  
  SELECT   
           '42' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (42) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (42) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL 
  
  SELECT   
           '43' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (43) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (43) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            
            UNION ALL 
  
  SELECT   
           '47' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (47) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (47) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL 
  
  SELECT   
           '48' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (48) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (48) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL 
  
  SELECT   
           '49' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (49) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (49) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL 
  
  SELECT   
           '50' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (50) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (50) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL 
  
  SELECT   
           '51' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (51) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (51) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL 
  
  SELECT   
           '52' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (52) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (52) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            
            UNION ALL 
  
  SELECT   
           '53' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (53) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (53) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL 
  
  SELECT   
           '54' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (54) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (54) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            UNION ALL 
  
  SELECT   
           '55' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (55) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (55) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
  UNION ALL 
  ----------------------------------------------------------------------------------------
  
  

  ----------------------------------------------------------------------------------------
  SELECT   
           '70' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (:pFORM) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            
            
            
            