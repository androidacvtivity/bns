 SELECT 
         L.CUIIO,
         L.CUIIO_VERS,
         L.DENUMIRE,
         L.CUATM,
         L.CFP,
         L.CFOJ,
         L.CAEM2,
         L.IDNO
            FROM USER_BANCU.CIS2_RENIM L;
            
            
            UPDATE USER_BANCU.CIS2_RENIM 
            
            SET CUIIO_VERS = 2009;