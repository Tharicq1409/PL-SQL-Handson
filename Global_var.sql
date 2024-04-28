<<outer>> -- label 'used to access Global variable inside local block' 
Declare	--Outer Block 
    v_manager_name varchar2(30) := 'PETER';	-- Global Variable 
	v_doj date := '15-JUN-2015'; 
Begin 
    declare			-- Inner Block 
        v_emp_name varchar2(20) DEFAULT 'TOMMY';	-- Local Variable 
		v_doj date := '14-SEP-2015'; 
    begin 
        DBMS_OUTPUT.PUT_LINE('Local Variable : Employee ' || v_emp_name); 
		DBMS_OUTPUT.PUT_LINE('EMP_DOJ : ' || v_doj); 
		DBMS_OUTPUT.PUT_LINE('Global Variable Priniting from Inner Block : Manager ' || v_manager_name); 
		DBMS_OUTPUT.PUT_LINE('MANAGER_DOJ : ' || outer.v_doj || ' Printing from inner block using label');	 
    end; 
DBMS_OUTPUT.PUT_LINE('Global Variable Priniting from Outer Block : Manager ' || v_manager_name); 
DBMS_OUTPUT.PUT_LINE('MANAGER_DOJ : ' || v_doj); 
End; 