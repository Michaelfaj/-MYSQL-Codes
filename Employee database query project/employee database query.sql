use employees;

# ----------------------------------------------------------------- #
/* In the employee Database, different employees signs a new contract every time they get a raise which is recorded in the database. 
   Some employees signed a new contract after the end of the previous while some others have signed contracts before an existing contract ends. */
   
/*I Computed current employee no, their first names, their current departments, their most recent salary and the average salary in their current department(gives a comparison with each employees salary)
Here, i'll use the JOINS and WINDOW funtion to execute this query */

# QUERY 1 ▼▼▼

SELECT 
    tb1.emp_no, tb4.first_name as first_name, tb3.dept_name, tb2.salary,
    AVG(tb2.salary) OVER(PARTITION BY tb1.dept_no) as department_average
FROM
    (SELECT 
        emp_no, dept_no, MAX(from_date) AS from_date
    FROM
        dept_emp
WHERE to_date > sysdate()
    GROUP BY emp_no) tb1
        JOIN
    (SELECT 
        emp_no, salary, MAX(from_date) AS from_date, to_date
    FROM
        salaries
    WHERE
        to_date > SYSDATE()
    GROUP BY emp_no) tb2 ON tb1.emp_no = tb2.emp_no
    JOIN 
		(select * FROM departments d) tb3 ON  tb1.dept_no = tb3.dept_no
	JOIN 
		(SELECT * FROM employees) tb4 ON tb2.emp_no = tb4.emp_no
	GROUP by emp_no
    ORDER BY emp_no;
    
    #-----------------------------------------------------------------------------#
    #  The syntax below can as well be used, though the syntax above executes faster. therefore for efficiency, i would stick to the first syntax  
    
    # QUERY 2 ▼▼▼
    
    
    SELECT tb_d.emp_no, e.first_name as first_name, d.dept_name, tb_s.salary, AVG(tb_s.salary) OVER (PARTITION BY tb_d.dept_no) as AVg_salary_per_department
    FROM 
		(SELECT 
			de.emp_no, de.dept_no, de.from_date, de.to_date
		FROM 
			dept_emp de
			JOIN
		(SELECT
			emp_no, MAX(from_date) AS from_date
        FROM 
			dept_emp
        GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
        WHERE
			de.to_date > SYSDATE()
		AND de.from_date = de1.from_date) tb_d
             JOIN 
		(SELECT 
			s1.emp_no, s.salary, s.from_date, s.to_date
        FROM 
			salaries s
        JOIN
        (SELECT emp_no, MAX(from_date) as from_date
        FROM 
			salaries 
		GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
        WHERE 
			s.to_date > SYSDATE()
            AND s.from_date = s1.from_date) tb_s
	ON tb_s.emp_no = tb_d.emp_no
		JOIN
		departments d ON d.dept_no = tb_d.dept_no
        JOIN 
        employees e ON e.emp_no = tb_s.emp_no
    GROUP BY tb_d.emp_no, d.dept_name
    ORDER BY tb_d.emp_no;
    