



        SELECT 
        L.UNIT_CODE
        FROM 

       (
         SELECT 
               ID_GOSP AS UNIT_CODE

          FROM  USER_BANCU.KATALOG_3CMPA ) L  LEFT JOIN  (
          
          SELECT            
 
                   FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,
                   FC.NR_GOSP,         
                   FC.NR_MAPS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
                   
              FROM


(

        SELECT     FC.UNIT_CODE,
                   FC.UNIT_CODE_VERS,
                   FC.NR_GOSP,         
                   FC.NR_MAPS,
                   FC.FORM,
                   FC.FORM_VERS,
                   FC.STATUT
                   
              FROM CIS2.FORM_REG_UNIT_GC  FC
                   INNER JOIN (  SELECT UNIT_CODE, MAX (UNIT_CODE_VERS ) UNIT_CODE_VERS 
                                   FROM CIS2.FORM_REG_UNIT_GC
                                  WHERE FORM IN (:pFOMR) AND UNIT_CODE_VERS  <= :pPERIOADA
                               GROUP BY UNIT_CODE) BB
                       ON (    BB.UNIT_CODE = FC.UNIT_CODE
                           AND BB.UNIT_CODE_VERS   = FC.UNIT_CODE_VERS  )
             WHERE FC.FORM IN (:pFOMR) AND FC.STATUT <> '3' ) FC 
             
          
          ) R ON L.UNIT_CODE = R.UNIT_CODE  
          
          
          WHERE 
          R.R.UNIT_CODE IS  NULL  