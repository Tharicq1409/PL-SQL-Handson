--Triggers
set serveroutput on;

--Examples DML Triggers

CREATE TABLE open_source (
    top_projects VARCHAR2(30)
);


--Trigger for DML statements
CREATE OR REPLACE TRIGGER gnu_trigger_DML
BEFORE INSERT OR UPDATE OR DELETE ON open_source
FOR EACH ROW
ENABLE 
DECLARE
    v_user VARCHAR2(30);
BEGIN
    SELECT user INTO v_user
    FROM dual;
    
    IF inserting THEN
        dbms_output.put_line(v_user || ' Inserted one row in TABLE: OPEN_SOURCE.');
        
    ELSIF deleting THEN
        dbms_output.put_line(v_user || ' Deleted one row in TABLE: OPEN_SOURCE.');
        
    ELSIF updating THEN
        dbms_output.put_line(v_user || ' Updated one row in TABLE: OPEN_SOURCE.');
        
    END IF;
END;
/


insert into open_source values('Linux Kernel');
insert into open_source values('VLC media player');
insert into open_source values('Firefox');
insert into open_source values('Gimp');
insert into open_source values('Blender');
insert into open_source values('PostgreSQL');
insert into open_source values('openvpn');
select * from open_source;

update open_source set top_projects = 'VLC Media Player' 
where top_projects = 'VLC media player';

update open_source set top_projects = 'VLC Media Player' 
where top_projects = 'VLC media player';
--Table Auditing

CREATE TABLE audit_gnu (
    new_name   VARCHAR2(30),
    old_name   VARCHAR2(30),
    user_name  VARCHAR2(30),
    entry_date VARCHAR2(30),
    operation  VARCHAR2(30)
);

select * from audit_gnu;

create or replace trigger gnu_audit_trigger
before INSERT OR UPDATE OR DELETE ON open_source
for each row
enable
declare
    v_user varchar2(30);
    v_date varchar2(30);
begin
    select user, to_char(sysdate,'DD/MM/YYYY HH24:MI:SS')
    INTO v_user,v_date from dual;
    
    IF inserting THEN
        insert into audit_gnu(new_name, old_name, user_name, entry_date, operation)
        values(:NEW.top_projects, NULL, v_user, v_date, 'Insert');
        
    ELSIF deleting THEN
        insert into audit_gnu(new_name, old_name, user_name, entry_date, operation)
        values(NULL, :OLD.top_projects, v_user, v_date, 'Delete');
        
    ELSIF updating THEN
        insert into audit_gnu(new_name, old_name, user_name, entry_date, operation)
        values(:NEW.top_projects, :OLD.top_projects, v_user, v_date, 'Update');
    end if;
end;
/


