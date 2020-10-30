



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
                                           SELECT TRIM (A.CUIIO) CUIIO,
                                                  TRIM (A.CUIIO_VERS)
                                                     CUIIO_VERS,
                                                  TRIM (A.DENUMIREA)
                                                     DENUMIREA,
                                                  CASE
                                                     WHEN LENGTH (
                                                             TRIM (A.CUATM)) =
                                                             6
                                                     THEN
                                                        '0' || TRIM (A.CUATM)
                                                     ELSE
                                                        TRIM (A.CUATM)
                                                  END
                                                     AS CUATM,
                                                  TRIM (A.CAEM2) CAEM2,
                                                  TRIM (A.CFP) CFP
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


--------------------------------------------------------------------------------

       SELECT COUNT (*) CNT
        
        FROM USER_BANCU.CATALOG_1036;
-------------------------------------------------------------------------------
        SELECT * 
        
        FROM USER_BANCU.CATALOG_1036;