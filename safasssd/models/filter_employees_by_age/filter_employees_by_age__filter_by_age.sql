{{
  config({    
    "materialized": "table",
    "alias": "filtered_employees_by_age",
    "database": "sony",
    "schema": "orch_test"
  })
}}

WITH employees_data AS (

  SELECT
      employee_id,
      first_name,
      last_name,
      department,
      age,
      salary,
      hire_date
    FROM (
      VALUES
        (1, 'John', 'Smith', 'Engineering', 28, 85000, DATE '2020-01-15'),
        (2, 'Jane', 'Doe', 'Engineering', 35, 92000, DATE '2019-06-20'),
        (3, 'Bob', 'Johnson', 'Sales', 42, 75000, DATE '2021-03-10'),
        (4, 'Alice', 'Williams', 'Marketing', 29, 68000, DATE '2020-11-05'),
        (5, 'Charlie', 'Brown', 'Engineering', 55, 105000, DATE '2018-02-28'),
        (6, 'Diana', 'Davis', 'Sales', 31, 72000, DATE '2022-01-12'),
        (7, 'Edward', 'Miller', 'Marketing', 48, 78000, DATE '2019-09-15'),
        (8, 'Fiona', 'Wilson', 'Engineering', 26, 70000, DATE '2023-04-01'),
        (9, 'George', 'Taylor', 'Sales', 39, 82000, DATE '2020-07-22'),
        (10, 'Helen', 'Anderson', 'Marketing', 52, 88000, DATE '2017-11-30')
    ) AS t(employee_id, first_name, last_name, department, age, salary, hire_date)

),

filter_by_age AS (

  SELECT * 
  
  FROM employees_data
  
  WHERE age >= {{ var('min_age_threshold') }}

),

sorted_employees AS (

  SELECT * 
  
  FROM filter_by_age
  
  ORDER BY age DESC

)

SELECT *

FROM sorted_employees
