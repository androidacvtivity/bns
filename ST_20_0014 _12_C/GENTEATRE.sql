


SELECT A.*
  FROM

(

        SELECT 
        1 CODUL,
        'Teatre profesionale ' DENUMIRE,
        1 ORDINE
        
        FROM DUAL
        
        UNION ALL 
        
        
        SELECT 
        2 CODUL,
        'de operă şi balet' DENUMIRE,
        2 ORDINE
        
        FROM DUAL
        
        UNION ALL 
        
        SELECT 
        3 CODUL,
        'dramatice, de comedie şi muzicale' DENUMIRE,
        3 ORDINE
        
        FROM DUAL
        

        UNION ALL 
        
        SELECT 
        4 CODUL,
        'pentru copii şi tineret' DENUMIRE,
        4 ORDINE
        
        FROM DUAL
           
        
         UNION ALL 
        
        SELECT 
        5 CODUL,
        'de păpuşi' DENUMIRE,
        5 ORDINE
        
        FROM DUAL
        
        UNION ALL 
        
        SELECT 
        6 CODUL,
        'Studiou teatral' DENUMIRE,
        6 ORDINE
        
        FROM DUAL
        
        
         UNION ALL 
        
        SELECT 
        7 CODUL,
        'Organizaţii concertistice de impresariat' DENUMIRE,
        7 ORDINE
        
        FROM DUAL
        
        
        
         UNION ALL 
        
        SELECT 
        8 CODUL,
        'Organizaţii concertistice' DENUMIRE,
        8 ORDINE
        
        FROM DUAL
        
        
         UNION ALL 
        
        SELECT 
        9 CODUL,
        'Circ' DENUMIRE,
        9 ORDINE
        
        FROM DUAL
        ) A 