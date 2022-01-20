SELECT 
  L.CUIIO,
  L.CUIIO_VERS, 
  L.DENUMIRE,
  L.CUATM,
  L.CFP,        
  L.CFOJ,      
  L.CAEM2      
FROM USER_BANCU.KAT_CAEM2 L

      -- LEFT join CIS2.vw_cl_cuatm C on C.coduL = l.CUATM
        LEFT join CIS2.vw_cl_caem2 C on C.coduL = l.CAEM2
        
        WHERE 
        c.CODUL IS not  null