UPDATE CIS2.MD_CONTROL 


SET SQL_TEXT = 

REPLACE(REPLACE(REPLACE(SQL_TEXT,'D.FORM_VERS=:FORM_VERS       OR','D.FORM_VERS=:FORM_VERS'),
'D.FORM_VERS=:FORM_VERS  D.FORM_VERS <>  :FORM_VERS','D.FORM_VERS=:FORM_VERS OR  D.FORM_VERS <>  :FORM_VERS')
,'D.FORM_VERS=:FORM_VERS :FORM_VERS = -1','D.FORM_VERS=:FORM_VERS  OR :FORM_VERS = -1' ) 


--SELECT 
--CONTROL,
--REPLACE(REPLACE(REPLACE(SQL_TEXT,'OR :PERIOADA = -1',' '),'OR :CUIIO = -1',' '),'OR :FORM = -1','') AS SQL,
--
--REPLACE(SQL_TEXT,'D.FORM_VERS=:FORM_VERS       OR','D.FORM_VERS=:FORM_VERS ')  AS COL2
-- FROM CIS2.MD_CONTROL
---- 
--SELECT *
--FROM USER_EREPORTING.MD_CONTROL

WHERE 
(SQL_TEXT LIKE '%D.FORM_VERS=:FORM_VERS       OR%'    
OR 
SQL_TEXT LIKE '%D.FORM_VERS=:FORM_VERS  D.FORM_VERS <>  :FORM_VERS%'

OR 
SQL_TEXT LIKE '%D.FORM_VERS=:FORM_VERS :FORM_VERS = -1%'

)

AND FORM = 57
AND CONTROL_VERS <>  2010


AND CONTROL IN ('57-001')