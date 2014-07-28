-- enable audit trigger to all tables of a specific schema

select 'CREATE TRIGGER audit_trigger_stm AFTER TRUNCATE ON '||table_name|| ' FOR EACH STATEMENT EXECUTE PROCEDURE audit.if_modified_func(''true'');' 
from information_schema.tables where table_schema = 'public' and table_name ilike 'tb_%';

select 'CREATE TRIGGER audit_trigger_stm_row AFTER INSERT OR DELETE OR UPDATE ON '||table_name|| ' FOR EACH ROW EXECUTE PROCEDURE audit.if_modified_func(''true'');' 
from information_schema.tables where table_schema = 'public' and table_name ilike 'tb_%';
