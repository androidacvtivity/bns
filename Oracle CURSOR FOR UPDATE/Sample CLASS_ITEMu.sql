DECLARE -- ====================================================================

CURSOR C IS



SELECT
    L.CLASS_CODE,
    L.ITEM_CODE_VERS,
    L.ITEM_CODE,
    L.ITEM_PARENT,
    L.NAME,
    L.SHOW_ORDER,
    L.SYS_USER,
    L.A01 NEW_A01,
    SUBSTR (L.A02,1,99) NEW_A02


FROM USER_BANCU.VW_CSPM2  L
         
        



;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE CIS2.CLS_CLASS_ITEM SET
A01 = TRIM(CR.NEW_A01),
A02 = TRIM(CR.NEW_A02)
WHERE


         CLASS_CODE      =  CR.CLASS_CODE 
    AND  ITEM_CODE_VERS  =  CR.ITEM_CODE_VERS
    AND  ITEM_CODE       =  CR.ITEM_CODE
    AND  ITEM_PARENT     =  CR.ITEM_PARENT 
    AND  NAME            =  CR.NAME
    AND  SHOW_ORDER      =  CR.SHOW_ORDER 
    AND  SYS_USER        =  CR.SYS_USER


;
END LOOP;
END; 