﻿

CREATE TABLE USER_BANCU.CIS2_RENIM
(
  CUIIO           NUMBER                        ,
  CUIIO_VERS      NUMBER                        ,
  DENUMIRE        VARCHAR2(255 BYTE),
  EDIT_USER       NUMBER                        ,
  STATUT          VARCHAR2(1 BYTE)              ,
  CUATM           VARCHAR2(7 BYTE)              ,
  CFP             VARCHAR2(2 BYTE),
  CFOJ            VARCHAR2(3 BYTE),
  COCM            VARCHAR2(4 BYTE),
  CAEM            VARCHAR2(6 BYTE),
  BUGET           VARCHAR2(1 BYTE)              ,
  TIP             VARCHAR2(2 BYTE)              ,
  PROD            VARCHAR2(2 BYTE),
  FOR_CUB         VARCHAR2(2 BYTE),
  GENMUZEE        VARCHAR2(2 BYTE),
  TIPMUZEE        VARCHAR2(2 BYTE),
  TIP_LOCAL       VARCHAR2(2 BYTE),
  TIP_INST        NUMBER,
  CAEM2           VARCHAR2(6 BYTE),
  N85_NTL         VARCHAR2(2 BYTE),
  N85_NTIIP       VARCHAR2(2 BYTE),
  N85_NDIIP       VARCHAR2(2 BYTE),
  N85_NPDS        VARCHAR2(2 BYTE),
  N85_NRIIP       VARCHAR2(2 BYTE),
  N85_NSIIP       VARCHAR2(2 BYTE),
  GENMUZEE2       VARCHAR2(2 BYTE),
  NFI             NUMBER,
  NTII            NUMBER,
  NPDS            NUMBER,
  ORGANE          VARCHAR2(5 BYTE),
  TIP_INV         VARCHAR2(2 BYTE),
  RENIM_PERS      NUMBER,
  ORGANE_COND     VARCHAR2(8 BYTE),
  GEN_INSTITUTIE  VARCHAR2(1 BYTE),
  IDNO            VARCHAR2(13 BYTE)
)
TABLESPACE TBS_DTI_USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;
