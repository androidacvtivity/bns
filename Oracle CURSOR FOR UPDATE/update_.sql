DECLARE -- ====================================================================

CURSOR C IS



               SELECT
                  CI.CLASS_CODE, 
                  CI.ITEM_CODE_VERS,
                  CI.ITEM_CODE,
                  CI.SHOW_ORDER,
                  TO_NUMBER(A02) AS NEW_SHOW_ORDER
                 
                FROM
                  CIS2.VW_CLS_CLASS_ITEM CI
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
                  
                  
         
        



;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE 
CIS2.CLS_CLASS_ITEM
--USER_BANCU.CLS_CLASS_ITEM_TEMP 
SET
SHOW_ORDER = TRIM(CR.NEW_SHOW_ORDER)




WHERE


         CLASS_CODE      =  CR.CLASS_CODE 
    AND  ITEM_CODE_VERS  =  CR.ITEM_CODE_VERS
    AND  ITEM_CODE       =  CR.ITEM_CODE
   


;
END LOOP;
END; 