-- INSERT INTO CIS2.MD_RIND
--
--(
--                        ID_MD,
--                        FORM,
--                        FORM_VERS,
--                        CAPITOL,
--                        CAPITOL_VERS,
--                        RIND,
--                        RIND_VERS,
--                        DENUMIRE,
--                        DECIMAL_POS,
--                        COL_ACTIV,
--                        ORDINE,
--                        DATA_REG,
--                        STATUT,
--                        DINAMIC     
--)                      
--                      
                      SELECT 
                        ID_MD,
                        8 FORM,
                        2000 FORM_VERS,
                        326 CAPITOL,
                        2008 CAPITOL_VERS,
                        RIND,
                        2008 RIND_VERS,
                        DENUMIRE,
                        '1111'DECIMAL_POS,
                        '11X1' COL_ACTIV,
                        ORDINE,
                        SYSDATE DATA_REG,
                        STATUT,
                        DINAMIC     
                                    
                                    FROM CIS.MD_RIND
                                    WHERE 
                                    
                                    FORM = 6 AND CAPITOL = 32 AND STATUT <> '3' AND RIND_VERS = 1044
                                    AND RIND NOT IN ('910','920')
                                    
                                    
                                    ORDER BY ORDINE