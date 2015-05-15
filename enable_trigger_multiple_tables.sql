------------------------------------------------------------------------
-- CREATE TRIGGERS
------------------------------------------------------------------------
select 'DROP TRIGGER IF EXISTS audit_trigger_stm ON '||table_name|| '; CREATE TRIGGER audit_trigger_stm AFTER TRUNCATE ON '||table_name|| ' FOR EACH STATEMENT EXECUTE PROCEDURE audit.if_modified_func(''true''); ALTER TABLE '||table_name||' ENABLE TRIGGER audit_trigger_stm;' 
from information_schema.tables where table_schema = 'public' and table_name ilike 'tb_%';

select 'DROP TRIGGER IF EXISTS audit_trigger_stm ON '||table_name|| '; CREATE TRIGGER audit_trigger_stm_row AFTER INSERT OR DELETE OR UPDATE ON '||table_name|| ' FOR EACH ROW EXECUTE PROCEDURE audit.if_modified_func(''true''); ALTER TABLE '||table_name||' ENABLE TRIGGER audit_trigger_stm_row;' 
from information_schema.tables where table_schema = 'public' and table_name ilike 'tb_%';

------------------------------------------------------------------------
-- ENABLE TRIGGERS
------------------------------------------------------------------------
select 'ALTER TABLE '||table_name||' ENABLE TRIGGER audit_trigger_stm;'
from information_schema.tables where table_schema = 'public' and table_name ilike 'tb_%';

select 'ALTER TABLE '||table_name||' ENABLE TRIGGER audit_trigger_stm_row;'
from information_schema.tables where table_schema = 'public' and table_name ilike 'tb_%';
