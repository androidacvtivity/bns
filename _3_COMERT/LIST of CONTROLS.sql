                    SELECT 
                                C.CONTROL,
                                C.CONTROL_VERS,
                                C.FORMULA,
                                C.PRIORITATEA,
                                C.STATUT                                                                                                          

                             FROM CIS2.MD_CONTROL C

                                        INNER JOIN                     
                               (                   
                                SELECT 
                                
                                 MC.CONTROL,
                                 
                                 MAX(MC.CONTROL_VERS) CONTROL_VERS
                                 
                                 FROM CIS2.MD_CONTROL MC
                                 
                                 WHERE 
                                 MC.FORM IN (:pFORM)
                                 AND MC.CONTROL_VERS <= :pPERIOADA
                                 
                                 
                                 GROUP BY 
                                 MC.CONTROL
                                 ) A ON A.CONTROL = C.CONTROL AND A.CONTROL_VERS = C.CONTROL_VERS 
                                 
                                 
                                 WHERE
                                 C.FORM   IN (:pFORM)
                                 
                               --  AND C.STATUT <> '3'
                                 
                                 
                                 
                                 ORDER BY 
                                 
                                 C.CONTROL 
                                 
                                 