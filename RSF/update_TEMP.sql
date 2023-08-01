DECLARE
  v_old_text VARCHAR2(32767) := 'VW_DATA_ALL_FR';
  v_new_text VARCHAR2(32767) := 'VW_DATA_ALL_FR_TEMP';
BEGIN
  UPDATE CIS2.MD_CONTROL
  SET SQL_TEXT = REPLACE(REPLACE(SQL_TEXT, v_old_text, v_new_text), 'CIS2.' || v_old_text, 'CIS2.' || v_new_text)
  WHERE (INSTR(SQL_TEXT, 'VW_DATA_ALL_FR_TEMP') = 0 AND INSTR(SQL_TEXT, 'CIS2.VW_DATA_ALL_FR_TEMP') = 0)
    AND FORM IN (57, 59, 63, 66)
     AND CONTROL IN ('RF3-042') 
      
      AND CONTROL_VERS = 2000
    
    AND (
      (INSTR(SQL_TEXT, v_old_text) > 0 OR INSTR(SQL_TEXT, 'CIS2.' || v_old_text) > 0)
      OR (INSTR(SQL_TEXT, 'VW_DATA_ALL_FR_TEMP') > 0 OR INSTR(SQL_TEXT, 'CIS2.VW_DATA_ALL_FR_TEMP') > 0)
      
     
    );
END;
/