SELECT 
       D.CUIIO,
       MAX(R.DENUMIRE) DENUMIRE ,
       C.FULL_CODE,
       SUM(CASE WHEN D.PERIOADA IN (2008) AND D.CAPITOL = 103 AND D.RIND IN ('290')  THEN  D.COL1 ELSE NULL END ) AS COL1,
       SUM(CASE WHEN D.PERIOADA IN (2009) AND D.CAPITOL = 103 AND D.RIND IN ('290')  THEN  D.COL1 ELSE NULL END ) AS COL2,
       SUM(CASE WHEN D.PERIOADA IN (2010) AND D.RIND IN ('290') AND D.CAPITOL = 103   THEN  D.COL1 ELSE NULL END ) AS COL3,
       
       SUM(CASE WHEN D.PERIOADA IN (2008) AND D.CAPITOL = 104 AND D.RIND IN ('310')  THEN  D.COL4 ELSE NULL END ) AS COL4,
       SUM(CASE WHEN D.PERIOADA IN (2009) AND D.CAPITOL = 104 AND D.RIND IN ('310')  THEN  D.COL4 ELSE NULL END ) AS COL5,
       SUM(CASE WHEN D.PERIOADA IN (2010) AND D.RIND IN ('310') AND D.CAPITOL = 104   THEN  D.COL4 ELSE NULL END ) AS COL6
        
        
        
            FROM CIS2.VW_DATA_ALL D 
            INNER JOIN RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS  
            INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = D.CUATM
            
            WHERE 

            D.FORM IN (1) 
         --   AND D.cuiio = 20388147
        
           AND D.PERIOADA IN (2008,2009,2010)

        
        
        
        GROUP BY 
        
        D.CUIIO,
      --  R.DENUMIRE,
        C.FULL_CODE
        
        ORDER BY 
         C.FULL_CODE
         
        
      