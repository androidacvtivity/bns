--INSERT into cis2.RENIM (
--
--  CUIIO,
--  CUIIO_VERS, 
--  DENUMIRE,
--  EDIT_USER,
--  STATUT,          
--  CUATM,
--  CFP,        
--  CFOJ,      
--  CAEM2,
--  BUGET,
--  TIP 
--)


SELECT 
  L.CUIIO,
  L.CUIIO_VERS, 
  L.DENUMIRE,
  1  EDIT_USER,
  '1' STATUT,          
  L.CUATM,
  L.CFP,        
  L.CFOJ,      
  L.CAEM2,
  '0'  BUGET,
  '0'   TIP             
FROM USER_BANCU.KAT_CAEM2 L 
LEFT  JOIN cis2.RENIM r ON r.CUIIO = l.CUIIO and R.cuiio_vers = L.cuiio_vers

where 

R.cuiio IS  null;