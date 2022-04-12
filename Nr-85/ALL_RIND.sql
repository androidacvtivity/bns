       
       SELECT 
       DISTINCT 
       D.ANUL,
       D.CUIIO,
       D.CUATM,
       MD.DEN_SHORT,
       D.RIND,
       RN.N85_NTIIP,
       RN.N85_NDIIP,
        RN.N85_NPDS, 
         RN.N85_NRIIP,
         RN.N85_NSIIP,
         
         
       SUM(D.COL1) AS COL1,
       SUM(D.COL2) AS COL2,
       SUM(D.COL3) AS COL3,
       SUM(D.COL4) AS COL4 
       FROM    
             CIS2.VW_DATA_ALL D    
                      
               INNER JOIN CIS2.RENIM RN ON (RN.CUIIO=D.CUIIO AND RN.CUIIO_VERS=D.CUIIO_VERS)  
               INNER JOIN CIS2.MD_CAPITOL MD ON MD.CAPITOL = D.CAPITOL AND MD.CAPITOL_VERS = D.CAPITOL_VERS 
               
               ----------------------------------------------------------------------------------------------------                          
               INNER JOIN CIS2.CL_N85_NTIIP NT ON (RN.N85_NTIIP=NT.CODUL) --(NIÎP).(Col.6) <> 6 --- NT.CODUL <> 6  
               ----------------------------------------------------------------------------------------------------
               INNER JOIN CIS2.CL_N85_NDIIP ND ON (RN.N85_NDIIP=ND.CODUL) -- care (NIÎP).(Col.7) = 1 ---ND.CODUL = 1 
               
                   WHERE  
               (D.PERIOADA IN (2009,2010)) AND
               (D.FORM =:pFORM) AND
               (D.FORM_VERS =:pFORM_VERS) AND
               (:pID_MDTABLE=:pID_MDTABLE) AND
               (D.CUATM_FULL LIKE '%'||:pCOD_CUATM||';%') AND 
               D.FORM = 17
              
            
               
               GROUP BY 
                 D.ANUL,
          D.CUIIO,
          D.CUATM,
       MD.DEN_SHORT,
       D.RIND,
       RN.N85_NTIIP,
       RN.N85_NDIIP,
        RN.N85_NPDS, 
         RN.N85_NRIIP,
         RN.N85_NSIIP