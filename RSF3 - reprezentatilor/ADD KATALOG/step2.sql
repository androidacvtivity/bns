

SELECT CUIIO 
        FROM USER_BANCU.RSF_REPREZENTANTA_2009;
        
        
         SELECT 
         L.CUIIO,
         L.CUIIO_VERS,
         L.DENUMIRE,
         L.CUATM,
         L.CFP,
      
         L.CAEM2,
         L.IDNO
            FROM USER_BANCU.RSF_REPREZENTANTA_2009 L;
        
        ;
        
        
        update USER_BANCU.RSF_REPREZENTANTA_2009
        
        SET CUIIO_VERS = 2009;