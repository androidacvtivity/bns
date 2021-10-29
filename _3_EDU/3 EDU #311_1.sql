        SELECT 
        D.ANUL,
        D.CUIIO,
        D.RIND,
        SUM(D.COL1) AS COL1,
  SUM(D.COL2) AS COL2,
  SUM(D.COL3) AS COL3,
  SUM(D.COL4) AS COL4,
  SUM(D.COL5) AS COL5,
  SUM(D.COL6) AS COL6,
  SUM(D.COL7) AS COL7,
  SUM(D.COL8) AS COL8,
  SUM(D.COL9) AS COL9,
  SUM(D.COL10) AS COL10,
  SUM(D.COL11) AS COL11,
  SUM(D.COL12) AS COL12, 
  SUM(D.COL13) AS COL13,
  SUM(D.COL14) AS COL14,
  SUM(D.COL15) AS COL15,
  SUM(D.COL16) AS COL16,
  SUM(D.COL17) AS COL17
                
           
           FROM CIS2.VW_DATA_ALL D
           
           WHERE 
           D.FORM = 50
           
           AND D.PERIOADA IN (2006,2007,2008,2009,2010) 
           AND D.CAPITOL = 1058
           
                
           GROUP BY
           
        D.ANUL,
        D.CUIIO,
        D.RIND              
        
        
        HAVING 
        
        D.RIND LIKE '%101220%'
        OR 
        D.RIND LIKE '%104110%' 
        
        ORDER BY
        D.ANUL,
        D.CUIIO,
        D.RIND              
             