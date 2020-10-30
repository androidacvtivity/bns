


SELECT SYSDATE 


    FROM DUAL;


-----------------------------------------------------------------------------------
SELECT *
    FROM (
   SELECT 'ACTION' Parameter, SYS_CONTEXT ('USERENV', 'ACTION') PARAM
     FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------


   SELECT 'AUDITED_CURSORID' Parameter,
          SYS_CONTEXT ('USERENV', 'AUDITED_CURSORID') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------


   SELECT 'AUTHENTICATED_IDENTITY' Parameter,
          SYS_CONTEXT ('USERENV', 'AUTHENTICATED_IDENTITY') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------

   SELECT 'AUTHENTICATION_METHOD' Parameter,
          SYS_CONTEXT ('USERENV', 'AUTHENTICATION_METHOD') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------

   SELECT 'AUTHENTICATION_METHOD' Parameter,
          SYS_CONTEXT ('USERENV', 'AUTHENTICATION_TYPE') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------
   SELECT 'BG_JOB_ID' Parameter, SYS_CONTEXT ('USERENV', 'BG_JOB_ID') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------
   SELECT 'CLIENT_IDENTIFIER' Parameter,
          SYS_CONTEXT ('USERENV', 'CLIENT_IDENTIFIER') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------
   SELECT 'CLIENT_INFO' Parameter,
          SYS_CONTEXT ('USERENV', 'CLIENT_INFO') PARAM
     FROM DUAL
   UNION ALL
   ------------------------------------------------------------------------------

   SELECT 'CURRENT_BIND' Parameter,
          SYS_CONTEXT ('USERENV', 'CURRENT_BIND') PARAM
     FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'CURRENT_SCHEMA' Parameter,
          SYS_CONTEXT ('USERENV', 'CURRENT_SCHEMA') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------
   SELECT 'CURRENT_SCHEMAID' Parameter,
          SYS_CONTEXT ('USERENV', 'CURRENT_SCHEMAID') PARAM
     FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'CURRENT_SQL' Parameter,
          SYS_CONTEXT ('USERENV', 'CURRENT_SQL') PARAM
     FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'CURRENT_SQL_LENGTH' Parameter,
          SYS_CONTEXT ('USERENV', 'CURRENT_SQL_LENGTH') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------
   SELECT 'CURRENT_USER' Parameter,
          SYS_CONTEXT ('USERENV', 'CURRENT_USER') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------
   SELECT 'CURRENT_USERID' Parameter,
          SYS_CONTEXT ('USERENV', 'CURRENT_USERID') PARAM
     FROM DUAL
   UNION ALL
   ------------------------------------------------------------------------------
   SELECT 'DB_DOMAIN' Parameter, SYS_CONTEXT ('USERENV', 'DB_DOMAIN') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------
   SELECT 'DB_NAME' Parameter, SYS_CONTEXT ('USERENV', 'DB_NAME') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------
   SELECT 'DB_UNIQUE_NAME' Parameter,
          SYS_CONTEXT ('USERENV', 'DB_UNIQUE_NAME') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------
   SELECT 'ENTRYID' Parameter, SYS_CONTEXT ('USERENV', 'ENTRYID') PARAM
     FROM DUAL
   UNION ALL
   -------------------------------------------------------------------------------
   SELECT 'ENTERPRISE_IDENTITY' Parameter,
          SYS_CONTEXT ('USERENV', 'ENTRYID') PARAM
     FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'FG_JOB_ID' Parameter, SYS_CONTEXT ('USERENV', 'FG_JOB_ID') PARAM
     FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'GLOBAL_CONTEXT_MEMORY' Parameter,
          SYS_CONTEXT ('USERENV', 'GLOBAL_CONTEXT_MEMORY') PARAM
     FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'GLOBAL_UID' Parameter, SYS_CONTEXT ('USERENV', 'GLOBAL_UID') PARAM
     FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'HOST' Parameter, SYS_CONTEXT ('USERENV', 'HOST') PARAM FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'IDENTIFICATION_TYPE' Parameter,
          SYS_CONTEXT ('USERENV', 'IDENTIFICATION_TYPE') PARAM
     FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'INSTANCE' Parameter, SYS_CONTEXT ('USERENV', 'INSTANCE') PARAM
     FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'INSTANCE_NAME' Parameter,
          SYS_CONTEXT ('USERENV', 'INSTANCE_NAME') PARAM
     FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'IP_ADDRESS' Parameter, SYS_CONTEXT ('USERENV', 'IP_ADDRESS') PARAM
     FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'ISDBA' Parameter, SYS_CONTEXT ('USERENV', 'ISDBA') PARAM FROM DUAL
   UNION ALL
   --------------------------------------------------------------------------------
   SELECT 'LANG' Parameter, SYS_CONTEXT ('USERENV', 'LANG') PARAM FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'LANGUAGE' Parameter, SYS_CONTEXT ('USERENV', 'LANGUAGE') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'MODULE' Parameter, SYS_CONTEXT ('USERENV', 'MODULE') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'NETWORK_PROTOCOL' Parameter,
          SYS_CONTEXT ('USERENV', 'NETWORK_PROTOCOL') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'NLS_CALENDAR' Parameter,
          SYS_CONTEXT ('USERENV', 'NLS_CALENDAR') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'NLS_CURRENCY' Parameter,
          SYS_CONTEXT ('USERENV', 'NLS_CURRENCY') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'NLS_DATE_FORMAT' Parameter,
          SYS_CONTEXT ('USERENV', 'NLS_DATE_FORMAT') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'NLS_DATE_LANGUAGE' Parameter,
          SYS_CONTEXT ('USERENV', 'NLS_DATE_LANGUAGE') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'NLS_SORT' Parameter, SYS_CONTEXT ('USERENV', 'NLS_SORT') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'NLS_TERRITORY' Parameter,
          SYS_CONTEXT ('USERENV', 'NLS_TERRITORY') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'OS_USER' Parameter, SYS_CONTEXT ('USERENV', 'OS_USER') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'POLICY_INVOKER' Parameter,
          SYS_CONTEXT ('USERENV', 'POLICY_INVOKER') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'PROXY_ENTERPRISE_IDENTITY' Parameter,
          SYS_CONTEXT ('USERENV', 'PROXY_ENTERPRISE_IDENTITY') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'PROXY_USER' Parameter, SYS_CONTEXT ('USERENV', 'PROXY_USER') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'PROXY_USERID' Parameter,
          SYS_CONTEXT ('USERENV', 'PROXY_USERID') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'SERVER_HOST' Parameter,
          SYS_CONTEXT ('USERENV', 'SERVER_HOST') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'SESSION_USER' Parameter,
          SYS_CONTEXT ('USERENV', 'SESSION_USER') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'SESSION_USERID' Parameter,
          SYS_CONTEXT ('USERENV', 'SESSION_USERID') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'SESSIONID' Parameter, SYS_CONTEXT ('USERENV', 'SESSIONID') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'SID' Parameter, SYS_CONTEXT ('USERENV', 'SID') PARAM FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'STATEMENTID' Parameter,
          SYS_CONTEXT ('USERENV', 'STATEMENTID') PARAM
     FROM DUAL
   --------------------------------------------------------------------------------
   UNION ALL
   SELECT 'TERMINAL' Parameter, SYS_CONTEXT ('USERENV', 'TERMINAL') PARAM
     FROM DUAL
     )

     WHERE 
     PARAM IS NOT NULL

       
       
       