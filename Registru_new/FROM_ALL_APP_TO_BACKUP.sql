BEGIN
  FOR t IN (SELECT object_name, object_type FROM all_objects WHERE owner='ALL_APP' AND object_type IN ('TABLE','VIEW','PROCEDURE','FUNCTION','PACKAGE')) LOOP
    IF t.object_type IN ('TABLE','VIEW') THEN
      EXECUTE IMMEDIATE 'GRANT SELECT, UPDATE, INSERT, DELETE ON ALL_APP.'||t.object_name||' TO BACKUP';
    ELSIF t.object_type IN ('PROCEDURE','FUNCTION','PACKAGE') THEN
      EXECUTE IMMEDIATE 'GRANT EXECUTE ON ALL_APP.'||t.object_name||' TO BACKUP';
    END IF;
  END LOOP;
END;


BEGIN
  FOR t IN (SELECT object_name, object_type FROM all_objects WHERE owner='BACKUP' AND object_type IN ('TABLE','VIEW','PROCEDURE','FUNCTION','PACKAGE')) LOOP
    IF t.object_type IN ('TABLE','VIEW') THEN
      EXECUTE IMMEDIATE 'GRANT SELECT, UPDATE, INSERT, DELETE ON BACKUP.'||t.object_name||' TO ALL_APP';
    ELSIF t.object_type IN ('PROCEDURE','FUNCTION','PACKAGE') THEN
      EXECUTE IMMEDIATE 'GRANT EXECUTE ON BACKUP.'||t.object_name||' TO ALL_APP';
    END IF;
  END LOOP;
END;