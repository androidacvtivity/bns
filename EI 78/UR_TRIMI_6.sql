        SELECT 
              DISTINCT  D.CUIIO
            
              FROM CIS2.DATA_ALL  D
              
                         INNER JOIN CIS2.MD_RIND MR ON MR.ID_MD = D.ID_MD
              
              WHERE
              
              D.PERIOADA IN (1036) 
              AND D.FORM IN (44)
              AND MR.CAPITOL IN (405,406,407,408)
              
              AND MR.RIND_VERS =   1028
              