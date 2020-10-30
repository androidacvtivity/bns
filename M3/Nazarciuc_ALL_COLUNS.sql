SELECT 
    
    D.CUIIO,
    D.ANUL,
    D.FILIAL,
    D.RIND,
    D.CAPITOL,
    D.CAPITOL_DEN,
    SUM(D.COL1) AS COL1,
    SUM(D.COL2) AS COL2,
    SUM(D.COL3) AS COL3,
    SUM(D.COL4) AS COL4,
    SUM(D.COL5) AS COL5,
    SUM(D.COL6) AS COL6,
    SUM(D.COL7) AS COL7,
    SUM(D.COL8) AS COL8,
    SUM(D.COL9) AS COL9,
    SUM(D.COL10) AS COL10
    
    FROM CIS2.VW_DATA_ALL D
    
                        --    INNER JOIN CIS2.MD_CAPITOL MD ON D.CAPITOL = MD.CAPITOL AND D.CAPITOL_VERS = MD.CAPITOL_VERS       
    
    
    WHERE


           D.CUIIO IN (
37702352
)

    AND D.PERIOADA IN (2006)
    
    AND D.FORM IN (3)
    
    
    
    GROUP BY 
    
     D.CUIIO,
    D.ANUL,
    D.FILIAL,
    D.RIND,
    D.CAPITOL,
    D.CAPITOL_DEN
    
    ORDER BY
    
    D.CAPITOL,
    D.RIND;