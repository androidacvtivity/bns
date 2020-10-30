--INSERT  INTO CIS2.MD_RIND
-- (
--  ID_MD,
--  FORM,
--  FORM_VERS,
--  CAPITOL,
--  CAPITOL_VERS,
--  RIND,
--  RIND_VERS,
--  DENUMIRE,
--  DECIMAL_POS,
--  COL_ACTIV,
--  ORDINE,
--  DATA_REG,
--  STATUT,
--  DINAMIC
--)


    SELECT 
    
 ID_MD,
  FORM,
  FORM_VERS,
  1076 CAPITOL,
  CAPITOL_VERS,
  RIND,
  RIND_VERS,
  DENUMIRE,
  DECIMAL_POS,
  COL_ACTIV,
  ORDINE,
  DATA_REG,
  STATUT,
  DINAMIC
        
        FROM CIS2.MD_RIND
        
        WHERE 
        
        FORM IN (54)
        
        
        ;







-------------------------------------------------------------------------------

             SELECT 
             
                MAX(CAPITOL)  MAX_CAPITOL
             
                FROM CIS2.MD_CAPITOL;




--------------------------------------------------------------------------------
      

            SELECT *
            
                FROM CIS2.MD_CAPITOL
                
                ORDER BY 
                CAPITOL
                ;
                
                