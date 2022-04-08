SELECT R.*

FROM USER_BANCU.VW_KATALOG_85_EDU_2021 R

WHERE 
1=1
--           R.N85_NTL IS NULL
--           OR 
--           
            AND R.N85_NTIIP <> '6' 
--           OR 

AND R.N85_NDIIP ='1'
--           OR  R.N85_NPDS IS NULL
--           OR  R.N85_NRIIP IS NULL
--           OR  R.N85_NSIIP IS NULL