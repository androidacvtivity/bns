﻿CREATE USER CIS2_ARCHIVE
  IDENTIFIED BY oracle
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 4 Roles for CIS2_ARCHIVE 
  GRANT CWM_USER TO CIS2_ARCHIVE;
  GRANT DATAPUMP_EXP_FULL_DATABASE TO CIS2_ARCHIVE;
  GRANT RESOURCE TO CIS2_ARCHIVE;
  GRANT SELECT_CATALOG_ROLE TO CIS2_ARCHIVE;
  ALTER USER CIS2_ARCHIVE DEFAULT sROLE ALL;
  -- 12 System Privileges for CIS2_ARCHIVE 
  GRANT ALTER SESSION TO CIS2_ARCHIVE;
  GRANT CREATE CLUSTER TO CIS2_ARCHIVE;
  GRANT CREATE DATABASE LINK TO CIS2_ARCHIVE;
  GRANT CREATE DIMENSION TO CIS2_ARCHIVE;
  GRANT CREATE MATERIALIZED VIEW TO CIS2_ARCHIVE;
  GRANT CREATE SEQUENCE TO CIS2_ARCHIVE;
  GRANT CREATE SESSION TO CIS2_ARCHIVE;
  GRANT CREATE SYNONYM TO CIS2_ARCHIVE;
  GRANT CREATE TABLE TO CIS2_ARCHIVE;
  GRANT CREATE VIEW TO CIS2_ARCHIVE;
  GRANT QUERY REWRITE TO CIS2_ARCHIVE;
  GRANT UNLIMITED TABLESPACE TO CIS2_ARCHIVE;
  -- 3 Object Privileges for CIS2_ARCHIVE 
    GRANT READ ON DIRECTORY DATA_FILE_DIR TO CIS2_ARCHIVE;
    GRANT EXECUTE ON SYS.DBMS_STATS TO CIS2_ARCHIVE;
    GRANT READ, WRITE ON DIRECTORY LOG_FILE_DIR TO CIS2_ARCHIVE;
