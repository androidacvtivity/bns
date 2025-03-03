

    

    SELECT 
  --  D.PERIOADA,
    D.CUIIO,
    R.CUATM,
    C.DENUMIRE DEN_CUATM,
    R.DENUMIRE DEN_CUIIO,
    D.CAPITOL,
    MR.DENUMIRE,
    MR.RIND,
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL1  ELSE NULL END) AS COL1_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL1  ELSE NULL END) AS COL1_2022,
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL2  ELSE NULL END) AS COL2_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL2  ELSE NULL END) AS COL2_2022,
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL3  ELSE NULL END) AS COL3_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL3  ELSE NULL END) AS COL3_2022,
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL4  ELSE NULL END) AS COL4_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL4  ELSE NULL END) AS COL4_2022,
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL5  ELSE NULL END) AS COL5_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL5  ELSE NULL END) AS COL5_2022,
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL6  ELSE NULL END) AS COL6_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL6  ELSE NULL END) AS COL6_2022,
    -----------------------------------------------------------------------------
    
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL7  ELSE NULL END) AS COL7_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL7  ELSE NULL END) AS COL7_2022,
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL8  ELSE NULL END) AS COL8_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL8  ELSE NULL END) AS COL8_2022,
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL9  ELSE NULL END) AS COL9_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL9  ELSE NULL END) AS COL9_2022,
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL10  ELSE NULL END) AS COL10_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL10  ELSE NULL END) AS COL10_2022,
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL11  ELSE NULL END) AS COL11_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL11 ELSE NULL END) AS COL11_2022,
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL12  ELSE NULL END) AS COL12_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL12  ELSE NULL END) AS COL12_2022,
    SUM(CASE WHEN D.PERIOADA IN(313) THEN D.COL13  ELSE NULL END) AS COL13_2023,
    SUM(CASE WHEN D.PERIOADA IN(312) THEN D.COL13  ELSE NULL END) AS COL13_2022
    
    
    
     
       FROM M53.VW_DATA_ALL D
       
         INNER JOIN M53.RENIM R ON (R.CUIIO        = D.CUIIO AND 
                                   R.CUIIO_VERS      = D.CUIIO_VERS)
                                   INNER JOIN M53.VW_CL_CUATM C ON (C.CODUL = R.CUATM)    
                                   INNER JOIN M53.MD_RIND MR ON MR.ID_MD = D.ID_MD     
       
       WHERE 
       D.PERIOADA IN(312,313)
       AND D.FORM IN (40)
   --    AND D.CUIIO IN (2166934)
       
       GROUP BY 
     --  D.PERIOADA,
       D.CUIIO,
       R.CUATM,
       C.DENUMIRE,
       C.FULL_CODE,
       R.DENUMIRE,
       D.CAPITOL,
       MR.DENUMIRE,
       MR.RIND
       
       
       ORDER BY 
       C.FULL_CODE
       
       
       ;