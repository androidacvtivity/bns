
    SELECT 
    
    
                      DISTINCT  L.CUIIO,
                      L.DENUMIRE,
                      L.CUATM,
                      L.CAEM2,
                      L.PACHET,
                      L.COL1,
                      L.COL2,
                      R.COL3,
                      R.COL4
    
    
        FROM 


    (

             SELECT 
                      DISTINCT
                      D.CUIIO,
                      R.DENUMIRE,
                      R.CUATM,
                      R.CAEM2,
                      MAX(D.PACHET) PACHET,
                      SUM(CASE WHEN D.PERIOADA IN (2007) AND D.CAPITOL IN (357) AND D.RIND IN ('100') THEN D.COL1 ELSE 0 END)   AS COL1,
                      SUM(CASE WHEN D.PERIOADA IN (2007) AND D.CAPITOL IN (357) AND D.RIND IN ('100') THEN D.COL2 ELSE 0 END)   AS COL2
                      

                      
                
                
                        FROM CIS2.VW_DATA_ALL  D 
                        
                                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS  
                        
                        
                        WHERE
                        
                        D.PERIOADA IN (2007)
                        
                        AND D.FORM IN (21)
                        
                       
                        
                        
                        GROUP BY 
                        
                       D.CUIIO,
                      R.DENUMIRE,
                      R.CUATM,
                      R.CAEM2
                    --  D.PACHET 
                      
                      
                      ORDER BY 
                      D.CUIIO
                      
                      
                      
                      ) L  LEFT JOIN (
                      
                      SELECT 
                
                      D.CUIIO,
                      R.DENUMIRE,
                      R.CUATM,
                      R.CAEM2,
                      MAX(D.PACHET) PACHET,
                      SUM(CASE WHEN D.PERIOADA IN (2006) AND D.CAPITOL IN (357) AND D.RIND IN ('100') THEN D.COL1 ELSE 0 END)   AS COL3,
                      SUM(CASE WHEN D.PERIOADA IN (2006) AND D.CAPITOL IN (357) AND D.RIND IN ('105') THEN D.COL1 ELSE 0 END)   AS COL4
                      

                      
                
                
                        FROM CIS2.VW_DATA_ALL  D 
                        
                                INNER JOIN CIS2.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS  
                        
                        
                        WHERE
                        
                        D.PERIOADA IN (2006)
                        
                        AND D.FORM IN (21)
                        
                       
                        
                        
                        GROUP BY 
                        
                       D.CUIIO,
                      R.DENUMIRE,
                      R.CUATM,
                      R.CAEM2
                    --  D.PACHET 
                      
                      ) R ON R.CUIIO = L.CUIIO 
                        



        
    
    
                    ORDER BY 
                    L.CUIIO