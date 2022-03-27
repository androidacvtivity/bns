 
SELECT 
 ITEM_CODE,
 SHOW_ORDER,
 ITEM_PARENT,
    NAME
FROM
 (
 SELECT 
 ITEM_CODE,
 SHOW_ORDER,
 ITEM_PARENT,
    NAME
        
        
            FROM CIS2.VW_CLS_CLASS_ITEM 
            
            WHERE 
            1=1
            AND CLASS_CODE = 'CSPM2' 
            AND ITEM_PARENT NOT IN  ('00.00.00')
            
            ORDER BY
            SHOW_ORDER
            )
            
            WHERE 
            ITEM_CODE IN ('50.40.2')