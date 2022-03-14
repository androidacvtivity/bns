

SELECT R.*

FROM USER_BANCU.VW_KATALOG_85_EDU_2021 R
WHERE 
 R.N85_NTL IS NULL 
 OR 
 
           R.N85_NTIIP  IS NULL
           OR 
           R.N85_NDIIP IS NULL 
           OR 
           
           R.N85_NPDS IS NULL 
           OR 
           R.N85_NRIIP IS NULL 
           OR 
           
           R.N85_NSIIP IS NULL 