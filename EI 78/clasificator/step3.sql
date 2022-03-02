with rws as (
  select 'split,into,rows' str from dual
)
  select regexp_substr (
           str,
           '[^,]+',
           1,
           level
         ) value
  from   rws
  connect by level <= 
    length ( str ) - length ( replace ( str, ',' ) ) + 1;
    
--VALUE   
--split    
--into     
--rows