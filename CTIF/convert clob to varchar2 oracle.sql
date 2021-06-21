


SELECT 

  FORMID,--         NUMBER,
  XML,--            CLOB                           NOT NULL,
  
  TRIM(CAST(XML AS VARCHAR2(4000))) AS XML_1,
  TRIM(dbms_lob.substr(XML, 4000, 1)) XML_2, 
  STATUS,--         NUMBER                         NOT NULL,
  FORM_TYPE,--      VARCHAR2(50 BYTE),
  DATA_REG,--       DATE,
  CHECK_CONFIRM,--  NUMBER,
  MESAJ          --VARCHAR2(4000 BYTE)
  
  
FROM USER_EREPORTING.F_XML_FORMS