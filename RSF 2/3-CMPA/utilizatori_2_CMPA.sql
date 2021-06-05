SELECT 
  DISTINCT L.ID_USER,
  R.FORM,
  F.DEN_SHORT,
  L.USER_NAME,
  L.PASSWORD,
  L.STATUS,
  L.ISADMIN,
  L.NAME,
  L.SURNAME,
  L.PHONE,
  L.DATA_REG,
  L.ADDRES,
  C.DENUMIRE,
  L.PASS_CHANGE,
  L.E_MAIL
         
    FROM CIS2.SYS_USER L
    
                INNER JOIN CIS2.SYS_USER_ACCES R ON  R.ID_USER = L.ID_USER 
                INNER JOIN CIS2.MD_FORM F  ON F.FORM = R.FORM 
                INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL =  R.CUATM
                
    
                    WHERE 
                    
                    R.FORM IN (58,61,62) 
                    --AND R.CUATM LIKE '96%'
                    AND C.FULL_CODE  LIKE '%'||'3333333'||';%'  
                    