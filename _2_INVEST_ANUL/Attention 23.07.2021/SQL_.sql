

SELECT 

  D.PERIOADA,
  D.FORM,
  D.FORM_VERS,
  D.CUIIO,
  D.CUIIO_VERS,
  D.PACHET,
  D.ID_MD,
  R.RIND,
  D.DATA_REG,
  D.ID_USER,  
  D.COL1,    
  D.COL3,
  D.COL2,
  D.COL4,
  D.COL5,
  D.COL6,
  D.COL7,
  D.COL8,
  D.COL9,
  D.COL10,
  D.COL11 
FROM CIS2.DATA_ALL_LOG D


        INNER JOIN CIS2.MD_RIND R ON R.ID_MD = D.ID_MD  

WHERE 
D.PERIOADA = 2008
AND D.FORM = 8
AND D.ID_USER = 358
AND D.DATA_REG >= TO_DATE('07/14/2021 10:36:08', 'MM/DD/YYYY HH24:MI:SS')

ORDER BY 
DATA_REG DESC 
