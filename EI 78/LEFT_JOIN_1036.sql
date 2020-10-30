



                          SELECT
                            L.ID_MD  L_ID_MD,
                            --------------------------------------------
                            CASE 
                            
                            WHEN   TRIM(L.ID_MD) = 19516 THEN  40938 --1
                            WHEN   TRIM(L.ID_MD) = 22547 THEN  40939 --2
                            WHEN   TRIM(L.ID_MD) = 19589 THEN  40940 --3
                            WHEN   TRIM(L.ID_MD) = 19518 THEN  40941 --4
                            WHEN   TRIM(L.ID_MD) = 19591 THEN  40942 --5
                            WHEN   TRIM(L.ID_MD) = 19590 THEN  40942 --6
                            
                            ELSE L.ID_MD END  MODIF_ID_MD, 
                            
                            
                            
                            L.RIND   L_RIND,
                            R.RIND   R_RIND,
                            R.ID_MD  R_ID_MD,
                            L.RIND_VERS L_RIND_VERS,
                            R.RIND_VERS R_RIND_VERS,
                            L.ORDINE    AS L_ORDINE,  
                            R.ORDINE    AS R_ORDINE
                          FROM
                
                        
                    (

                        SELECT 
                            MR.ID_MD,
                            MR.RIND,
                            MR.RIND_VERS,
                            MR.ORDINE  
                            
                            FROM CIS2.MD_RIND  MR 
                           
                             WHERE  
                             
                             MR.FORM IN (44)
                             
                             AND MR.CAPITOL IN (405)
                             AND MR.RIND_VERS = 1028
                             
                             
                             ORDER BY 
                             
                             ORDINE
                             
                             ) L  LEFT JOIN (
                             
                             
                             SELECT 
                            MR.ID_MD,
                            MR.RIND,
                            MR.RIND_VERS,
                            MR.ORDINE  
                            
                            FROM CIS2.MD_RIND  MR 
                           
                             WHERE  
                             
                             MR.FORM IN (44)
                             
                             AND MR.CAPITOL IN (405)
                             AND MR.RIND_VERS = 1036
                             
                             
                             ORDER BY 
                             
                             ORDINE
                             
                             ) R ON R.RIND = L.RIND 
                             
                             
                             WHERE
                             
                             R.RIND IS NOT NULL 
                             
                             
                             ORDER BY    
                             L.ORDINE
                             