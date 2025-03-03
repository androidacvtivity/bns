﻿SELECT


    :pPERIOADA AS PERIOADA,
    :pFORM AS FORM,
    :pFORM_VERS AS FORM_VERS,
    :pID_MDTABLE AS ID_MDTABLE,
    :pCOD_CUATM AS COD_CUATM,
    '0' AS NR_SECTIE,
    '0' AS NUME_SECTIE,
    '0' AS NR_SECTIE1,
    '0' AS NUME_SECTIE1,
    '0' AS NR_SECTIE2,
    '0' AS NUME_SECTIE2,
            
                
     ROUND(SUM(CASE WHEN 1=1 AND MR.RIND IN ('031') AND CT.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL1  ELSE NULL END),0) ||'~'||SUM(ROWNUM) AS NR_ROW, 
      R.NR_ROW ORDINE,
    '02' AS DECIMAL_POS,
     R.NUME_ROW NUME_ROW,
     ROUND(SUM(CASE WHEN 1=1 AND MR.RIND IN ('031') AND CT.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL2  ELSE NULL END),0)  AS COL1,
     
     ROUND(SUM(CASE WHEN 1=1 AND MR.RIND IN ('031') AND CT.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL2  ELSE NULL END) / 
     SUM(CASE WHEN 1=1 AND MR.RIND IN ('031') AND CT.FULL_CODE LIKE '%'||R.CS_CUATM||'%'  THEN D.COL1  ELSE NULL END),2) AS COL2
     
       
                     
             
     
     
           
            
   
            
                



                 FROM DATA_ALL_GC D 
                 
                 
                 
                 
                        INNER JOIN CIS2.MD_RIND MR  ON (MR.ID_MD =  D.ID_MD)
                        
                
                        
          
               INNER JOIN REG_UNIT_GC RN
                ON     D.UNIT_CODE = RN.UNIT_CODE
                AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                AND D.NR_GOSP = RN.NR_GOSP
                AND D.NR_MAPS = RN.NR_MAPS
                
                INNER  JOIN VW_CL_CUATM CT ON RN.CUATM = CT.CODUL 
                
                
                ---------------------------------------------
                CROSS JOIN 
  (
    SELECT
      DECODE(CS.CODUL, 
      '0000000','01',
      '0100000','02','1111111','03','0300000','04',
      '1400000','05','3400000','06','3600000','07','4100000','08','4300000','09',
      '4500000','10','4800000','11','6200000','12','7100000','13','7400000','14',
      '7800000','15','2222222','16','1000000','17','2500000','18','3100000','19',
      '3800000','20','5300000','21','5500000','22','6000000','23','6400000','24',
      '6700000','25','8000000','26','8300000','27','8900000','28','9200000','29',
      '3333333','30','1200000','31','1700000','32','2100000','33','2700000','34',
      '2900000','35','5700000','36','8500000','37','8700000','38','9600000','39'
      )
      AS NR_ROW,
      CS.DENUMIRE AS NUME_ROW,
      CS.CODUL AS CS_CUATM
    FROM
      CIS2.VW_CL_CUATM CS
    WHERE
      CS.CODUL 
      IN(
         '0000000',
         '0100000','1111111','0300000','1400000','3400000','3600000','4100000','4300000','4500000',
         '4800000','6200000','7100000','7400000','7800000','2222222','1000000','2500000','3100000','3800000',
         '5300000','5500000','6000000','6400000','6700000','8000000','8300000','8900000','9200000','3333333',
         '1200000','1700000','2100000','2700000','2900000','5700000','8500000','8700000','9600000')
  ) R 
                
                ---------------------------------------
                  
              --  INNER JOIN CIS2.VW_CL_CUATM CC ON (CT.FULL_CODE LIKE '%'||CC.CODUL||';%')     
                      
                ----------------------
                
                
                
                        WHERE 
                        
                   --(D.PERIOADA IN (:pPERIOADA , :pPERIOADA - 1 )) AND
                    (D.PERIOADA BETWEEN FLOOR(:pPERIOADA/4)*4 AND :pPERIOADA)  AND   
                     
                   (D.FORM =:pFORM) AND
                   (D.FORM_VERS =:pFORM_VERS) AND 
                   (:pID_MDTABLE =:pID_MDTABLE) AND
                   (CT.FULL_CODE LIKE '%'||:pCOD_CUATM||';%') AND
                   D.FORM IN (58)  AND
                   MR.CAPITOL IN (417)
                    
                   
                     GROUP BY
  R.NR_ROW,
  R.NUME_ROW
  