
  create or replace  view airbnb.dev.dim_hosts_cleansed
  
   as (
    
WITH  __dbt__cte__src_hosts as (
with raw_hosts
as
(
  select *
  from airbnb.raw.raw_hosts
)
select 
    id host_id,
    name host_name,
    is_superhost,
    created_at,
    updated_at
from raw_hosts
),src_hosts AS (
    SELECT
        *
    FROM
        __dbt__cte__src_hosts
)
SELECT
    host_id,
    NVL(
        host_name,
        'Anonymous'
    ) AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts
  );
