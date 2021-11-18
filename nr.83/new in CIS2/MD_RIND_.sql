SELECT 
    R.RIND,
    REPLACE(REPLACE(REPLACE(R.DENUMIRE,'<b>',''),'</b>',''),'<br>','') DENUMIRE

    FROM CIS2.MD_RIND R 
    
    WHERE 
    R.CAPITOL IN (1171) 