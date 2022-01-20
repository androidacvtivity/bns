DECLARE -- ====================================================================

CURSOR C IS



SELECT 
  L.CUIIO,
  L.CUIIO_VERS, 
  L.DENUMIRE,
  L.CUATM,
  L.CFP,        
  L.CFOJ,      
  L.CAEM2      
FROM USER_BANCU.KAT_CAEM2 L

            INNER join CIS2.renim R on R.cuiio = L.cuiio 
                       AND r.CUIIO_VERS = l.CUIIO_VERS
                       
                       where 
                       R.cuiio IS not NULL
         
         
        



;

BEGIN -- ======================================================================
FOR CR IN C
LOOP
UPDATE cis2.RENIM SET
CUATM = CR.CUATM,
denumire = CR.denumire,
CFP = CR.CFP,
CFOJ = CR.cfoj,
CAEM2 = CR.CAEM2

WHERE
CUIIO = CR.CUIIO 
and 
CUIIO_VERS = CR.CUIIO_VERS 



;
END LOOP;
END; 