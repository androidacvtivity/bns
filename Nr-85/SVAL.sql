--this statement  don't  work becose  exists Nulls in Conditions .

SELECT A.COL1 AS A_COL1,
       B.COL1 AS B_COL1,
       A.COL2 AS A_COL2,
       B.COL2 AS B_COL2
     FROM ( SELECT 
                NULL  COL1,
                2 COL2
                FROM  DUAL ) A INNER JOIN ( SELECT 
        NULL COL1,
        2 COL2
        FROM DUAL 
        ) B ON  A.COL1 = B.COL1  AND A.COL2  = B.COL2;
        
--Now  I  add function NVL  for exclude NULL from conditions. It work.
        
SELECT A.COL1 AS A_COL1,
       B.COL1 AS B_COL1,
       A.COL2 AS A_COL2,
       B.COL2 AS B_COL2
     FROM ( SELECT 
                NULL COL1,
                2 COL2
                FROM  DUAL ) A INNER JOIN ( SELECT 
        NULL COL1,
        2 COL2
        FROM DUAL 
        ) B ON  NVL(TO_CHAR(A.COL1),'0') = NVL(TO_CHAR(B.COL1),'0')  AND NVL(TO_CHAR(A.COL2),'0') = NVL(TO_CHAR(B.COL2),'0');
        
        
        
        ;
        
        
        
        
         
        
        