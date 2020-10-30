  INSERT INTO TABLE_OUT
(   
    PERIOADA,
    FORM,
    FORM_VERS,
    ID_MDTABLE,
    COD_CUATM,
    NR_SECTIE,
    NUME_SECTIE,
    NR_SECTIE1,
    NUME_SECTIE1,
    NR_SECTIE2,
    NUME_SECTIE2,
    NR_ROW,
    ORDINE,
    DECIMAL_POS,
    NUME_ROW,
    COL1

  ) 

SELECT 
    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
    '0'  AS NR_SECTIE,
    '0' AS NUME_SECTIE, 
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,    
        COL1||'~'||ROWNUM   NR_ROW,        
        ROWNUM   ORDINE,
        '0' DECIMAL_POS,
        DENUMIRE NUME_ROW ,
        COL2
     

FROM 
(
 
  


      SELECT 
       
       '0' ORDINE,
       'Numarul intreprinderilor (total):' DENUMIRE,
       
        (
        
        SELECT 
       COUNT ( F.CUIIO)  AS CNT

        
   
   
     FROM CIS2.FORM_CUIIO F
     
        INNER JOIN 
      (
      SELECT 
        CUIIO, 
        MAX(CUIIO_VERS) AS CUIIO_VERS 

         
      FROM CIS2.FORM_CUIIO FC
      
      WHERE  
      1=1 
      
      AND FC.FORM IN (:pFORM)
      
      AND FC.CUIIO_VERS <= :pPERIOADA
      
      GROUP BY 
      CUIIO 
      ) FF ON (FF.CUIIO = F.CUIIO AND F.CUIIO_VERS = FF.CUIIO_VERS)
      
      
      
      LEFT  JOIN CIS2.RENIM R ON (R.CUIIO  = F.CUIIO  
        
                                   AND  R.CUIIO_VERS   = F.CUIIO_VERS )
      LEFT JOIN CIS2.VW_CL_CUATM CT ON (R.CUATM = CT.CODUL)    
      
      WHERE 
      
      F.FORM IN (:pFORM)
      AND F.STATUT <> '3'
      AND CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%'  ) COL1,
      
      (SELECT 
       COUNT ( F.CUIIO)  AS CNT

        
   
   
     FROM CIS2.FORM_CUIIO F
     
        INNER JOIN 
      (
      SELECT 
        CUIIO, 
        MAX(CUIIO_VERS) AS CUIIO_VERS 

         
      FROM CIS2.FORM_CUIIO FC
      
      WHERE  
      1=1 
      
      AND FC.FORM IN (:pFORM)
      
      AND FC.CUIIO_VERS <= :pPERIOADA - 1
      
      GROUP BY 
      CUIIO 
      ) FF ON (FF.CUIIO = F.CUIIO AND F.CUIIO_VERS = FF.CUIIO_VERS)
      
      
      
      LEFT  JOIN CIS2.RENIM R ON (R.CUIIO  = F.CUIIO  
        
                                   AND  R.CUIIO_VERS   = F.CUIIO_VERS )
      LEFT JOIN CIS2.VW_CL_CUATM CT ON (R.CUATM = CT.CODUL)    
      
      WHERE 
      
      F.FORM IN (:pFORM)
      AND F.STATUT <> '3'
      AND CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%'  ) COL2
       
      FROM DUAL 
  
  
  UNION 
  
  
  
  
  
  
  
  SELECT 


        '1' ORDINE,
       'Numarul rapoartelor redactate:' DENUMIRE,
        COUNT(CASE   WHEN D.PERIOADA IN (:pPERIOADA) AND   D.CUIIO = D.CUIIO  THEN D.CUIIO  END)     AS COL1,
        COUNT(CASE   WHEN D.PERIOADA IN (:pPERIOADA-1) AND   D.CUIIO = D.CUIIO  THEN D.CUIIO  END)     AS COL2
        
        
FROM CIS2.VW_DATA_ALL D
  
  INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)  


 WHERE
  
  (D.PERIOADA IN (:pPERIOADA,:pPERIOADA-1)) AND
    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (1)
  
  UNION 
  
  
  SELECT 
    
    '2' ORDINE,
    'Numarul rapoartelor eronate:' DENUMIRE,
    COUNT(DISTINCT CASE WHEN PERIOADA IN (:pPERIOADA) THEN CUIIO END) AS COL1,
    COUNT(DISTINCT CASE WHEN PERIOADA IN (:pPERIOADA - 1) THEN CUIIO END) AS COL12
    
    
    FROM CIS2.CONTROL
    
    WHERE 
    
    
    
    
    FORM = 44
    
    AND REZULTAT <> 'OK'
    AND PERIOADA IN (:pPERIOADA,:pPERIOADA-1)
  
  UNION 
  
  
  SELECT
            3||'_'||RIND ORDINE,
            DENUMIRE,
            COL1, 
            COL2  

           FROM
            (
 

                SELECT 
                     
                
                           A.RIND,         
                           CASE WHEN A.RIND = '01' THEN '01 - '||A.DENUMIRE  
                                 WHEN A.RIND = '02' THEN '02 - '||A.DENUMIRE
                                 WHEN A.RIND = '03' THEN '03 - '||A.DENUMIRE
                                 WHEN A.RIND = '04' THEN '04 - '||A.DENUMIRE
                                 WHEN A.RIND = '05' THEN '05 - '||A.DENUMIRE
                                 WHEN A.RIND = '06' THEN '06 - '||A.DENUMIRE
                                 WHEN A.RIND = '07' THEN '07 - '||A.DENUMIRE  
                            
                            ELSE A.DENUMIRE  END DENUMIRE, 
                            B.COL1,
                            B.COL2     
                     
                     FROM    
                   (         
                     SELECT 
                            R.RIND,
                            R.RIND_VERS,
                            R.DENUMIRE     
                                 
                            FROM 
                            
                            (   
                            SELECT 
                            R.RIND          RIND,
                            R.RIND_VERS     RIND_VERS,
                            R.DENUMIRE      DENUMIRE
                               
                            FROM CIS2.MD_RIND R
                            
                            INNER JOIN (                  
                            SELECT 
                            R.RIND,
                            MAX(R.RIND_VERS) AS RIND_VERS
                            
                            FROM CIS2.MD_RIND R 
                            
                            WHERE 
                            R.RIND_VERS <=:pPERIOADA
                            AND  (R.FORM =:pFORM) AND 
                            (R.FORM_VERS =:pFORM_VERS) AND
                            (:pID_MDTABLE=:pID_MDTABLE) AND 
                             R.FORM = 44  AND 
                             R.CAPITOL IN (1) AND 
                             R.RIND NOT IN  ('CD','-','CM')   
                            
                            GROUP BY 
                            R.RIND
                              
                            
                             ) RR   ON (    RR.RIND      = R.RIND
                                       AND  RR.RIND_VERS = R.RIND_VERS)
                                       
                                       
                            WHERE
                            
                           (R.FORM =:pFORM) AND 
                           (R.FORM_VERS =:pFORM_VERS) AND
                           (:pID_MDTABLE=:pID_MDTABLE) AND 
                           R.FORM = 44  AND 
                           R.CAPITOL IN (1) AND 
                           R.RIND NOT IN  ('CD','-','CM')                     
                           
                           
                           GROUP BY
                           R.RIND,
                           R.RIND_VERS,
                           R.DENUMIRE  ) R
                           
                           ORDER BY 
                           
                           R.RIND
                           
                           ) A  LEFT JOIN 
                           
                           
                           (
                           SELECT 


        MR.RIND,
        MR.RIND_VERS,
        MR.DENUMIRE DENUMIRE,
       SUM( CASE   WHEN D.PERIOADA IN (:pPERIOADA) AND   D.CUIIO = D.CUIIO AND D.COL1 = 1 THEN 1 ELSE NULL END)     AS COL1,
         
        SUM( CASE   WHEN D.PERIOADA IN (:pPERIOADA-1) AND   D.CUIIO = D.CUIIO AND D.COL1 = 1 THEN 1 ELSE NULL END)   AS COL2
        
FROM CIS2.VW_DATA_ALL D
  
  INNER JOIN CIS2.MD_RIND MR ON (MR.ID_MD = D.ID_MD)  


 WHERE
  
 (D.PERIOADA IN (:pPERIOADA,:pPERIOADA-1)) AND
    
  (D.FORM =:pFORM) AND
  (D.FORM_VERS =:pFORM_VERS) AND 
  (:pID_MDTABLE =:pID_MDTABLE) AND
  (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND
  D.FORM IN (44)
  AND
  D.CAPITOL IN (1)
  
  
  
  
  GROUP  BY 
   MR.RIND,
   MR.RIND_VERS,
   MR.DENUMIRE
                           
                           ) B ON  
                           
                           ( 
                           A.RIND  = B.RIND
                           AND A.RIND_VERS   = B.RIND_VERS )
                           
                           
                           
                           
                           ORDER BY 
                           
                           A.RIND
                           
                           )
                           
                           
                           
                           )
                           
                           ORDER BY 
                           ORDINE