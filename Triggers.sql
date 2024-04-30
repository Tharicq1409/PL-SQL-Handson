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
select * from open_source;

update open_source set top_projects = 'VLC Media Player' 
where top_projects = 'VLC media player';


