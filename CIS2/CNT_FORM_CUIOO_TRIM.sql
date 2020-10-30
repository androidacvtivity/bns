SELECT   
           '5' ORDINE, 
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
            -------------------------------------------------------------------------
            
            UNION ALL 
            
            SELECT   
           '5+1' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM+1) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (:pFORM+1) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE
            ---------------------------------------------------------------------
            UNION ALL 
            
            SELECT   
           '5+6' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM+6) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (:pFORM+6) 
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
           '5+8' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM+8) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (:pFORM+8) 
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
           '5+10' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM+10) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (:pFORM+10) 
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
           '5+13' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM+13) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (:pFORM+13) 
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
           '5+14' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM+14) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (:pFORM+14) 
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
           '5+21' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM+21) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (:pFORM+21) 
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
           '5+24' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM+24) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (:pFORM+24) 
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
           '5+28' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM+28) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (:pFORM+28) 
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
           '5+39' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM+39) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (:pFORM+39) 
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
           '5+40' ORDINE, 
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE,
            MF.DEN_SHORT,
            COUNT (DISTINCT FC.CUIIO) AS CNT

                 
             FROM CIS2.FORM_CUIIO FC
                  INNER JOIN (  SELECT CUIIO, MAX (CUIIO_VERS) CUIIO_VERS
                                  FROM CIS2.FORM_CUIIO
                                 WHERE FORM IN (:pFORM+40) AND CUIIO_VERS <= :pPERIOADA
                              GROUP BY CUIIO) BB
                     ON (    BB.CUIIO = FC.CUIIO
                         AND BB.CUIIO_VERS = FC.CUIIO_VERS)
                                                   
                         INNER JOIN CIS2.MD_FORM  MF ON (MF.FORM= FC.FORM)
                         INNER JOIN CIS2.RENIM R ON FC.CUIIO = R.CUIIO AND FC.CUIIO_VERS  = R.CUIIO_VERS  
                         INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = R.CUATM 
                         INNER JOIN CIS2.MD_PERIOADA MP ON MP.PERIOADA = :pPERIOADA
            WHERE 
            FC.FORM IN (:pFORM+40) 
            AND FC.STATUT <> '3'
            AND (C.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') 
            
            GROUP BY 
            MF.DEN_SHORT,
            MP.ANUL,
            MP.PERIOADA,
            MF.FORM,
            MF.DENUMIRE