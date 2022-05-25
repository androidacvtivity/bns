     SELECT
                  CI.CLASS_CODE, 
                  CI.ITEM_CODE_VERS,
                  CI.ITEM_CODE,
                  CI.SHOW_ORDER,
                  TO_NUMBER(A02) AS NEW_SHOW_ORDER
                 
                FROM
                  VW_CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('TARI_ISO') 
    
                GROUP BY
                  CI.ITEM_CODE,
                  CI.CLASS_CODE,
                  CI.SHOW_ORDER,
                  CI.ITEM_CODE_VERS,
                  TO_NUMBER(A02)
                  
                  
                  ORDER BY 
                  TO_NUMBER(A02)
                  