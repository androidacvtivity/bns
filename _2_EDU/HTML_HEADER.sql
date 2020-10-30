
SELECT *
    FROM  CIS2.MD_TABLES
    
    
    WHERE
    1=1 
    AND FORM = 49
    AND  regexp_like(HTML_HEADER,'height');
    
    ---------------------------------------
    ;
    
    ------------------------

SELECT *
    FROM --USER_BANCU.MD_CONTROL_CIS2
          CIS2.MD_CONTROL     
    WHERE 
       regexp_like(SQL_TEXT,'VW_DATA_ALL_TEMP')
       AND 
       regexp_like(SQL_TEXT,'VW_DATA_ALL')
       
       ; 




    UPDATE  USER_BANCU.MD_CONTROL_CIS2
    SET SQL_TEXT=trim(replace(SQL_TEXT,'ZZ_DATA_ALL_TEMP','VW_DATA_ALL_TEMP'));
    UPDATE  USER_BANCU.MD_CONTROL_CIS2
    SET SQL_TEXT=trim(replace(SQL_TEXT,'VW_DATA_ALL','VW_DATA_ALL_TEMP'));
    UPDATE  USER_BANCU.MD_CONTROL_CIS2
    SET SQL_TEXT=trim(replace(SQL_TEXT,'VW_DATA_ALL_TEMP','ZZ_DATA_ALL_TEMP'));
    


 SELECT *
    FROM USER_BANCU.MD_CONTROL_CIS2
    WHERE
    1=1 
    
    AND  regexp_like(SQL_TEXT,'VW_DATA_ALL_TEMP');

COMMIT;
CREATE TABLE USER_BANCU.MD_CONTROL_CIS2
     AS 
    SELECT *
      FROM CIS2.MD_CONTROL;

DROP TABLE USER_BANCU.MD_CONTROL_CIS2 CASCADE CONSTRAINTS;

    SELECT SYSDATE
         FROM DUAL;