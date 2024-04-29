set serveroutput on;
--CURSORS

DECLARE
    v_name employees.first_name%TYPE; --declaring variable
    CURSOR demo_cur IS      --declaring cursor
    SELECT first_name FROM employees
    WHERE employee_id > 105;

BEGIN
    OPEN demo_cur;  -- Open cursor
    LOOP
        FETCH demo_cur INTO v_name;
        dbms_output.put_line(v_name);
        EXIT WHEN demo_cur%notfound;    --%Not Found Attribute
    END LOOP;

    CLOSE demo_cur; --Close cursor
END;
/