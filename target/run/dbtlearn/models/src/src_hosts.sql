
  create or replace  view airbnb.dev.src_hosts
  
   as (
    with raw_hosts
as
(
  select *
  from AIRBNB.RAW.RAW_HOSTS
)
select 
    id host_id,
    name host_name,
    is_superhost,
    created_at,
    updated_at
from raw_hosts
  );
