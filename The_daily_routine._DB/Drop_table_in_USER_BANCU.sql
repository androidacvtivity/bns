


    BEGIN 
    
    FOR REC IN (
    
     
              select table_name
              from   all_tables
              
              WHERE 
              OWNER IN ('USER_BANCU') 
              AND TABLE_NAME LIKE 'CIS%'
              ----
    
    )
    
    loop
    execute immediate 'drop table '||rec.table_name;
  end loop;  
    
 END;