--INSERT INTO CIS2.RENIM
--(
--   CUIIO,
--   CUIIO_VERS,
--   DENUMIRE,
--   EDIT_USER,
--   STATUT,
--   CUATM,
--   CFP,
--   CFOJ,
--   COCM,
--   CAEM,
--   BUGET,
--   TIP,
--   PROD,
--   FOR_CUB,
--   GENMUZEE,
--   TIPMUZEE,
--   TIP_LOCAL,
--   TIP_INST,
--   CAEM2,
--   N85_NTL,
--   N85_NTIIP,
--   N85_NDIIP,
--   N85_NPDS,
--   N85_NRIIP,
--   N85_NSIIP,
--   GENMUZEE2,
--   NFI,
--   NTII,
--   NPDS,
--   ORGANE,
--   TIP_INV,
--   RENIM_PERS,
--   ORGANE_COND
--  
--)


    SELECT 
          R.CUIIO,
          L.CUIIO_VERS,
          R.DENUMIRE,
          R.EDIT_USER,
          R.STATUT,
          R.CUATM,
          R.CFP,
          R.CFOJ,
          R.COCM,
          R.CAEM,
          R.BUGET,
          R.TIP,
          R.PROD,
          R.FOR_CUB,
          R.GENMUZEE,
          R.TIPMUZEE,
          R.TIP_LOCAL,
          R.TIP_INST,
          R.CAEM2,
          R.N85_NTL,
          R.N85_NTIIP,
          R.N85_NDIIP,
          R.N85_NPDS,
          R.N85_NRIIP,
          R.N85_NSIIP,
          R.GENMUZEE2,
          R.NFI,
          R.NTII,
          R.NPDS,
          R.ORGANE,
          R.TIP_INV,
          R.RENIM_PERS,
          R.ORGANE_COND
       FROM 

(
SELECT
       L.CUIIO,
       L.CUIIO_VERS,
       L.DENUMIREA,
       L.CUATM,
       L.CAEM2,
       L.CFP

      FROM USER_BANCU.EI_78_1036 L 
               
                LEFT JOIN CIS2.RENIM R ON (R.CUIIO = L.CUIIO AND 
                                            R.CUIIO_VERS = L.CUIIO_VERS) 
      
         WHERE 
         R.CUIIO IS  NULL
         AND R.CUIIO_VERS IS  NULL 
         
         
         
         
         )  L  LEFT JOIN USER_BANCU.VW_KATALOG_EI_78_1036 R ON (L.CUIIO = R.CUIIO)
         
         WHERE 
         R.CUIIO IS NOT NULL
         
         
         ;


--------------------------------------------------------------------------------

SELECT
       L.CUIIO,
       L.CUIIO_VERS,
       L.DENUMIREA,
       L.CUATM,
       L.CAEM2,
       L.CFP

      FROM USER_BANCU.EI_78_1036 L 
               
                LEFT JOIN CIS2.RENIM R ON (R.CUIIO = L.CUIIO AND 
                                            R.CUIIO_VERS = L.CUIIO_VERS) 
      
         WHERE 
         R.CUIIO IS  NULL
         AND R.CUIIO_VERS IS  NULL
;
      
      
      
      
   
--------------------------------------------------------------------------------

SELECT
       CUIIO,
       CUIIO_VERS,
       DENUMIREA,
       CUATM,
       CAEM2,
       CFP

      FROM USER_BANCU.EI_78_1036;



--------------------------------------------------------------------------------

INSERT INTO USER_BANCU.EI_78_1036 (

       CUIIO,
       CUIIO_VERS,
       DENUMIREA,
       CUATM,
       CAEM2,
       CFP

)


SELECT
       CUIIO,
       CUIIO_VERS,
       DENUMIREA,
       CUATM,
       CAEM2,
       CFP

      FROM USER_BANCU.VW_EI_78_1036;
-------------------------------------------------------------------------------;

CREATE TABLE USER_BANCU.EI_78_1036
(
  CUIIO       VARCHAR2(1024 BYTE),
  DENUMIREA   VARCHAR2(1024 BYTE),
  CUATM       VARCHAR2(1024 BYTE),
  CAEM2       VARCHAR2(1024 BYTE),
  CFP         VARCHAR2(1024 BYTE),
  CUIIO_VERS  VARCHAR2(1024 BYTE)
)
TABLESPACE TBS_DTI_USERS
RESULT_CACHE (MODE DEFAULT)
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MAXSIZE          UNLIMITED
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

