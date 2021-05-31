--INSERT INTO CIS2.RENIM (
--
--  CUIIO,
--  CUIIO_VERS,
--  DENUMIRE,
--  EDIT_USER,
--  STATUT, 
--  CUATM,
--  CFP,
--  CAEM2,
--  IDNO  
--
--)



SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
  1 EDIT_USER,
  '1' STATUT, 
  L.CUATM,
  L.CFP,
  L.CAEM2,
  L.IDNO  

FROM (

         SELECT 
            TRIM(L.CUIIO) CUIIO,
            TRIM(L.CUIIO_VERS) CUIIO_VERS,
            TRIM(L.DENUMIRE) DENUMIRE,
            TRIM(L.CUATM) CUATM,
            TRIM(L.CFP) CFP,
            TRIM(L.CFOJ) CFOJ,
            TRIM(L.CAEM2) CAEM2,
            TRIM(L.IDNO) IDNO
            
                FROM USER_BANCU.KAT_RSF L
) L  


            LEFT JOIN CIS2.RENIM R  ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS  
            
            
            WHERE 
            
            R.CUIIO IS NOT  NULL 