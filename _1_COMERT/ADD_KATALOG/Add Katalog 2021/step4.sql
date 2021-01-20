SELECT 
  L.CUIIO,
  L.CUIIO_VERS,
  L.DENUMIRE,
  L.CUATM,
  L.CFP,
  L.CAEM2  


FROM USER_BANCU.KAT_1_COMERT_2009_FINAL  L 

                LEFT JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS  = L.CUIIO_VERS 
                
                WHERE 
                R.CUIIO IS NOT   NULL;
                
                
                
--                update   USER_BANCU.KAT_1_COMERT_2009_FINAL
--                
--                SET CUIIO_VERS = 2009;