-------------------------------------------------------------------------------
--For the modified catalog I create a new table and insert it into it.
SELECT
       CUIIO,
       CUIIO_VERS,
       DENUMIREA,
       CUATM,
       CAEM2,
       CFP

      FROM USER_BANCU.VW_EI_78_1036;


-------------------------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW USER_BANCU.VW_EI_78_1036
(
   CUIIO,
   CUIIO_VERS,
   DENUMIREA,
   CUATM,
   CAEM2,
   CFP
)
AS
   SELECT A.CUIIO,
          A.CUIIO_VERS,
          A.DENUMIREA,
          A.CUATM,
          A.CAEM2,
          A.CFP
     FROM ( -------------------------------------------------------------------------------------
           --5  Start SQL
           SELECT A.CUIIO,
                  A.CUIIO_VERS,
                  A.DENUMIREA,
                  A.CUATM,
                  C.CODUL CAEM2,
                  A.CFP
             FROM (                                             --4  Start SQL
                   SELECT A.CUIIO,
                          A.CUIIO_VERS,
                          A.DENUMIREA,
                          A.CUATM,
                          A.CAEM2,
                          A.CFP
                     FROM (                                     --3  Start SQL
                           SELECT A.CUIIO,
                                  A.CUIIO_VERS,
                                  A.DENUMIREA,
                                  A.CUATM,
                                  CASE
                                     WHEN LENGTH (A.CAEM2) = 5
                                     THEN
                                        SUBSTR (A.CAEM2, 2)
                                     ELSE
                                        A.CAEM2
                                  END
                                     CAEM2,
                                  A.CFP
                             FROM (                             --2  Start SQL
                                   SELECT A.CUIIO,
                                          A.CUIIO_VERS,
                                          A.DENUMIREA,
                                          A.CUATM,
                                          CASE
                                             WHEN LENGTH (A.CAEM2) = 3
                                             THEN
                                                '0' || A.CAEM2
                                             ELSE
                                                A.CAEM2
                                          END
                                             CAEM2,
                                          A.CFP
                                     FROM (                      --1 Start SQL
                                           SELECT TRIM(A.CUIIO) CUIIO,
                                                  TRIM(A.CUIIO_VERS)  CUIIO_VERS,
                                                  TRIM(A.DENUMIREA) DENUMIREA,
                                                  CASE
                                                     WHEN LENGTH (TRIM(A.CUATM)) =
                                                             6
                                                     THEN
                                                        '0' || TRIM(A.CUATM)
                                                     ELSE
                                                        TRIM(A.CUATM)
                                                  END
                                                     AS CUATM,
                                                  TRIM(A.CAEM2) CAEM2,
                                                  TRIM(A.CFP)   CFP
                                             FROM USER_BANCU.CATALOG_1036 A --1 END SQL
                                                                           )
                                          A
                                          LEFT JOIN CIS2.VW_CL_CUATM C
                                             ON (C.CODUL = A.CUATM)
                                    WHERE C.CODUL IS NOT NULL    --2 End t SQL
                                                             ) A
                            WHERE A.CAEM2 IS NOT NULL             -- 3 END SQL
                                                     ) A
                    WHERE LENGTH (A.CAEM2) = 4                    -- 4 END SQL
                                              ) A
                  LEFT JOIN CIS2.VW_CL_CAEM2 C
                     ON (SUBSTR (C.CODUL, 2) = A.CAEM2)
                  LEFT JOIN CIS2.VW_CL_CFP CF ON A.CFP = CF.CODUL
            WHERE C.CODUL IS NOT NULL AND CF.CODUL IS NOT NULL) A;



-------------------------------------------------------------------------------
        SELECT
        CUIIO,
        DENUMIREA,
        CUATM,
        CAEM2,
        CFP,
        CUIIO_VERS 

        FROM USER_BANCU.CATALOG_1036
        
        WHERE 
        1=1
        --AND CUIIO IS NOT NULL
        --AND DENUMIREA IS NOT NULL
        --AND CUATM IS NOT NULL
       -- AND CAEM2 IS NOT NULL
        
        AND CFP IS NOT NULL;
        ;