SELECT 
  R.FORM,
  L.ID_USER,  
  L.USER_NAME,
  L.PASSWORD,
  L.STATUS,
  L.ISADMIN,
  L.NAME,
  L.SURNAME,
  L.PHONE,
  L.DATA_REG,
  L.ADDRES   
        
        FROM CIS2.SYS_USER L
                
                    RIGHT JOIN CIS2.SYS_USER_ACCES R ON  L.ID_USER =  R.ID_USER    
        
                WHERE 
                
                L.USER_NAME LIKE 'bosii%'