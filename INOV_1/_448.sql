SELECT
  CTM.NR_ROW, 
  CTM.CS_CAEM2   AS CODUL,
  CTM.NUME_ROW AS NUME_ROW, 
  SUM(CASE WHEN C.FULL_CODE LIKE '%'||CTM.CS_CAEM2||'%' THEN D.COL1  ELSE NULL END) AS COL1


  
   
FROM
(

SELECT
  D.CUIIO,
  D.CAEM2,
   CIS2.NVAL(MAX(CASE WHEN D.CAPITOL||'.'||D.RIND IN ('1041.2.1.1','1041.2.1.2', '1042.3.1.1','1042.3.1.2','1042.3.1.3','1046.7.1.1','1046.7.1.2','1046.7.1.3','1047.8.1.1','1047.8.1.2','1047.8.1.3','1047.8.1.4') AND D.COL1=1 
  THEN D.COL1 ELSE NULL END)) AS COL1
  
  FROM 
  CIS2.VW_DATA_ALL D  
  
  
WHERE
  D.PERIOADA IN (:pPERIOADA) AND 
  D.FORM_VERS = :pFORM_VERS     AND   
  D.FORM = :pFORM     AND    
  (:pID_MDTABLE=:pID_MDTABLE) AND
  D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%'  AND 
  D.FORM IN (48)  

  
GROUP BY  
D.CUIIO,
D.CAEM2
) D 

INNER JOIN CIS2.VW_CL_CAEM2 C ON C.CODUL = D.CAEM2
--INNER JOIN CIS2.VW_CL_CAEM2 CC ON C.FULL_CODE LIKE '%'||CC.CODUL||'%'

CROSS JOIN (

SELECT
      DECODE(CS.CODUL, 
      '00000','01',
      'B0000','02',
      'B0500','03',
      'B0600','04',
      'B0700','05',
      'B0800','06',
      'B0900','07',
      'C0000','08',
      'C1000','09',
      'C1100','10',
      'C1200','11',
      'C1300','12',
      'C1400','13',
      'C1500','14',
      'C1600','15',
      'C1700','16',
      'C1800','17',
      'C1900','18',
      'C2000','19',
      'C2100','20',
      'C2200','21',
      'C2300','22',
      'C2400','23',
      'C2500','24', 
      'C2600','25',
      'C2700','26',
      'C2800','27',
      'C2900','28',
      'C3000','29',
      'C3100','30',
      'C3200','31',
      'C3300','32',
      'D0000','33',
      'D3500','34',
      'E0000','35',
      'E3600','36',
      'E3700','37',
      'E3800','38',
      'E3900','39',
      'G4600','40',
      'H0000','41',                          
      'H4900','42',
      'H5000','43',
      'H5100','44',
      'H5200','45',
      'H5300','46',
      'J0000','47',
      'J5800','48',
      'J5900','49',
      'J6000','50',
      'J6100','51',
      'J6200','52',
      'J6300','53',
      'K0000','54',
      'K6400','55',
      'K6500','56',
      'K6600','57',
      'M0000','58',
      'M7100','59',
      'M7200','60',
      'M7300','61'
                                 
      )
      AS NR_ROW,
      CS.DENUMIRE AS NUME_ROW,
      CS.CODUL AS CS_CAEM2
    FROM
      CIS2.VW_CL_CAEM2 CS
    WHERE
      CS.CODUL 
      IN(
         '00000', 'B0000','B0500','B0600','B0700','B0800','B0900', 'C0000','C1000','C1100'
         ,'C1200' ,'C1300','C1400','C1500','C1600','C1700','C1800','C1900','C2000','C2100',
         'C2200','C2300','C2400','C2500','C2600','C2700','C2800','C2900','C3000'
         ,'C3100','C3200','C3300','D0000','D3500','E0000','E3600','E3700','E3800','E3900',
          'G4600','H0000','H4900','H5000','H5100','H5200','H5300','J0000','J5800','J5900',
          'J6000','J6100','J6200','J6300','K0000','K6400','K6500','K6600','M0000','M7100'
          ,'M7200','M7300'
        )
        
        
) CTM


GROUP BY  
  CTM.NR_ROW,
  CTM.CS_CAEM2,
  CTM.NUME_ROW
  
  ORDER BY 
  CTM.NR_ROW
