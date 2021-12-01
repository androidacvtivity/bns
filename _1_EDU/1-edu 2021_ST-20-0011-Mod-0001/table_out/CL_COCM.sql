    SELECT 
                  CI.ITEM_CODE,
                  CI.DENUMIRE,
                  CI.ITEM_PATH,
                  CI.ITEM_CODE_VERS
                FROM

(
SELECT
                  CI.ITEM_CODE,
                  CI.ITEM_PATH,
                  CI.NAME DENUMIRE,
                  MAX(CI.ITEM_CODE_VERS) AS ITEM_CODE_VERS
                FROM
                  VW_CLS_CLASS_ITEM CI
                WHERE
                  CI.CLASS_CODE IN ('COCM') AND
                  CI.ITEM_CODE_VERS <= :pPERIOADA
                GROUP BY
                  CI.ITEM_CODE,
                  CI.ITEM_PATH,
                  CI.NAME
                  ) CI 
                  
                  
--                  WHERE 
--                  CI.ITEM_CODE IN ('8704','7094','4874','7614','7774','7994','8064','9994')


ORDER BY
CI.ITEM_PATH