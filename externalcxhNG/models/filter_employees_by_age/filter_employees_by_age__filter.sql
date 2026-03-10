{{
  config({    
    "materialized": "table",
    "alias": "filtered_employees_by_age",
    "database": "qa_team",
    "schema": "qa_database"
  })
}}

WITH demographics_source AS (

  SELECT * 
  
  FROM {{ source('qa_team.qa_database', 'demographics') }}

),

filtered_by_age AS (

  SELECT * 
  
  FROM demographics_source
  
  WHERE age_group = {{ var('age_group') }}

)

SELECT *

FROM filtered_by_age
