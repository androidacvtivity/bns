select * 

from CIS2.RENIM 

where

(regexp_like(DENUMIRE,'(^[:space:]|[:space:]$)')
OR 
regexp_like(IDNO,'(^[:space:]|[:space:]$)')) 

AND 
CUIIO_VERS = 2009

AND CUATM LIKE '89%'