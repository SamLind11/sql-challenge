drop table if exists departments;
drop table if exists dept_emp;
drop table if exists dept_managers;
drop table if exists employees;
drop table if exists salaries;
drop table if exists titles;

-- Create titles table.
create table titles (
	title_id varchar(6) unique primary key,
	title varchar(20) not null
);

-- Create employees table.
create table employees (
	emp_no int unique primary key not null,
	emp_title_id varchar(6) not null,
	foreign key (emp_title_id) references titles(title_id),
	birth_date date not null,
	first_name varchar(20) not null,
	last_name varchar(30) not null,
	sex varchar(2),
	hire_date date not null
);

-- Create salaries table.
create table salaries (
	emp_no int unique primary key not null,
	foreign key (emp_no) references employees(emp_no),
	salary int not null
);

-- Create departments table.
create table departments (
	dept_no varchar(4) unique primary key not null,
	dept_name varchar(25) not null
);

-- Create junction table for employees and departments.
create table dept_emp (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	dept_no varchar(4) not null,
	foreign key (dept_no) references departments(dept_no),
	constraint dept_emp_key primary key (emp_no, dept_no)
);

-- Create junction table for departments and their managers.
create table dept_manager (
	dept_no varchar(4) not null,
	foreign key (dept_no) references departments(dept_no),
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	constraint dept_manager_key primary key (dept_no, emp_no)
);
