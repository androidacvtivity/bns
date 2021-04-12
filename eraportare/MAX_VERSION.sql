SELECT MR.*



  from CIS2.MD_RIND MR 

   INNER JOIN (


        select 
        capitol,
        MAX(CAPITOL_VERS) CAPITOL_VERS  

        from CIS2.MD_RIND
        
        GROUP BY 
        CAPITOL
        ) MD ON MD.CAPITOL = MR.CAPITOL AND MD.CAPITOL_VERS = MR.CAPITOL_VERS 
        
        
        
        WHERE 
        MR.CAPITOL = 100
        
        
        
        ORDER BY 
        MR.CAPITOL,
        MR.CAPITOL_VERS,
        MR.FORM, 
        MR.RIND
        