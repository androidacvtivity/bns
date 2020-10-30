CREATE OR REPLACE FORCE VIEW USER_BANCU.EI_78_2008_REST
(
   CUIIO,
   CUIIO_VERS,
   DENUMIRE,
   CUATM,
   CAEM2,
   CFP
)
AS

   SELECT A.CUIIO,
          A.CUIIO_VERS,
          A.DENUMIRE,
          A.CUATM,
          CA.CODUL CAEM2,
          A.CFP
     FROM (SELECT D.CUIIO,
                  2008 CUIIO_VERS,
                  D.DENUMIRE,
                  CASE
                     WHEN (    LENGTH (D.CUATM) = 6
                           AND (   SUBSTR (D.CUATM, 1, 1) = 1
                                OR SUBSTR (D.CUATM, 1, 1) = 3))
                     THEN
                        '0' || D.CUATM
                     ELSE
                        CUATM
                  END
                     CUATM,
                  SUBSTR (D.CUATM, 1, 1) CUATM_TEMP,
                  D.CFP,
                  --    SUBSTR(D.CAEM2,2,8) CAEM_MODF,
                  CASE
                     WHEN LENGTH (D.CAEM2) = 5 THEN SUBSTR (D.CAEM2, 2, 8)
                     ELSE D.CAEM2
                  END
                     AS CAEM2
             FROM USER_BANCU.KATALOG_EI_78 D
                  LEFT JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL = D.CAEM2
            WHERE 1 = 1 
            
            AND D.CUIIO IN (
            
            SELECT 
             
             
             
             R.CUIIO

                FROM USER_BANCU.VW_KATALOG_RSF1_2008 L
                
                
                            RIGHT JOIN USER_BANCU.EI_78_2008 R ON L.CUIIO = R.CUIIO-- AND L.CUIIO_VERS = R.CUIIO_VERS  
                            
                            
                            WHERE 
                            
                            L.CUIIO IS  NULL
            
            )
            
                                            -- AND C.CODUL IS NULL
                       ) A
          LEFT JOIN CIS2.VW_CL_CUATM C ON C.CODUL = A.CUATM
          LEFT JOIN CIS2.VW_CL_CAEM2 CA ON CA.NUM_CODE = A.CAEM2
          LEFT JOIN CIS2.VW_CL_CFP CF ON CF.CODUL = A.CFP
    WHERE     C.CODUL IS NOT NULL
          AND CA.CODUL IS NOT NULL
          AND CF.CODUL IS NOT NULL;
