SELECT
                  CI.ITEM_CODE
                  
                FROM
                  VW_CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('CSPM2') 
    
                 AND CI.ITEM_PARENT NOT IN  ('00.00.00')