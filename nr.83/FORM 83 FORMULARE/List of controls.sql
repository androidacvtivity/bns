SELECT 
  L.CONTROL,
--  L.CONTROL_VERS,
--  L.FORM,
--  L.FORM_VERS,
  L.CAPITOL,
--  L.CAPITOL_VERS,
--  L.ID_MD,
  L.FORMULA,
  L.PRIORITATEA,
--  L.DATA_REG,
  L.STATUT   

           FROM M53.MD_CONTROL L
           
           INNER JOIN 

           ( SELECT 
             L.CONTROL,
             MAX (L.CONTROL_VERS) CONTROL_VERS
                        
             FROM M53.MD_CONTROL L
             
             WHERE 
             L.FORM = 39
             
             GROUP BY 
             L.CONTROL
             
             ) R ON L.CONTROL= R.CONTROL AND L.CONTROL_VERS = R.CONTROL_VERS
             
             
             ORDER BY
             L.CONTROL