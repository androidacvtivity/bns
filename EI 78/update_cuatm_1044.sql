SELECT '0'||CUATM AS CUATM
        FROM USER_BANCU.EI_78_1044;
        
        
        UPDATE USER_BANCU.EI_78_1044
        
        SET CUATM = '0'||CUATM;
        
        
        SELECT
          L.CUIIO,
          L.CUIIO_VERS,
          L.CUATM   
        FROM USER_BANCU.EI_78_1044 L
        
                INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = L.CUATM;
         
        
        

 SELECT
          L.CUIIO,
          L.CUIIO_VERS,
          L.CUATM   
        FROM USER_BANCU.EI_78_1044 L
        
                INNER JOIN CIS2.VW_CL_CUATM C ON C.CODUL = L.CUATM
                INNER JOIN CIS2.RENIM R ON R.CUIIO = L.CUIIO AND R.CUIIO_VERS = L.CUIIO_VERS -- AND L.CUATM = R.CUATM; 
                
                
                
--                 UPDATE USER_BANCU.EI_78_1044
--        
--                   SET CUIIO_VERS = 2009;