SELECT 
           DISTINCT  D.UNIT_CODE,
           D.NR_GOSP,
           RN.NR_MAPS,
           RN.NAME,
           D.CUATM,
           RN.ADDRESS_1 ADDRESS, 
           MC.DEN_SHORT DEN_CAPITOL,
           MR.RIND,
           
           MC.CAPITOL,
           C.FULL_CODE,
           SUM(D.COL1) AS COL1,
           SUM(D.COL2) AS COL2,
           SUM(D.COL3) AS COL3,
           SUM(D.COL4) AS COL4,
           SUM(D.COL5) AS COL5
            

           FROM  CIS2.VW_DATA_ALL_GC D  LEFT JOIN REG_UNIT_GC RN
               ON     D.UNIT_CODE = RN.UNIT_CODE
                  AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                  AND D.NR_GOSP = RN.NR_GOSP
                  AND D.NR_MAPS = RN.NR_MAPS
                  
                  INNER JOIN VW_CL_CUATM C ON C.CODUL = D.CUATM
                  INNER JOIN CIS2.MD_CAPITOL MC ON MC.CAPITOL = D.CAPITOL AND  MC.CAPITOL_VERS = D.CAPITOL_VERS
                  INNER JOIN MD_RIND MR ON MR.ID_MD = D.ID_MD
                                
           
           
                WHERE
                 
                D.FORM = 72
                AND D.PERIOADA  = 2010 
               AND MC.CAPITOL  IN (1190,1191,1192,1193,1194)
             --   AND MC.CAPITOL  IN (1189)
              --  AND D.UNIT_CODE = 1414
                GROUP BY
                D.UNIT_CODE,
           D.NR_GOSP,
           RN.NR_MAPS,
           RN.NAME,
           D.CUATM,
           RN.ADDRESS_1, 
           MC.DEN_SHORT,
           
           MC.CAPITOL,
           MR.RIND,
           C.FULL_CODE
                
             UNION 
             
             SELECT 
           DISTINCT  D.UNIT_CODE,
           D.NR_GOSP,
           RN.NR_MAPS,
           RN.NAME,
           D.CUATM,
           RN.ADDRESS_1 ADDRESS, 
           MC.DEN_SHORT DEN_CAPITOL,
           MR.RIND,
           
           MC.CAPITOL,
           C.FULL_CODE,
           SUM(D.COL1) AS COL1,
           NULL AS COL2,
           NULL AS COL3,
           NULL AS COL4,
           NULL AS COL5
            

           FROM  CIS2.VW_DATA_ALL_GC D  LEFT JOIN REG_UNIT_GC RN
               ON     D.UNIT_CODE = RN.UNIT_CODE
                  AND D.UNIT_CODE_VERS = RN.UNIT_CODE_VERS
                  AND D.NR_GOSP = RN.NR_GOSP
                  AND D.NR_MAPS = RN.NR_MAPS
                  
                  INNER JOIN VW_CL_CUATM C ON C.CODUL = D.CUATM
                  INNER JOIN CIS2.MD_CAPITOL MC ON MC.CAPITOL = D.CAPITOL AND  MC.CAPITOL_VERS = D.CAPITOL_VERS
                  INNER JOIN MD_RIND MR ON MR.ID_MD = D.ID_MD
                                
           
           
                WHERE
                 
                D.FORM = 72
                AND D.PERIOADA  = 2010 
               -- AND MC.CAPITOL  IN (1190,1191,1192,1193,1194)
                AND MC.CAPITOL  IN (1189)
              --  AND D.UNIT_CODE = 1414
                GROUP BY
                D.UNIT_CODE,
           D.NR_GOSP,
           RN.NR_MAPS,
           RN.NAME,
           D.CUATM,
           RN.ADDRESS_1, 
           MC.DEN_SHORT,
           
           MC.CAPITOL,
           MR.RIND,
           C.FULL_CODE
           
           
           
           
           HAVING 
           SUM(D.COL1)  IS NOT NULL 
           
                ORDER BY 
                FULL_CODE,
                NR_GOSP,
                CAPITOL,
                RIND