INSERT INTO CIS2.SYS_USER_ACCES
  (
  ID_USER,
  CUATM,
  FORM,
  FORM_VERS,
  ISADMIN,
  ACCES_TYPE,
  CAPITOL_ACCES,
  DATA_REG      
  )

        SELECT 
            ID_USER,
            ADDRES CUATM,
            53 FORM,
            2000 FORM_VERS,
            '0'  ISADMIN, 
             1    ACCES_TYPE,
             NULL CAPITOL_ACCES,
             SYSDATE DATA_REG 
        
        FROM CIS2.SYS_USER
        
        
        WHERE 
        
        USER_NAME IN (
        'vasiliev',
'cazimir',
'perevedniuc',
'ivanova',
'gutud',
'acris',
'siscov sofia',
'beschieru',
'lidia',
'bazatin',
'rotarut',
'crismarualiona',
'zaporojanv',
'sandul',
'greciun',
'borodulina',
'gustoi',
'galerelena',
'turturica',
'iurtuc',
'cretuo',
'crudu',
'chistruga',
'santoni',
'pirtua',
'agache',
'crigan', 
'zabrian',
'cebanrodion',
'smigon',
'ciobanun',
'iurovscaia',
'esanuoleg',
'ceaglei',
'matcina',
'martiniuc',
'ivanoglo'
)


ORDER BY 
USER_NAME
