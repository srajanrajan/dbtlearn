
      

      create or replace transient table airbnb.dev.scd_raw_hosts  as
      (

    select *,
        md5(coalesce(cast(id as varchar ), '')
         || '|' || coalesce(cast(updated_at as varchar ), '')
        ) as dbt_scd_id,
        updated_at as dbt_updated_at,
        updated_at as dbt_valid_from,
        nullif(updated_at, updated_at) as dbt_valid_to
    from (
        



select * FROM airbnb.raw.raw_hosts

    ) sbq



      );
    
  