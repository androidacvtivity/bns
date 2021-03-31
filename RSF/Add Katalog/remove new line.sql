--Oracle SQL select command from a table that contains newline characters (liked \n, \r, \t) and replace it with a space ” “.


--update RENIM
----
----SET DENUMIRE = TRIM(translate(DENUMIRE, chr(10)||chr(11)||chr(13), '    '))
--
--SET IDNO = TRIM(translate(IDNO, chr(10)||chr(11)||chr(13), '    '))




select 
CUIIO,
CUIIO_VERS,
TRIM(translate(DENUMIRE, chr(10)||chr(11)||chr(13), '    ')) DENUMIRE,
denumire denumire_wrong,
TRIM(translate(IDNO, chr(10)||chr(11)||chr(13), '    ')) IDNO,
IDNO IDNO_wrong
from renim



where 

(

instr(DENUMIRE, chr(13)) > 0
OR 
instr(DENUMIRE, chr(10)) > 0
OR 
instr(DENUMIRE, chr(11)) > 0

)



OR 

(
instr(IDNO, chr(13)) > 0
OR 
instr(IDNO, chr(10)) > 0
OR 
instr(IDNO, chr(11)) > 0

)

--AND CUIIO_VERS < 2000

;
