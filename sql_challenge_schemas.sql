-- drop tables if exist

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;

-- Create tables and specify primary keys
-- Import CSV files into corresponding table

CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY NOT NULL,
    title VARCHAR NOT NULL
);

CREATE TABLE employees (
    emp_no VARCHAR PRIMARY KEY NOT NULL,
	emp_title VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE dept_emp (
	emp_no VARCHAR NOT NULL,
	dept_no VARCHAR NOT NULL
);

CREATE TABLE dept_manager (
    dept_no VARCHAR NOT NULL,
	emp_no VARCHAR NOT NULL
);

CREATE TABLE salaries (
    emp_no VARCHAR NOT NULL,
    salary INT NOT NULL
);

-- create foreign keys to tie all tables together
ALTER TABLE employees ADD CONSTRAINT "fk_emp_emp_title" FOREIGN KEY (emp_title) REFERENCES titles(title_id);
ALTER TABLE dept_emp ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
ALTER TABLE dept_emp ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_manager ADD CONSTRAINT "fk_dept_man_dept_no" FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT "fk_dept_man_emp_no" FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE salaries ADD CONSTRAINT "fk_sal_emp_no" FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
