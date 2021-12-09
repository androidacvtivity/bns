SELECT *
            FROM USER_BANCU.KAT_1_TR_AUTO;
            
    UPDATE USER_BANCU.KAT_1_TR_AUTO
            
            SET CUIIO_VERS = 2010; 
            
            
            
            COMMIT;
            
            
            SELECT 
            
            CUIIO,
            CUIIO_VERS,
            DENUMIRE,
            REPLACE(CUATM,'O','0') CUATM,
            CFP,
            CFOJ,
            CAEM2
            
            FROM USER_BANCU.KAT_1_TR_AUTO;
            
              UPDATE USER_BANCU.KAT_1_TR_AUTO
            
            SET CUATM = REPLACE(CUATM,'O','0');
            
            
            