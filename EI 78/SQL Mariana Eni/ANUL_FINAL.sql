SELECT 
     D.CUIIO,
     MAX(RN.DENUMIRE) DENUMIRE,
     MP.ANUL,
     CASE 
     WHEN D.PERIOADA = 2007 THEN 'ANUL 2018'  
    
     END  AS PERIOADA,
     RN.CUATM,
     RN.CAEM2,
     RN.CFP,
     D.COL1  AS COD_SERVICII, 
     'export' AS categoria,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   +
     SUM(CASE WHEN  MC.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL1,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (409)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (410)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)) / CR.COL1 )/1000,1) AS COL2
     

     
     
     FROM DATA_ALL D
          INNER JOIN RENIM RN
             ON D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS
          INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
          INNER  JOIN MD_CAPITOL MC
             ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
         INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
         INNER JOIN MD_PERIOADA MP ON MP.PERIOADA = D.PERIOADA 
    
        -------------------------------------------------------------------------------
         CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =2007) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') ) CR
        ------------------------------------------------------------------------------       
   WHERE 
  (D.PERIOADA IN (2007)) AND 
 
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND MC.CAPITOL IN (409,410)
  AND D.COL1 IN (851,853,852)
  
 

 GROUP BY
      D.CUIIO, 
      MP.ANUL,
      D.PERIOADA,
      RN.CUATM,
      RN.CAEM2,
      RN.CFP,
      D.COL1,
      CR.COL1
      
      
      UNION 
      
      
      SELECT 
     D.CUIIO,
     MAX(RN.DENUMIRE) DENUMIRE,
     MP.ANUL,
     CASE 
     WHEN D.PERIOADA = 2007 THEN 'ANUL 2018'  
    
     END  AS PERIOADA,
     RN.CUATM,
     RN.CAEM2,
     RN.CFP,
     D.COL1  AS COD_SERVICII, 
     'import' AS categoria,
     ROUND((SUM(CASE WHEN  MC.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)   +
     SUM(CASE WHEN  MC.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END ))/1000,1) AS COL1,
     ROUND(((SUM(CASE WHEN  MC.CAPITOL IN (411)  AND MR.RIND NOT IN ('1','2','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END) +
     SUM(CASE WHEN  MC.CAPITOL IN (403)  AND MR.RIND NOT IN ('1','-')  THEN CIS2.NVAL(D.COL4) ELSE 0 END)) / CR.COL1 )/1000,1) AS COL2
     

     
     
     FROM DATA_ALL D
          INNER JOIN RENIM RN
             ON D.CUIIO = RN.CUIIO AND D.CUIIO_VERS = RN.CUIIO_VERS
          INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL
          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
          INNER  JOIN MD_CAPITOL MC
             ON MR.CAPITOL = MC.CAPITOL AND MR.CAPITOL_VERS = MC.CAPITOL_VERS
         INNER JOIN CIS2.VW_CL_SERVICII SS ON (rtrim(SS.CODUL, '0')=D.COL1 )
         INNER JOIN MD_PERIOADA MP ON MP.PERIOADA = D.PERIOADA 
    
        -------------------------------------------------------------------------------
         CROSS JOIN (
         SELECT
            SUM(D.COL1) AS COL1            
                  FROM DATA_ALL D
                          INNER  JOIN MD_RIND MR ON D.ID_MD = MR.ID_MD
                      
                        WHERE
                             (D.PERIOADA =2007) AND               
                              D.FORM IN (100)
                              AND D.CUIIO IN (5)
                              AND MR.CAPITOL IN (10003)
                              AND MR.RIND IN ('01') ) CR
        ------------------------------------------------------------------------------       
   WHERE 
  (D.PERIOADA IN (2007)) AND 
 
  (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (46)
  AND MC.CAPITOL IN (411,403)
  AND D.COL1 IN (851,853,852)
  
 

 GROUP BY
      D.CUIIO, 
      MP.ANUL,
      D.PERIOADA,
      RN.CUATM,
      RN.CAEM2,
      RN.CFP,
      D.COL1,
      CR.COL1
      
       ORDER BY 
   
    CUIIO,
    categoria,
    PERIOADA