CREATE TABLE Titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(100)
);
CREATE TABLE Departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(100)
);
CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5),
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1),
    hire_date DATE,
    FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);
CREATE TABLE Salaries (
    emp_no INT PRIMARY KEY,
    salary INT,
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
CREATE TABLE DepartmentEmployee (
    emp_no INT,
    dept_no VARCHAR(4),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);
CREATE TABLE DepartmentManager (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- Titles Table
COPY Titles(title_id, title)
FROM '/data/titles.csv'
DELIMITER ','
CSV HEADER;

-- Departments Table
COPY Departments(dept_no, dept_name)
FROM '/data/departments.csv'
DELIMITER ','
CSV HEADER;

-- Employees Table
COPY Employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM '/data/employees.csv'
DELIMITER ','
CSV HEADER;

-- Salaries Table
COPY Salaries(emp_no, salary)
FROM '/data/salaries.csv'
DELIMITER ','
CSV HEADER;

-- DepartmentEmployee Table
COPY DepartmentEmployee(emp_no, dept_no)
FROM '/data/dept_emp.csv'
DELIMITER ','
CSV HEADER;

-- DepartmentManager Table
COPY DepartmentManager(dept_no, emp_no)
FROM '/data/dept_manager.csv'
DELIMITER ','
CSV HEADER;