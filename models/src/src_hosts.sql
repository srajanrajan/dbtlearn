with raw_hosts
as
(
  select *
  from {{ source('airbnb', 'hosts') }}
)
select 
    id host_id,
    name host_name,
    is_superhost,
    created_at,
    updated_at
from raw_hosts