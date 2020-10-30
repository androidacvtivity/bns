


    SELECT 
    
    DISTINCT D.CUIIO,
             R.DENUMIRE,
             D.CUATM,
             D.CFP,
             D.CAEM2,
             D.CFOJ
              
    
    

    FROM CIS.VW_DATA_ALL D INNER JOIN CIS.RENIM R ON R.CUIIO = D.CUIIO AND R.CUIIO_VERS = D.CUIIO_VERS   
    
    WHERE 
    D.FORM  in (1)
    AND D.PERIOADA = 1041
    AND D.CAPITOL = 2 
    AND 
    
    (D.RIND IN ('0200') AND D.RIND NOT IN ('0100') )
    